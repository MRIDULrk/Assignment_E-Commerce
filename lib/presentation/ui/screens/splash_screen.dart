import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/app_logo_widgets.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }


  Future<void> moveToNextScreen()async{

    await Future.delayed(const Duration(seconds: 4));

    Get.off(()=> const MainBottomNavScreen());

  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),

              SizedBox(height: 8),

              Text('Version 1.0.0',style: TextStyle(color: Colors.grey),),
            ],

          ),
        ),
      )
    );
  }
}


