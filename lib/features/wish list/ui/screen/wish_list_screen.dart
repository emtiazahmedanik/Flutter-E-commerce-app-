import 'package:craft_bay/features/common/ui/widget/popular_item.dart';
import 'package:craft_bay/features/product/ui/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  void _moveToProductDetailScreen(){
    Navigator.pushNamed(context, ProductDetailScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
