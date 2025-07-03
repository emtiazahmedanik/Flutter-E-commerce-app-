import 'package:craft_bay/features/common/ui/widget/build_icon_button.dart';
import 'package:craft_bay/features/reviews/ui/screen/reviews_screen.dart';
import 'package:flutter/material.dart';

class BuildReviewsSection extends StatelessWidget {
  const BuildReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '⭐ '),
              TextSpan(
                text: '4.8',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.black45),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ReviewsScreen.name);
          },
          child: Text(
            'Reviews',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Colors.teal),
          ),
        ),
        BuildIconButton(onTap: () {}, icon: Icons.favorite_border),
      ],
    );
  }
}
