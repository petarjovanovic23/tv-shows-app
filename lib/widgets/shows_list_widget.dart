import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/show.dart' show ShowsProvider;
import 'show_card_widget.dart';

class ShowsListWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const ShowsListWidget(this.constraints, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: constraints.maxHeight * 0.8,
        child: ListView.builder(
          itemCount: Provider.of<ShowsProvider>(context).getAllShows().length,
          itemBuilder: (context, index) {
            return ShowCardWidget(context, index);
          },
        ),
      ),
    );
  }
}
