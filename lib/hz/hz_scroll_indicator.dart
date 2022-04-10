import 'package:flutter/material.dart';
import 'hz_bloc.dart';

///HorizontalScrollIndicator
class HzScrollIndicator extends StatefulWidget {
  final ScrollController controller;
  final double height;

  const HzScrollIndicator({
    Key? key,
    required this.height,
    required this.controller,
  }) : super(key: key);

  @override
  _HzScrollIndicatorState createState() => _HzScrollIndicatorState();
}

class _HzScrollIndicatorState extends State<HzScrollIndicator> {
  HzBloc hzBloc = HzBloc();

  @override
  void initState() {
    final controller = widget.controller;

    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        if (!controller.hasClients) {
          throw Exception(
            "ScrollController not attached to any scroll view : from HzScrollIndicator",
          );
        } else {
          controller.addListener(
            () {
              var currentPixels = controller.position.pixels;
              var maxPixels = controller.position.maxScrollExtent;

              ///device full width
              var width = MediaQuery.of(context).size.width;

              ///If BouncingScrollPhysics, current pixels can be minus (eg.-1,-2,-3,...)
              if (currentPixels < 0) return;
              hzBloc.changeHz(currentPixels / (maxPixels / width));
            },
          );
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    ///disposed
    hzBloc.disposed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: hzBloc.hzStream,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.deepOrange,
            height: widget.height,
            width: snapshot.data ?? 0,
          ),
        );
      },
    );
  }
}
