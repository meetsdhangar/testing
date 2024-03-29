class Counter {
  int _counter = 0;
  int get counter => _counter;

  increment() {
    _counter++;
  }

  decrement() {
    _counter--;
  }

  reset() {
    _counter = 0;
  }
}
