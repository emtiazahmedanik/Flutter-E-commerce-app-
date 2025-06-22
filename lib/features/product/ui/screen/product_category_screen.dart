import 'package:craft_bay/features/common/controller/main_bottom_nav_controller.dart';
import 'package:craft_bay/features/common/ui/widget/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  static final String name = '/product-category';

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category',),
          leading: IconButton(
              onPressed: Get.find<MainBottomNavController>().backToHome,
              icon: Icon(Icons.arrow_back_ios_new_rounded)
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 5
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  child: ProductCategoryItem(
                    iconData: Icons.computer,
                    categoryName: 'Computer',
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
