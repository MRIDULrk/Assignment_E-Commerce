
import 'package:crafty_bay/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/centered_circular_progress_indicator.dart';

import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/appbar_icon_button.dart';
import '../widgets/home_banner_slider.dart';
import '../widgets/horizontal_category_list_view.dart';
import '../widgets/horizontal_product_list_view.dart';
import '../widgets/search_text_field.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              SearchTextField(textEditingController: TextEditingController()),
              const SizedBox(height: 16),
              const HomeBannerSlider(),
              const SizedBox(height: 16),
               _buildCategoriesSection(),
              const SizedBox(height: 8),
              _buildPopularProductSection(),
              const SizedBox(height: 16),
              _buildNewProductSection(),
              const SizedBox(height: 16),
              _buildSpecialProductSection(),
              const SizedBox(height: 16),

            ],

          ),
        ),
      ),

    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppbarIconButton(
          iconData: Icons.person,
          onTap: (){},
        ),
        const SizedBox(width: 8),

        AppbarIconButton(
          iconData: Icons.phone,
          onTap: (){},
        ),
        const SizedBox(width: 8),

        AppbarIconButton(
          iconData: Icons.notifications_active,
          onTap: (){},
        ),
        const SizedBox(width: 8),
      ]

    );
  }

  Widget _buildCategoriesSection(){
    return Column(
      children: [
        SectionHeader(
          title: 'Category',
          onTap: (){

           Get.find<BottomNavBarController>().selectCategory();

          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: GetBuilder<CategoryListController>(
              builder: (categoryListController) {
            return Visibility(
                visible: !categoryListController.inProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child:  HorizontalCategoryListView(categoryList:categoryListController.categoryList));
          }),
        ),
      ],
    );
  }

  Widget _buildPopularProductSection(){
    return Column(
      children: [
        SectionHeader(
          title: 'Popular',
          onTap: (){

          },
        ),

        SizedBox(
          height: 180,
          child: GetBuilder<PopularProductListController>(
              builder: (popularProductListController) {
                return Visibility(
                    visible: !popularProductListController.inProgress,
                    replacement: const CenteredCircularProgressIndicator(),

                    child: HorizontalProductListView(productList: popularProductListController.productList,));
              }
          ),
        ),

      ],
    );
  }

  Widget _buildNewProductSection(){
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: (){},
        ),

        SizedBox(
          height: 180,
          child: GetBuilder<NewProductListController>(
            builder: (newProductListController) {
              return Visibility(
                visible: !newProductListController.inProgress,
                  replacement: const CenteredCircularProgressIndicator(),

                  child: HorizontalProductListView(productList: newProductListController.productList,));
            }
          ),
        ),

      ],
    );
  }

  Widget _buildSpecialProductSection(){
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: (){},
        ),

        SizedBox(
          height: 180,
          child: GetBuilder<SpecialProductListController>(
              builder: (specialProductListController) {
                return Visibility(
                    visible: !specialProductListController.inProgress,
                    replacement: const CenteredCircularProgressIndicator(),

                    child: HorizontalProductListView(productList: specialProductListController.productList,));
              }
          ),
        ),



      ],
    );
  }

}
