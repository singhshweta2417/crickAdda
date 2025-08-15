import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:crickAdda/generated/assets.dart';
import 'package:crickAdda/res/color_const.dart';
import 'package:crickAdda/view_model/services/splash_services.dart';
import '../const_widget/container_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final splashServices =
          Provider.of<SplashServices>(context, listen: false);
      splashServices.updateApkApi(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return Scaffold(
        body: ContainerConst(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      color: AppColor.primaryRedColor,
      child:
          Consumer<SplashServices>(builder: (context, splashViewModel, child) {
        return splashViewModel.loading == 0.0
            ? Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.assetsSplashLogo,
                      ),
                    ),
                    shape: BoxShape.circle),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    'Please wait while updating app...',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black54,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColor.blackColor),
                      value: splashViewModel.loading,
                      minHeight: 10,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
      }),
    ));
  }
}
