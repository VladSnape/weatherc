import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final double height;
  final Color? color;
  final Widget? widget;
  const MyContainer({
    Key? key,
    required this.height,
    this.color,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: widget,
    );
  }
}
