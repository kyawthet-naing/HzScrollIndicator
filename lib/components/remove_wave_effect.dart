import 'package:flutter/widgets.dart';

class RemoveWaveEffect extends StatelessWidget {
  final Widget child;

  const RemoveWaveEffect({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (scroll) {
        scroll.disallowIndicator();
        return false;
      },
      child: child,
    );
  }
}
