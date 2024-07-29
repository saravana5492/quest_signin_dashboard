import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
import 'package:quest_signin_dashboard/comman/widgets/bubble_container.dart';
import 'package:quest_signin_dashboard/features/dashboard/domain/entities/careerpath.dart';

class LevelDetailView extends StatelessWidget {
  const LevelDetailView({
    super.key,
    required this.level,
    required this.isEven,
  });

  final Level level;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 45,
      right: 110,
      child: ContainerBubbleView(
        bubbleType: isEven ? BubbleType.sendBubble : BubbleType.receiverBubble,
        child: SizedBox(
          width: 174,
          height: 90,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level.title,
                    style: AppTextStyle.smallSemiBoldBodyStyle
                        .copyWith(color: AppColor.primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    level.description,
                    style: AppTextStyle.smallSemiBoldBodyStyle,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Start ${level.title}',
                      style: AppTextStyle.smallSemiBoldBodyStyle
                          .copyWith(color: AppColor.whiteColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: AppColor.primaryColor,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${level.earnedPoints}/${level.totalPoints}",
                        style: AppTextStyle.smallSemiBoldBodyStyle
                            .copyWith(color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(level.userLevelIcon, width: 40)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
