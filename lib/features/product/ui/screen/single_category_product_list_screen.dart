import 'package:craft_bay/features/common/controller/main_bottom_nav_controller.dart';
import 'package:craft_bay/features/common/ui/widget/popular_item.dart';
import 'package:craft_bay/features/product/ui/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCategoryProductListScreen extends StatefulWidget {
  const SingleCategoryProductListScreen({super.key, required this.args});
  static final String name = 'single-category-products';
  final Map<String,dynamic> args;

  @override
  State<SingleCategoryProductListScreen> createState() => _SingleCategoryProductListScreenState();
}

class _SingleCategoryProductListScreenState extends State<SingleCategoryProductListScreen> {

  void _moveToProductDetailScreen(){
    Navigator.pushNamed(context, ProductDetailScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.args['title'];
    final String id = widget.args['id'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)
        ),
        title: Text(title),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            //childAspectRatio: 4/5
          ),
          itemBuilder: (context, index) {
            return FittedBox(
                child: InkWell(
                  onTap: (){
                    _moveToProductDetailScreen();
                  },
                    child: PopularItem()
                )
            );
          },
        ),
      ),
    );
  }
}
