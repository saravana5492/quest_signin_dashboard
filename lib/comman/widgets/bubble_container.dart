import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';

class BubbleContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    const double triangleH = 10;
    const double triangleW = 25.0;
    final double width = size.width;
    final double height = size.height;

    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, height)
      ..lineTo(width / 2, triangleH + height)
      ..lineTo(width / 2 + triangleW / 2, height)
      ..close();

    canvas.drawPath(trianglePath, paint);
    final BorderRadius borderRadius = BorderRadius.circular(12);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TextBubbleView extends StatelessWidget {
  const TextBubbleView({
    super.key,
    required this.bubbleType,
    required this.child,
    required this.padding,
  });
  final BubbleType bubbleType;
  final Widget child;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper6(type: bubbleType),
      alignment: Alignment.topCenter,
      backGroundColor: AppColor.whiteColor,
      shadowColor: AppColor.borderColor,
      padding: padding,
      child: child,
    );
  }
}

class ContainerBubbleView extends StatelessWidget {
  const ContainerBubbleView({
    super.key,
    required this.bubbleType,
    required this.child,
  });

  final BubbleType bubbleType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper4(type: bubbleType),
      alignment: Alignment.topCenter,
      backGroundColor: AppColor.whiteColor,
      shadowColor: AppColor.borderColor,
      child: child,
    );
  }
}
