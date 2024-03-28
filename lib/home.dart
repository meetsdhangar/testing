import 'package:flutter/material.dart';
import 'package:testing/counter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterclass = Counter();
  // int _counter = counterclass.counter;

  void _incrementCounter() {
    setState(() {
      counterclass.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      counterclass.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${counterclass.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          children: [
            FloatingActionButton(
              key: Key('_incrementCounter'),
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),

            FloatingActionButton(
              key: Key('_decrementCounter'),
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove_circle),
            ), // This trailing
          ],
        ));
  }
}
