import 'package:flutter/cupertino.dart';

import 'centered_circular_progress.dart';
import 'centered_message.dart';

class BusyListContainer extends StatelessWidget {
  final EdgeInsets padding;
  final bool busy;
  final List items;
  final String message;
  final Function(BuildContext, int) itemBuilder;

  const BusyListContainer({
    Key key,
    this.busy = false,
    this.items,
    this.itemBuilder,
    this.message = 'Vazio',
    this.padding = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (busy) return CenteredCircularProgress();

    if (items.isEmpty) return CenteredMessage(message: message);

    return ListView.builder(
      padding: padding,
      itemCount: items.length,
      itemBuilder: itemBuilder,
    );
  }
}
