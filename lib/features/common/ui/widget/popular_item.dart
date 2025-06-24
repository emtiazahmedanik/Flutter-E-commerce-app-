import 'package:craft_bay/features/common/network/urls/asset_urls.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(4, 2)
              )
            ]
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(AssetUrls.shoeUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'New year special shoe 30',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text('৳100',style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),),
                        Text('⭐4.8',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black)),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(2)),
                          child: Icon(Icons.favorite_border,size: 14,color: Colors.white,),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
