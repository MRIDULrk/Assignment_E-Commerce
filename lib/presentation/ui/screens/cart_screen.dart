
import 'package:crafty_bay/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/item_count_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late TextTheme textTheme = Theme.of(context).textTheme;


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        backToHome();
      },

      child: Scaffold(
        //backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(onPressed: (){
            backToHome();

          }, icon: const Icon(Icons.arrow_back_ios)),
        ),

        body: Column(
          children: [

            Expanded(
              child: ListView.builder(

                itemCount: 3,

                itemBuilder: (context,index){

                return Card(
                  elevation: 2,
                  margin:  const EdgeInsets.symmetric(horizontal: 16,vertical: 8),

                  //color: Colors.white,

                  child: Row(
                  children: [
                    Padding(
                      padding:  const EdgeInsets.all(12.0),
                      child: Image.asset(AssetsPath.dummyImage,
                      height: 90,
                      width: 70,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Expanded(
                      child: Column(

                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text('Title of Product',style: textTheme.titleLarge),
                                    Wrap(
                                      spacing: 8,
                                      children: [
                                      Text('Color',style: textTheme.bodyLarge?.copyWith(
                                        color:Colors.grey
                                      )),
                                      Text('Size XL',style: textTheme.bodyLarge?.copyWith(
                                        color:Colors.grey
                                      )),
                                    ],

                                    )


                                  ],
                                ),
                              ),

                              IconButton(onPressed: (){

                              }, icon: const Icon(Icons.delete,color: Colors.grey,size: 32,))
                            ],



                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$1000',style: textTheme.titleLarge!.copyWith(
                                color: AppColors.themeColor
                              )),
                              itemCountButton(

                              ),

                            ],
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              );

            },
              ),
            ),

            Container(
              child: buildPriceAndAddToCartSection(),

            ),
          ],
        ),





      ),
    );
  }

  Widget buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.lightBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Text(
                '\$100000',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }

  void backToHome(){
    Get.find<BottomNavBarController>().backToHomeInController();
  }
}
