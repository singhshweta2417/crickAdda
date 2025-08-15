import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crickAdda/res/color_const.dart';
import 'package:crickAdda/res/sizes_const.dart';
import 'package:crickAdda/utils/route/app_routes.dart';
import 'package:crickAdda/view/const_widget/container_const.dart';
import 'package:crickAdda/view_model/basic_app_feature_view_model.dart';

class StoryListingScreen extends StatelessWidget {
  const StoryListingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<BasicAppFeatureViewModel>(
        builder: (context, bafCon, child) {
      if (bafCon.homeStoryPromotion!.data!.isEmpty) {
        return SizedBox.shrink();
      }
      return ContainerConst(
        height: Sizes.screenHeight / 10,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: bafCon.homeStoryPromotion!.data!.length,
            itemBuilder: (_, i) {
              final storyData = bafCon.homeStoryPromotion!.data![i];
              return Container(
                padding: const EdgeInsets.only(left: 14),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.fullPageStoryScreen,
                        arguments: {
                          'initialIndex': i,
                        });
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            Color(0xff8525eb),
                            Color(0xffdc1384),
                            Color(0xfff29105),
                            Color(0xfff3094e),
                          ])),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: Sizes.screenWidth / 6,
                        height: Sizes.screenWidth / 6,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: AppColor.whiteColor),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(storyData.promoLogo ?? "")),
                        ),
                      )),
                ),
              );
            }),
      );
    });
  }
}
