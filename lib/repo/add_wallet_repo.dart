import '../helper/network/network_api_services.dart';
import '../model/create_session_model.dart';
import '../res/app_url_const.dart';

class AddWalletRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  ////////// *************** Add Wallet Session Create *************** //////////
  Future<CreateSessionModel> addWalletSessionCreate(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppApiUrls.addWalletSessionCreate, data);
      return CreateSessionModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
////////// *************** Add Wallet Session Create End *************** //////////
}