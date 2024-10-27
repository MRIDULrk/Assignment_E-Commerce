import 'package:crafty_bay/presentation/ui/screens/Complete_Profile_Screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(34),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 82),
              const AppLogoWidget(),
              const SizedBox(height: 16),
              Text('Enter OTP Code',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text(
                'A 6 Digit OTP Will Sent to Your Email',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 8),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.green,
                  inactiveFillColor: Colors.white,
                  inactiveColor: AppColors.themeColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEcontroller,
                appContext: context,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  moveToNextScreen();
                },
                child: const Text('Next'),
              ),
              const SizedBox(height: 24),

              RichText(
                text:  TextSpan(text: 'This Code Will Expire In ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                     color: Colors.grey,
                    ),
                    children: const [
                    TextSpan(
                      text: '120s',
                      style: TextStyle(color: AppColors.themeColor),
                  )
                ]),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {

                },
                child: const Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void moveToNextScreen(){
    Get.off(()=>const CompleteProfileScreen());
  }

}
