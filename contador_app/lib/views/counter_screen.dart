import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  void fnIncrementar() {
    counter++;
    setState(() {});
  }

  void fnDecremento() {
    counter--;
    setState(() {});
  }

  void fnReiniciar() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextStyle font30 = const TextStyle(fontSize: 30);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Contador de clicks", style: font30),
              Text(
                "$counter",
                style: font30,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActions(
          fnIncrementarCFA: fnIncrementar,
          fnDecrementoCFA: fnDecremento,
          fnReiniciarCFA: fnReiniciar,
        ));
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function fnIncrementarCFA;
  final Function fnDecrementoCFA;
  final Function fnReiniciarCFA;
  const CustomFloatingActions({
    Key? key,
    required this.fnIncrementarCFA,
    required this.fnDecrementoCFA,
    required this.fnReiniciarCFA,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.plus_one_outlined),
          onPressed: () => fnIncrementarCFA(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.rotate_90_degrees_cw_outlined),
          onPressed: () => fnReiniciarCFA(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => fnDecrementoCFA(),
        ),
      ],
    );
  }
}
