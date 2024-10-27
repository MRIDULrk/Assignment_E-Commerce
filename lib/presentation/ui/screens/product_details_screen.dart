import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/item_count_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/product_details_controller.dart';
import '../widgets/color_picker.dart';
import 'centered_circular_progress_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  @override
  void initState() {

    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {

          if(productDetailsController.inProgress){

            return const CenteredCircularProgressIndicator();
          }

          if(productDetailsController.errorMessage != null){

            return Center(child: Text(productDetailsController.errorMessage!));
          }

          return Column(
            children: [
              Expanded(
                child: buildProductDetails(productDetailsController.product!),
              ),
              buildPriceAndAddToCartSection(productDetailsController.product!),
            ],
          );
        }
      ),
    );
  }

  Widget buildProductDetails(ProductDetailsModel productDetails) {
    return SingleChildScrollView(
      child: Column(
        children: [
           ProductImageSlider(sliderUrls: [
            productDetails.img1!,
             productDetails.img2!,
             productDetails.img3!,
             productDetails.img4!,
          ],),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                         productDetails.product?.title ?? '',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    const itemCountButton(),
                  ],
                ),
                const SizedBox(height: 8),

                buildRatingAndReviewSection(productDetails),

                const SizedBox(height: 8),


                SizePicker(
                    sizes: productDetails.color!.split(','),
                    onSizeSelected: (String selectedSize) {}),
                // ColorPicker(
                //     colors: const [
                //       Colors.red,
                //       Colors.green,
                //       Colors.yellow,
                //       Colors.blue,
                //       Colors.blueGrey,
                //     ], onColorSelected: (color) {
                //
                // }),

                const SizedBox(height: 8),
                SizePicker(
                    sizes: productDetails.size!.split(','),
                    onSizeSelected: (String selectedSize) {}),

                const SizedBox(height: 16),
                buildDescriptionSection(productDetails),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescriptionSection(ProductDetailsModel product) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text( product.product?.shortDes ?? ''
                   ,
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              );
  }

  Widget buildRatingAndReviewSection(ProductDetailsModel product) {
    return Wrap(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber),
            const SizedBox(width: 4),
             Text(
              '${product.product ?.star ??''}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Review',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.themeColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 4),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(Icons.favorite_outline_rounded, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildPriceAndAddToCartSection(ProductDetailsModel product) {
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
              Text(
                '\$${product.product?.price}',
                style: const TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: _onTapAddToCart,
              child: const Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapAddToCart() async {

    bool isLoggedInUser = await Get.find<AuthController>().isLoggedInUser();

    if(isLoggedInUser){



    }else{

      Get.to(()=>const EmailVerificationScreen());

    }




  }



}
