import 'package:flutter/material.dart';
import 'package:tv_shows/widgets/modals/request_handler_modal.dart';

class SuccessModal extends StatelessWidget {
  const SuccessModal(this.context, {Key? key}) : super(key: key);
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return RequestHandlerModal('Success!', this.context);
  }
}
