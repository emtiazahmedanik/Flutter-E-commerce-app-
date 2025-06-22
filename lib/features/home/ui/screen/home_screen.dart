
import 'package:craft_bay/app/asset_paths.dart';
import 'package:craft_bay/features/common/controller/main_bottom_nav_controller.dart';
import 'package:craft_bay/features/home/ui/widget/app_bar_action_button.dart';
import 'package:craft_bay/features/home/ui/widget/home_carousel_slider.dart';
import 'package:craft_bay/features/common/ui/widget/product_category_item.dart';
import 'package:craft_bay/features/home/ui/widget/product_search_bar.dart';
import 'package:craft_bay/features/product/ui/screen/product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                ProductSearchBar(),
                HomeCarouselSlider(),
                buildSectionTitle(title: 'Categories', onTapSeeAll: _goToCategoryScreen),
                buildCategoryList(),
                buildSectionTitle(title: 'Popular', onTapSeeAll: () {}),
                buildSectionTitle(title: 'New', onTapSeeAll: () {}),
                buildSectionTitle(title: 'Special', onTapSeeAll: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToCategoryScreen(){
    Get.find<MainBottomNavController>().moveToCategory();
  }
  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPath.navAppLogoSvg),
      actions: [
        buildNavButton(onTap: () {}, iconData: Icons.person_2_outlined),
        SizedBox(width: 8),
        buildNavButton(onTap: () {}, iconData: Icons.phone),
        SizedBox(width: 8),
        buildNavButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
        SizedBox(width: 8),
      ],
    );
  }

  Widget buildSectionTitle({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextButton(onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }

  Widget buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCategoryItem(iconData: Icons.computer,categoryName: 'Computer',);
        },
      ),
    );
  }
}

