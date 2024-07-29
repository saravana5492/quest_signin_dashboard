import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/comman/widgets/dashline/path_creator.dart';

enum DashlineAngleType { left, right }

class AngleDashline extends CustomPainter {
  final DashlineAngleType angleType;
  final bool isLastIndex;

  AngleDashline({
    super.repaint,
    required this.angleType,
    this.isLastIndex = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color.fromARGB(60, 0, 0, 0)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double dashLength = 8;
    const double dashSpace = 4;

    final double xOffsetStart1 = size.width * 0.5;
    const double yOffsetStart1 = 0;
    final double xOffsetEnd1 =
        angleType == DashlineAngleType.right ? size.width - 30 : 30;
    const double yOffsetEnd1 = 100;

    final double xOffsetStart2 =
        angleType == DashlineAngleType.right ? size.width - 30 : 30;
    const double yOffsetStart2 = 100;
    final double xOffsetEnd2 = size.width * 0.5;
    const double yOffsetEnd2 = 200;

    final Path path1 = Path()
      ..moveTo(xOffsetStart1, yOffsetStart1)
      ..lineTo(xOffsetEnd1, yOffsetEnd1);

    final Path path2 = Path()
      ..moveTo(xOffsetStart2, yOffsetStart2)
      ..lineTo(xOffsetEnd2, yOffsetEnd2);

    final Path dashedPath1 =
        PathCreator.createDashedPath(path1, dashLength, dashSpace);
    canvas.drawPath(dashedPath1, paint);

    if (!isLastIndex) {
      final Path dashedPath2 =
          PathCreator.createDashedPath(path2, dashLength, dashSpace);
      canvas.drawPath(dashedPath2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
