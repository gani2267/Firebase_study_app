import 'package:firebase_study_app/config/themes/app_colors.dart';
import 'package:firebase_study_app/config/themes/ui_parameters.dart';
import 'package:firebase_study_app/controllers/zoom_drawer_controller.dart';
import 'package:firebase_study_app/widgets/common/drawer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomDrawerController>{
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(context)
      ),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: onSurfaceTextColor)
          )
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                  right: 0,
                  child: BackButton(color: Colors.white,
                onPressed: (){
                   controller.toogleDrawer();
                },
              )),

              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width*0.3,
                ),
                child: Column(
                  children: [
                    Obx(() => controller.user.value==null?
                    SizedBox():
                        Text(
                          controller.user.value!.displayName??'',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: onSurfaceTextColor
                          ),
                        )
                    ),

                    const Spacer(flex: 1,),
                    DrawerButton(icon: Icons.web,
                        label: "website",
                        onPressed: () => controller.website()),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: DrawerButton(icon: Icons.email,
                          label: "email",
                          onPressed: ()=> controller.email()),
                    ),
                    const Spacer(flex: 4,),
                    DrawerButton(icon: Icons.logout,
                        label: "logout",
                        onPressed: ()=> controller.signOut()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
