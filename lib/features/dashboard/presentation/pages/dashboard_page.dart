import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/features/dashboard/data/dummy_data/careerpath_data.dart';
import 'package:quest_signin_dashboard/features/dashboard/domain/entities/careerpath.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/widgets/dashboard_appbar_title.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/widgets/dashboard_footer.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/widgets/level_cell.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/widgets/user_points_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        centerTitle: false,
        title: DashboardAppbarTitle(
          completedPercentage: dummyCareerPathData.completedPercentage,
        ),
        actions: const [UserPointsView()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView.builder(
            itemCount: dummyCareerPathData.allLevels.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return DashboardCareerHeader(careerPath: dummyCareerPathData);
              } else if (index - 1 < dummyCareerPathData.allLevels.length) {
                Level level = dummyCareerPathData.allLevels[index - 1];
                int actualIndex = index - 1;
                return LevelCell(
                  level: level,
                  isEven: (actualIndex == 0 || actualIndex % 2 == 0),
                  isFirstIndex: actualIndex == 0,
                  isLastIndex:
                      actualIndex == dummyCareerPathData.allLevels.length - 1,
                );
              } else {
                return DashboardFooter(careerPath: dummyCareerPathData);
              }
            },
          ),
        ),
      ),
    );
  }
}
