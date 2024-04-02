// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

import 'package:testing/main.dart';

void main() {
  late Counter counterclass;

  setUp(() {
    counterclass = Counter();
  });
  //setup->test1->setup->test2->setup->test3
  // setUpAll(() => null);
  // //setupall->test1->test2->test3
  // tearDown(() => null);
  // //test1->teardown->test2->teardown->test3->teardown
  // tearDownAll(() => null);
  // //test1->test2->test3->teardownall

  group('Unit test on counter...', () {
    test('initial value should be 0', () {
      //arrange

      //act
      var count = counterclass.counter;
      //assert
      expect(count, 0);
    });

    test('After click on increment value should be 1', () {
      //arrange

      //act
      counterclass.increment();
      var count = counterclass.counter;
      //assert
      expect(count, 1);
    });

    test('After click on decrement value should be -1', () {
      //arrange

      //act
      counterclass.decrement();
      var count = counterclass.counter;
      //assert
      expect(count, -1);
    });
    test('After click on reset value should be 0', () {
      //arrange

      //act
      counterclass.reset();
      var count = counterclass.counter;
      //assert
      expect(count, 0);
    });
  });
}
