
import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _shippingAddress = TextEditingController();

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
              Text('Complete Profile',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text(
                'Get Started With Us With Your Details',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _firstName ,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _lastName ,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller:_mobile ,
                decoration: const InputDecoration(
                  hintText: 'Mobile',
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _city,
                decoration: const InputDecoration(
                  hintText: 'City',
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _shippingAddress,
                decoration: const InputDecoration(
                  hintText: 'Shipping Address',
                ),
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
    );

  }

  void moveToNextScreen(){
    Get.off(()=>const OtpVerificationScreen());
  }


  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _mobile.dispose();
    _city.dispose();
    _shippingAddress.dispose();
    super.dispose();
  }


}
