import 'package:craft_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key, required this.iconData, required this.categoryName,
  });
  final IconData iconData;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(iconData,color: AppColors.themeColor,size: 42,),
          ),
          Text(categoryName,style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
