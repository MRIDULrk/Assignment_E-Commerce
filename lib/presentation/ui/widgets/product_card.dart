import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/item_count_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){

        Get.to(()=> ProductDetailsScreen(productId: product.id!));

      },


      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Container(
          width:160,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width:160,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(product.image??''),
                      )
                  ),
                ),
                Text(product.title ?? '',maxLines: 1,style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Text('\$${product.price}',style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.themeColor,
                    ),),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.star,color: Colors.amber),
                        Text('${product.star}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      color: AppColors.themeColor,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.favorite_outline_rounded,color: Colors.white),
                      ),
                    ),

                  ],

                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}