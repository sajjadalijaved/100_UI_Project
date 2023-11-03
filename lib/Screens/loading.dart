import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
// ignore_for_file: library_private_types_in_public_api

class LoadingExample extends StatefulWidget {
  const LoadingExample({Key? key}) : super(key: key);

  @override
  _LoadingExampleState createState() => _LoadingExampleState();
}

class _LoadingExampleState extends State<LoadingExample> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballScaleMultiple,
                  colors: [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.orange,
                    Colors.deepPurple
                  ],
                  strokeWidth: 2,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  Colors.orange,
                  Colors.deepPurple
                ],
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.pacman,
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  Colors.orange,
                  Colors.deepPurple
                ],
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.lineScale,
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  Colors.orange,
                  Colors.deepPurple
                ],
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  Colors.orange,
                  Colors.deepPurple
                ],
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotate,
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                  Colors.orange,
                  Colors.deepPurple
                ],
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
