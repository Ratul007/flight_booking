import 'package:flutter/material.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_colors.dart';
import 'custom_button_style.dart';
import 'custom_elevated_button.dart';

class CustomDrawer{

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.openEndDrawer();
  }


  static Drawer customDrawer(GlobalKey<ScaffoldState> scaffoldKey) => Drawer(
      backgroundColor: AppColors.colorPrimary,
      child: Column(
        children: [
          Expanded(child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Future.delayed(Duration.zero, () {
                            CustomDrawer().closeDrawer(scaffoldKey);
                          });
                        },
                        child: Container(
                          child: Image.asset("assets/images/profilepicture.png",height: 40.v,width: 40.h),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hi, Good Morning",style: TextStyle(color: AppColors.colorAccent)),
                          Text(
                            "Jenn Gresham",
                            style: TextStyle(
                              color: AppColors.colorSecondary,
                              fontSize: 20.fSize,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),),
                ListTile(
                  leading:Icon(Icons.settings, color: AppColors.colorAccent),
                  title: GestureDetector(onTap: (){
                  },child: Text('Edit Profile',style: TextStyle(color: AppColors.colorAccent)))
                ),
                ListTile(
                  leading:Icon(Icons.history, color: AppColors.colorAccent),
                  title: GestureDetector(
                    onTap:(){

                    },
                    child: Text('Job History',style: TextStyle(color: AppColors.colorAccent)),
                  )
                ),
              ]
          )),
          /*Padding(padding: EdgeInsets.only(left: 36.h,right: 36.h),child: CustomElevatedButton(
            text: "Support",
            buttonTextStyle: AppTypography.robotoRegularPrimary16,
            height: 49.v,
            width: 386.h,
            buttonStyle: CustomButtonStyles.outlineSecondary,
            onPressed: () {},
          )),*/
          SizedBox(height: 12.v),
          Padding(padding: EdgeInsets.only(left: 36.h,right: 36.h),child: CustomElevatedButton(
            text: "Logout",
            //buttonTextStyle: AppTypography.gabaritoSemiBoldDark16,
            height: 49.v,
            width: 386.h,
            buttonStyle: CustomButtonStyles.outlineSecondary16,
            onPressed: () {},
          )),
          SizedBox(height: 40.v),
        ],
      )
  );

}