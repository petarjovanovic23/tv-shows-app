import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/providers/provider_listener.dart';
import 'package:tv_shows/repository/networking_repository.dart';
import 'package:tv_shows/widgets/modals/error_modal.dart';
import 'package:tv_shows/widgets/rating_bar_widget.dart';

import '../models/show.dart';
import '../providers/review_provider.dart';
import '../providers/write_review_provider.dart';
import '../widgets/buttons/submit_button_widget.dart';
import '../widgets/input/review_input_field_widget.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen(this.show, {Key? key}) : super(key: key);
  final Show show;

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RatingBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WriteReviewProvider(
            context.read<NetworkingRepository>(),
            context.read<ReviewProvider>(),
          ),
        ),
      ],
      child: ProviderListener<WriteReviewProvider>(
        listener: (context, writeReviewProvider) {
          writeReviewProvider.state.maybeWhen(
            orElse: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (review) {
              writeReviewProvider.reviewProvider.fetchReviews(context.read<NetworkingRepository>(), widget.show);
              Navigator.of(context).pop();
            },
            failure: (exception) {
              showDialog(context: context, builder: (context) => ErrorModal(context));
            },
          );
        },
        child: LayoutBuilder(builder: (context, constraints) {
          ThemeData theme = Theme.of(context);

          return SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight * 0.55,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Write a review',
                        style: theme.textTheme.headline3,
                      ),
                      GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  RatingBarWidget(
                    widget.show,
                    fixed: false,
                  ),
                  ReviewInputFieldWidget(label: 'Comment', controller: textEditingController),
                  const SizedBox(height: 8.0),
                  Builder(builder: (context) {
                    return SubmitButtonWidget(widget.show, textEditingController, context);
                  }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
