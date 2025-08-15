import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../model/create_session_model.dart';
import '../repo/add_wallet_repo.dart';
import '../res/SharedPreferencesUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';

class AddWalletViewModel with ChangeNotifier {
  final _addWalletSession = AddWalletRepository();

  CreateSessionModel? _addWalletResponse;
  CreateSessionModel? get addWalletResponse => _addWalletResponse;

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  // Payment status states
  bool _paymentSuccess = false;
  bool get paymentSuccess => _paymentSuccess;

  String? _paymentError;
  String? get paymentError => _paymentError;

  final CFPaymentGatewayService cfPaymentGatewayService = CFPaymentGatewayService();

  AddWalletViewModel() {
    _setupPaymentCallbacks();
  }

  void _setupPaymentCallbacks() {
    cfPaymentGatewayService.setCallback(
          (orderId) => _onPaymentSuccess(orderId),
          (error, orderId) => _onPaymentError(error, orderId),
    );
  }

  void _onPaymentSuccess(String orderId) {
    _paymentSuccess = true;
    _paymentError = null;
    notifyListeners();
    // Handle successful payment (update wallet balance, etc.)
  }
  void _onPaymentError(dynamic error, String orderId) {
    _paymentSuccess = false;

    // Handle different error types
    String errorMessage;
    if (error is Exception) {
      errorMessage = error.toString();
    }
    else if (error is String) {
      errorMessage = error;
    }
    else if (error != null && error is Object && error.toString().contains("getMessage")) {
      // Handle Cashfree error object with getMessage()
      errorMessage = error.toString();
    }
    else {
      errorMessage = "Unknown payment error";
    }

    _paymentError = "Payment Failed: $errorMessage (Order ID: $orderId)";
    notifyListeners();
  }
  setAddWalletSessionModel(CreateSessionModel data) {
    _addWalletResponse = data;
    notifyListeners();
  }

  Future<void> addWalletSessionCreate(dynamic amount, BuildContext context) async {
    try {
      _isProcessing = true;
      _paymentSuccess = false;
      _paymentError = null;
      notifyListeners();

      final userId = await Provider.of<SharedPrefViewModel>(context, listen: false).loadUserToken();

      Map<String, dynamic> data = {
        "userid": userId,
        "amount": amount,
      };

      final value = await _addWalletSession.addWalletSessionCreate(data);
      setAddWalletSessionModel(value);

      if (kDebugMode) {
        print("Payment Session ID: ${value.paymentSessionId}");
      }

      await startPayment(
        value.orderId.toString(), // Use the orderId from backend response
        value.paymentSessionId.toString(),
        context, // Pass context for showing messages
      );
    } catch (error) {
      _isProcessing = false;
      _paymentError = error.toString();
      notifyListeners();

      if (kDebugMode) {
        print('Error creating wallet session: $error');
      }
      print("Error: ${error.toString()}");

      // Show error in UI
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${error.toString()}")),
      );
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<void> startPayment(String orderId, String paymentSessionId, BuildContext context) async {
    try {
      /// STEP 2: Build session
      var session = CFSessionBuilder()
          .setEnvironment(CFEnvironment.SANDBOX) // Change to PRODUCTION in live mode
          .setOrderId(orderId)
          .setPaymentSessionId(paymentSessionId)
          .build();

      /// STEP 3: Build WebCheckout payment object
      var cfWebCheckout = CFWebCheckoutPaymentBuilder()
          .setSession(session!)
          .build();

      /// STEP 4: Start payment
      cfPaymentGatewayService.doPayment(cfWebCheckout);
    } catch (e) {
      _paymentError = "Error starting payment: $e";
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Error: $e")),
      );
    }
  }
}