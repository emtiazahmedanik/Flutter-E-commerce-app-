import 'package:craft_bay/constants.dart';
import 'package:flutter/material.dart';

class BuildAddToCartSection extends StatelessWidget {
  const BuildAddToCartSection({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.black54),
                  ),
                  Text(
                    '${Constants.takaSign}100000',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.teal),
                  ),
                ],
              ),
              SizedBox(
                width: 140,
                height: 35,
                child: ElevatedButton(
                  onPressed: onTap,
                  child: Text('Add To Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
