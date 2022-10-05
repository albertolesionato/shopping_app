import 'package:flutter/material.dart';

class FutureWidget<T extends Widget> extends FutureBuilder<T> {
  FutureWidget.part({super.key, required Future<T> Function() future})
      : super(
            future: future(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return const Center(
                  child: Text(
                    'ERROR',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'NO DATA',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              return snapshot.data as T;
            });

  FutureWidget.whole({super.key, required Future<T> Function() future})
      : super(
            future: future(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Scaffold(body: LinearProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Scaffold(
                  body: Center(
                    child: Text(
                      'ERROR',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Scaffold(
                  body: Center(
                    child: Text(
                      'NO DATA',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }

              return snapshot.data as T;
            });
}
