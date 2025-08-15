import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:crickAdda/generated/assets.dart';
import 'package:crickAdda/res/app_const.dart';
import 'package:crickAdda/res/color_const.dart';
import 'package:crickAdda/res/sizes_const.dart';
import 'package:crickAdda/utils/utils.dart';
import 'package:crickAdda/view_model/basic_app_feature_view_model.dart';
import 'package:crickAdda/view_model/notification_view_model.dart';
import 'package:crickAdda/view_model/services/bottom_navigation_service.dart';
import '../../view_model/game_view_model.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<GameViewModel>(context, listen: false).getGameType(context);
      Provider.of<BasicAppFeatureViewModel>(context, listen: false).getHomeBanner();
      Provider.of<BasicAppFeatureViewModel>(context, listen: false).getHomePromoStory();
      Provider.of<GameViewModel>(context, listen: false).getMatchType(context);
      Provider.of<NotificationViewModel>(context, listen: false).fetchNotification(AppConstants.notificationTypeAll);
    });
  }
  Future<bool> onWillPop() async {
    return await Utils.showExitConfirmation(context) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationViewModel>(
      builder: (context, bottomNavigationProvider, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (_) {
            onWillPop();
          },
          child: Scaffold(
            backgroundColor: AppColor.whiteColor,
            body: Center(
              child: bottomNavigationProvider.widgetOptions.elementAt(bottomNavigationProvider.initBottomNavItemIndex),
            ),
            bottomNavigationBar:BottomNavigationBar(
            backgroundColor: AppColor.whiteColor,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Assets.assetsSplashLogo),
                  color: null,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.stadium),
                label: 'My Match',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.gift),
                label: 'Rewards',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(CupertinoIcons.chat_bubble_2),
              //   label: 'Chat',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group_add_rounded),
                label: 'Refer & Earn',
              ),
            ],
            currentIndex: bottomNavigationProvider.initBottomNavItemIndex,
            selectedItemColor:
            AppColor.primaryRedColor,
            unselectedItemColor: AppColor.textGreyColor,
            onTap: (v) {
              bottomNavigationProvider.updateBottomNavItemIndex(v,context);
            },
            selectedLabelStyle: GoogleFonts.poppins(fontSize: Sizes.fontSizeOne),
            unselectedLabelStyle: GoogleFonts.poppins(fontSize: Sizes.fontSizeOne),
            selectedFontSize: Sizes.fontSizeOne,
          ),
          ),
        );
      }
    );
  }
}
