import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

final url =
    'https://forrit-cms-tb-prod-consumables.azureedge.net/media/6a230d8e-29ed-44c4-8ff7-dc6104df49cc/clubcard-plus-credit-card.png';

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
            opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withAlpha(100),
                  spreadRadius: 10,
                )
              ]),
              child: Image.network(url),
            ),
          ),
        ));
  }
}
