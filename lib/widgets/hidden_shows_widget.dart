import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tv_shows/gen/assets.gen.dart';

class HiddenShowsWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const HiddenShowsWidget(this.constraints, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: constraints.maxHeight * 0.72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.icShowsEmptyState),
            const SizedBox(height: 20),
            Text(
              'Your shows are not showing. Get it?',
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
