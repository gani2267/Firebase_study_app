import 'package:firebase_study_app/config/themes/app_colors.dart';
import 'package:firebase_study_app/config/themes/custom_text_styles.dart';
import 'package:firebase_study_app/config/themes/ui_parameters.dart';
import 'package:firebase_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_study_app/controllers/zoom_drawer_controller.dart';
import 'package:firebase_study_app/screens/home/menu_screen.dart';
import 'package:firebase_study_app/screens/home/question_card.dart';
import 'package:firebase_study_app/widgets/app_circle_button.dart';
import 'package:firebase_study_app/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../widgets/AppIcons.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {

    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_){
          return ZoomDrawer(
            borderRadius: 50.0,
            controller: _.zoomDrawerController,
            showShadow: true,
            angle: 0,
            style: DrawerStyle.DefaultStyle,

            backgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: MediaQuery.of(context).size.width*0.6,
            mainScreen: Container(
              decoration: BoxDecoration(
                  gradient: mainGradient(context)
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCircleButton(

                            child: const Icon(AppIcons.menuLeft,),
                            onTap: controller.toogleDrawer,
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(AppIcons.peace,),
                                Text("Hello friend",
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor
                                  ),)
                              ],
                            ),
                          ),
                          Text(
                            "What do you want to learn today?",
                            style: headerText,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(()=>
                              ListView.separated(
                                  padding: UIParameters.mobileScreenPadding,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index){
                                    return QuestionCard(model: _questionPaperController.allPapers[index]);
                                  },
                                  separatorBuilder: (BuildContext context,int index){
                                    return const SizedBox(height: 20,);
                                  },
                                  itemCount: _questionPaperController.allPapers.length),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            menuScreen: MenuScreen()

          );
        },
      ),
    );
  }
}
