import 'package:flutter/cupertino.dart';

// class HomeController {
//   var counter$ = ValueNotifier(0);
//   var loading$ = ValueNotifier(true);

//   int get counter => counter$.value;

//   void increment() => counter$.value++;
// }

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  increment() => value++;
  decrement() => value--;
}
