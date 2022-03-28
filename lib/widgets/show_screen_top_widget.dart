import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/gen/fonts.gen.dart';

import '../providers/show_screen_content_provider.dart';

class ShowScreenTopWidget extends StatelessWidget {
  const ShowScreenTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShowsScreenContentProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Shows',
            style: Theme.of(context).textTheme.headline1,
          ),
          OutlinedButton(
            onPressed: () {
              provider.switchContent();
            },
            child: Text(
              provider.isHidden ? 'Show' : 'Hide',
              style: const TextStyle(fontFamily: FontFamily.roboto),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
              side: MaterialStateProperty.all(const BorderSide(color: Colors.black38)),
            ),
          ),
        ],
      ),
    );
  }
}
