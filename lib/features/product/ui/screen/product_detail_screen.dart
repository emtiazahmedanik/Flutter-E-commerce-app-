import 'package:craft_bay/constants.dart';
import 'package:craft_bay/features/product/ui/widget/build_add_to_cart_section.dart';
import 'package:craft_bay/features/product/ui/widget/build_review_section.dart';
import 'package:craft_bay/features/product/ui/widget/build_title_section.dart';
import 'package:craft_bay/features/product/ui/widget/color_picker.dart';
import 'package:craft_bay/features/product/ui/widget/product_slider.dart';
import 'package:craft_bay/features/product/ui/widget/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  static final String name = '/product-detail-screen';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ValueNotifier<int> currentSlider = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 2.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductSlider(),
                      BuildTitleSection(),
                      BuildReviewsSection(),
                      const SizedBox(height: 1),
                      Text(
                        'Color',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.black54),
                      ),
                      ColorPicker(
                        colors: ['Blue', 'Black', 'White', 'Grey'],
                        onSelected: (String value) {},
                      ),
                      Text(
                        'Size',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.black54),
                      ),
                      SizePicker(
                        sizes: ['X', 'XL', '2L', 'L'],
                        onSelected: (String value) {},
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'Description',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.black54),
                      ),
                      Text(
                        Constants.lorem,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ),
            BuildAddToCartSection(onTap: (){}),
          ],
        ),
      ),
    );
  }
}


