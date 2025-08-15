import 'package:crickAdda/res/sizes_const.dart';
import 'package:crickAdda/view/const_widget/container_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../res/app_const.dart';
import '../../res/color_const.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../const_widget/button_const.dart';
import '../const_widget/text_const.dart';
import '../const_widget/text_field_const.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {



  DateTime? selectedDate; // Stores selected DOB


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (context, authProvider, child) {
          return Scaffold(
            backgroundColor: AppColor.whiteColor,
            body: ContainerConst(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Sizes.spaceHeight25,
                    const CircleAvatar(radius: 45,backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/1.jpg"),),
                    Sizes.spaceHeight15,
                    TextConst(text: "You're all set to play!", fontSize: Sizes.fontSizeThree,fontWeight: FontWeight.w600,),
                    Sizes.spaceHeight10,
                    const TextConst(text: "Start your new innings with\n${AppConstants.appName}. Tell us your name",textAlign: TextAlign.center,),
                    Sizes.spaceHeight15,
                    nameTextField(authProvider.nameController, "Enter your name",),
                    Sizes.spaceHeight15,
                    nameTextField(authProvider.emailController, "Enter your email",),
                    Sizes.spaceHeight15,
                    dobField(authProvider),
                    Sizes.spaceHeight25,
                    ContainerConst(
                        color: Colors.blueGrey.shade50,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: TextConst(text: "Note: We will use this to generate a name for your team. You can change your team's name later.", fontSize: Sizes.fontSizeOne,textColor: AppColor.textGreyColor,)),
                    Sizes.spaceHeight20,
                    authProvider.state== AuthState.loading?
                    Utils.loadingGreen:
                    ButtonConst(
                      onTap: () {
                        if (authProvider.nameController.text.isEmpty) {
                          Utils.showErrorMessage(context, "Please enter your name to continue");
                          return;
                        }
                        if (authProvider.emailController.text.isEmpty) {
                          Utils.showErrorMessage(context, "Please enter your email to continue");
                          return;
                        }
                        if (authProvider.dobController.text.isEmpty) {
                          Utils.showErrorMessage(context, "Please enter your DOB to continue");
                          return;
                        }
                        authProvider.register(context);
                      },
                      label: "SAVE NAME",
                      color: authProvider.isFormFilled()
                          ? AppColor.activeButtonGreenColor
                          : Colors.grey.withOpacity(0.5),
                      textColor: authProvider.isFormFilled() ? Colors.white : AppColor.textGreyColor,
                    ),

                    Sizes.spaceHeight10,
                    // ButtonConst(
                    //   onTap: (){
                    //       authProvider.register(context);
                    //    },
                    //   label: "i'll do it later".toUpperCase(),border: Border.all(color:AppColor.textGreyColor),textColor: AppColor.blackColor,color: Colors.white,),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget dobField(AuthViewModel authProvider) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime(2000),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null && pickedDate != selectedDate) {
          setState(() {
            selectedDate = pickedDate;
          });

          authProvider.dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      },
      child: Container(
        width: Sizes.screenWidth * 0.92,
        height: Sizes.screenHeight * 0.06,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColor.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          border: const Border(
            bottom: BorderSide(
              color: AppColor.blackColor,
              width: 1.0,
            ),
          ),
        ),
        child: TextConst(
          text: selectedDate != null
              ? DateFormat('MMMM dd, yyyy').format(selectedDate!)
              : "Select Date of Birth",
          alignment: Alignment.centerLeft,
          textColor: AppColor.textGreyColor,
        ),
      ),
    );
  }


  Widget nameTextField(
      TextEditingController controller,
      String labelText, {
        Widget? suffix,
        VoidCallback? onTap,
        bool readOnly = false,
      }) {
    return TextFieldConst(
      onTap: onTap,
      readOnly: readOnly, // Only true for DOB field
      fillColor: AppColor.scaffoldBackgroundColor,
      filled: true,
      controller: controller,
      fieldRadius: const BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
      contentPadding: const EdgeInsets.only(top: 8, bottom: 3, left: 10, right: 10),
      borderSide: const BorderSide(),
      borderSideFocus: const BorderSide(),
      label: TextConst(
        text: labelText,
        alignment: Alignment.centerLeft,
        textColor: AppColor.textGreyColor,
      ),
      fontWeight: FontWeight.w500,
      sufixIcon: suffix,
    );
  }


}
