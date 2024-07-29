import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/comman/responsive/responsive.dart';
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
  void _tappedLevel(int atIndex) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.whiteColor,
        centerTitle: false,
        title: DashboardAppbarTitle(
          completedPercentage: dummyCareerPathData.completedPercentage,
        ),
        actions: const [UserPointsView()],
      ),
      body: SafeArea(
        child: _responsiveLayout(),
      ),
    );
  }

  Widget _responsiveLayout() {
    if (Responsive.isMobile(context)) {
      return _careerPath();
    } else {
      return Center(
        child: Container(
            width: 540,
            padding: const EdgeInsets.all(31),
            margin: const EdgeInsets.only(top: 24, bottom: 24),
            decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(color: AppColor.borderColor),
                borderRadius: BorderRadius.circular(24)),
            child: _careerPath()),
      );
    }
  }

  Widget _careerPath() {
    return Container(
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
              index: actualIndex,
              isLastIndex:
                  actualIndex == dummyCareerPathData.allLevels.length - 1,
              tappedLevelIndex: _tappedLevel,
            );
          } else {
            return DashboardFooter(careerPath: dummyCareerPathData);
          }
        },
      ),
    );
  }
}
