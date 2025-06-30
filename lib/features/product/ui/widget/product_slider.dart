import 'package:carousel_slider/carousel_slider.dart';
import 'package:craft_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final ValueNotifier<int> currentSlider = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
          [1, 2, 3, 4, 5].map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text('text $i', style: TextStyle(fontSize: 16.0)),
            );
          }).toList(),
          options: CarouselOptions(
            height: 150.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, _) {
              currentSlider.value = index;
            },
          ),
        ),
        const SizedBox(height: 3),
        ValueListenableBuilder(
          valueListenable: currentSlider,
          builder: (context, int value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        color: value == i ? AppColors.themeColor :null,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
