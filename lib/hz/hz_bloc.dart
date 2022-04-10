import 'dart:async';

class HzBloc {
  final hzController = StreamController<double>.broadcast();

  Stream<double> get hzStream => hzController.stream;

  changeHz(double pos) => hzController.sink.add(pos);

  disposed() => hzController.close();
}
