import 'package:flutter/material.dart';
import 'package:tv_shows/widgets/modals/request_handler_modal.dart';

class ErrorModal extends StatelessWidget {
  const ErrorModal(this.context, {Key? key}) : super(key: key);
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return RequestHandlerModal('Something went wrong. Please try again.', this.context);
  }
}
