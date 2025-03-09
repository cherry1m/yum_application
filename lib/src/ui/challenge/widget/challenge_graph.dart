import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/challenge/widget/challenge_help_modal.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

class ChallengeGraph extends StatelessWidget {
  final int totalCount;
  const ChallengeGraph({super.key, required this.totalCount});

  /// 단계별 목표 값 (범위 반영)
  static const List<int> stageGoals = [
    1,
    2,
    3,
    5,
    7,
    10,
    20,
    30,
    50,
    70,
    99,
    100
  ];

  /// 현재 단계 구하기
  int getCurrentStage() {
    int sum = 0;
    for (int i = 0; i < stageGoals.length; i++) {
      if (totalCount < stageGoals[i]) return i + 1;
      sum = stageGoals[i];
    }
    return stageGoals.length;
  }

  /// 현재 단계의 시작 값 구하기
  int getStageStartValue() {
    if (totalCount == 0) return 0;
    int sum = 0;
    for (int i = 0; i < stageGoals.length; i++) {
      if (totalCount < stageGoals[i]) return sum;
      sum = stageGoals[i];
    }
    return 0;
  }

  /// 현재 단계의 끝 값 구하기
  int getStageEndValue() {
    for (int i = 0; i < stageGoals.length; i++) {
      if (totalCount < stageGoals[i]) return stageGoals[i];
    }
    return stageGoals.last;
  }

  @override
  Widget build(BuildContext context) {
    int currentStage = getCurrentStage();
    int stageStart = getStageStartValue();
    int stageEnd = getStageEndValue();
    int stageProgress = totalCount - stageStart;
    int stageGoal = stageEnd - stageStart;

    /// 현재 단계에서 몇 % 진행했는지 계산
    double progress = (stageProgress / stageGoal).clamp(0.0, 1.0);

    /// 그래프 최대 너비를 고려하여 현재 진행된 위치 계산
    double progressPosition =
        progress * MediaQuery.of(context).size.width * 0.8;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$currentStage단계 도전중",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        const ChallengeHelpModal().show(context);
                      },
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          ChallengeImagePath.help,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "$totalCount개 달성! 다음 단계까지 ${stageEnd - totalCount}개 남았어요",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 20),

                /// 진행 바
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: progressPosition,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),

                /// 현재 개수 표시 (그래프 아래)
                const SizedBox(height: 4),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: progressPosition),
                        child: Text(
                          "$totalCount",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),

                    /// 단계 시작과 끝 숫자 표시
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$stageStart",
                            style: Theme.of(context).textTheme.labelSmall),
                        Text("$stageEnd",
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension ChallengeImagePath on ImagePath {
  static String get help => 'assets/images/help.png';
}
