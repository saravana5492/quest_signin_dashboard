import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:quest_signin_dashboard/comman/widgets/dashline/angle_dashline.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/comman/widgets/bubble_container.dart';
import 'package:quest_signin_dashboard/features/dashboard/domain/entities/careerpath.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/widgets/level_detail_view.dart';

class LevelCell extends StatefulWidget {
  const LevelCell({
    super.key,
    required this.level,
    required this.index,
    required this.isLastIndex,
    required this.tappedLevelIndex,
  });

  final Level level;
  final int index;
  final bool isLastIndex;
  final void Function(int) tappedLevelIndex;

  @override
  State<LevelCell> createState() => _LevelCellState();
}

class _LevelCellState extends State<LevelCell> {
  bool isEven() => widget.index == 0 || widget.index % 2 == 0;

  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        width: double.infinity,
        color: AppColor.backgroundColor,
        child: CustomPaint(
          size: const Size(
            double.infinity,
            200,
          ),
          painter: isEven()
              ? AngleDashline(
                  angleType: DashlineAngleType.right,
                  isLastIndex: widget.isLastIndex,
                )
              : AngleDashline(
                  angleType: DashlineAngleType.left,
                  isLastIndex: widget.isLastIndex,
                ),
        ),
      ),
      if (isEven())
        Positioned(
          top: 50,
          right: -3,
          child: GestureDetector(
            onTap: () => widget.tappedLevelIndex(widget.index),
            child: Image.asset(
              widget.level.image,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
        )
      else
        Positioned(
          top: 50,
          left: -3,
          child: Image.asset(
            widget.level.image,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
      if (widget.level.showLevelDetails)
        LevelDetailView(level: widget.level, isEven: isEven()),
      if (isEven())
        Positioned(
          top: 0,
          right: 20,
          child: widget.index == 0
              ? Container()
              : TextBubbleView(
                  bubbleType: BubbleType.sendBubble,
                  padding: const EdgeInsets.only(
                      top: 8, left: 12, right: 20, bottom: 15),
                  child: Text(
                    widget.level.title,
                    style: AppTextStyle.mediumSemiBoldBodyStyle.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
        )
      else
        Positioned(
          top: 0,
          left: 20,
          child: TextBubbleView(
            bubbleType: BubbleType.receiverBubble,
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 12, bottom: 15),
            child: Text(
              widget.level.title,
              style: AppTextStyle.mediumSemiBoldBodyStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: children,
      ),
    );
  }
}
