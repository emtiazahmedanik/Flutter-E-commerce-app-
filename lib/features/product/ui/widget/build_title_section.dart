import 'package:craft_bay/features/common/ui/widget/build_icon_button.dart';
import 'package:flutter/material.dart';

class BuildTitleSection extends StatelessWidget {
  const BuildTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Text(
            'Happy New Year Special Deal Save 30%',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 3,
          children: [
            BuildIconButton(onTap: () {}, icon: Icons.horizontal_rule_rounded),
            Text('01'),
            BuildIconButton(onTap: () {}, icon: Icons.add),
          ],
        ),
      ],
    );
  }
}
