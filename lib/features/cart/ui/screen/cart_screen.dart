import 'package:craft_bay/features/common/controller/main_bottom_nav_controller.dart';
import 'package:craft_bay/features/common/network/urls/asset_urls.dart';
import 'package:craft_bay/features/common/ui/widget/build_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
          title: Text('Cart'),
        ),
        body: SafeArea(
          child: Column(
              children: [
                buildProductList(), 
                BuildCheckoutSection()
              ]
          ),
        ),
      ),
    );
  }

  Widget buildProductList() {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                height: 90,
                decoration: buildBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 70,
                        child: Image.network(
                          AssetUrls.shoeUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      buildProductInfo(context),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [buildDeleteButton(), buildIconButtonRow()],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey.shade200, spreadRadius: 2, blurRadius: 5),
      ],
    );
  }

  Widget buildProductInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Year Special Shoe',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          'Color: Red, Size: X',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        Text('\$100', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget buildDeleteButton() {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        splashColor: Colors.red,

        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.red.shade100,
            child: Icon(Icons.delete_outline, size: 18, color: Colors.teal),
          ),
        ),
      ),
    );
  }

  Widget buildIconButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildIconButton(onTap: () {}, icon: Icons.horizontal_rule_rounded),
        const SizedBox(width: 2),
        Text('01'),
        const SizedBox(width: 2),
        BuildIconButton(onTap: () {}, icon: Icons.add),
      ],
    );
  }
}

class BuildCheckoutSection extends StatelessWidget {
  const BuildCheckoutSection({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Price',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.black54),
                  ),
                  Text(
                    '\$100000',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.teal),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Checkout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
