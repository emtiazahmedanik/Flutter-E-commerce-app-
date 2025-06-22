import 'package:carousel_slider/carousel_slider.dart';
import 'package:craft_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatelessWidget {
  HomeCarouselSlider({super.key});

  final ValueNotifier<int> currentSlider = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, _) {
              currentSlider.value = index;
            },
          ),
          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                    );
                  },
                );
              }).toList(),
        ),
        const SizedBox(height: 5,),
        ValueListenableBuilder(
          valueListenable: currentSlider,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == i ? AppColors.themeColor : null,
                      border: Border.all(color: Colors.grey.shade300, width: 1),
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
