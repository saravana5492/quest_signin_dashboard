import 'package:flutter/material.dart';

class SamplePractice extends StatelessWidget {
  const SamplePractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            color: Colors.cyanAccent.withOpacity(0.2),
            constraints: BoxConstraints(maxHeight: 160),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 40,
                  height: 40,
                  color: Colors.pink,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                          "This way you can keep the elevation of AppBar for keeping its shadow visible and have custom height, which is what I was just looking for. You do have to set the spacing in SomeWidget, though."),
                      Text(
                          "This way you can keep the elevation of AppBar for keeping its shadow visible and have custom height, which is what I was just looking for. You do have to set the spacing in SomeWidget, though.")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
