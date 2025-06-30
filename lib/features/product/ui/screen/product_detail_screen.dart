
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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
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
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


