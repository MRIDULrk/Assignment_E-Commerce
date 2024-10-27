
import 'package:crafty_bay/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        backToHome();
      },

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
          leading: IconButton(onPressed: (){
            backToHome();

          }, icon: const Icon(Icons.arrow_back_ios)),
        ),

        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              mainAxisSpacing:8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context,index){
             // return const ProductCard();
            },
          ),
        ),


      ),
    );
  }

  void backToHome(){
    Get.find<BottomNavBarController>().backToHomeInController();
  }

}
