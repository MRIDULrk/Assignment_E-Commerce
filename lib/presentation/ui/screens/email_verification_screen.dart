
import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/snack_message.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController emailTEcontroller = TextEditingController();
  final EmailVerificationController _emailVerificationController =
  Get.find<EmailVerificationController>();


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(34),
          child: Form(
            key: _formkey,

            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 82),
                const AppLogoWidget(),
                const SizedBox(height: 16),
                Text('Welcome Back',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailTEcontroller,
                  decoration: const InputDecoration(),
                  validator: (String? value){

                   if(value?.isEmpty ?? true){

                     return 'Enter Your Email';

                   }else{

                     return null;
                   }

                  },

                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    moveToNextScreen();
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Future<void> moveToNextScreen() async {

    if(_formkey.currentState!.validate()){

      return;

    }else{

      bool result = await _emailVerificationController.
      verifyEmail(emailTEcontroller.text.trim());

      if(result){
        Get.off(()=>const OtpVerificationScreen());

      }else{

        if(mounted){
          showSnackBarMessage(context, _emailVerificationController.errorMessage!,true);

        }
        



      }



    }



  }


  @override
  void dispose() {
    emailTEcontroller.dispose();
    super.dispose();
  }


}
