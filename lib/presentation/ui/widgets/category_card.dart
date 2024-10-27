import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_list_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Get.to(()=>
            ProductListScreen(category: categoryModel));


      },

      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Image.network(categoryModel.categoryImg ??'',width: 60,),
          ),
          const SizedBox(height: 4),
           Text(categoryModel.categoryName ?? '',
            style: TextStyle(color: AppColors.themeColor,fontWeight:FontWeight.w500),
          ),
        ],
      ),
    );
  }
}