import '/components/remove_wave_effect.dart';
import 'package:flutter/material.dart';
import '/hz/hz_scroll_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller = ScrollController();
  final String txt = "မင်းကို ဘယ်သူမှ မချစ်ဘူး";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(txt)),
      body: Column(
        children: [
          HzScrollIndicator(height: 5, controller: controller),
          Expanded(
            child: RemoveWaveEffect(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.all(8),
                children: [
                  const Text(
                    "- - - - - - START - - - - - -",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(100, (_) => _text),
                  const SizedBox(height: 20),
                  const Text(
                    "- - - - - - END - - - - - -",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _text => Column(
        children: [
          Text(
            txt,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
}
