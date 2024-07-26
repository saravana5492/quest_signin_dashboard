import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:quest_signin_dashboard/core/assets/app_images.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/comman/widgets/bubble_container.dart';
import 'package:quest_signin_dashboard/features/dashboard/domain/entities/careerpath.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/widgets/level_detail_view.dart';

class LevelCell extends StatefulWidget {
  const LevelCell({
    super.key,
    required this.level,
    required this.isEven,
    required this.isFirstIndex,
    required this.isLastIndex,
  });

  final Level level;
  final bool isEven;
  final bool isFirstIndex;
  final bool isLastIndex;

  @override
  State<LevelCell> createState() => _LevelCellState();
}

class _LevelCellState extends State<LevelCell> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 168,
            color: AppColor.backgroundColor,
            child: Column(
              children: [
                Image.asset(
                  widget.isEven
                      ? AppImages.toBottomRight
                      : AppImages.toBottomLeft,
                  width: double.infinity,
                  height: 84,
                  color: AppColor.dashColor,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  widget.isEven ? AppImages.toTopRight : AppImages.toTopLeft,
                  width: double.infinity,
                  height: 84,
                  color: widget.isLastIndex
                      ? Colors.transparent
                      : AppColor.dashColor,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          if (widget.isEven)
            Positioned(
              top: 34,
              right: -2,
              child: Image.asset(
                widget.level.image,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            )
          else
            Positioned(
              top: 34,
              left: -3,
              child: Image.asset(
                widget.level.image,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          if (widget.level.showLevelDetails)
            LevelDetailView(level: widget.level, isEven: widget.isEven),
          if (widget.isEven)
            Positioned(
              top: 0,
              right: 20,
              child: widget.isFirstIndex
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
                padding: const EdgeInsets.only(
                    top: 8, left: 20, right: 12, bottom: 15),
                child: Text(
                  widget.level.title,
                  style: AppTextStyle.mediumSemiBoldBodyStyle.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
