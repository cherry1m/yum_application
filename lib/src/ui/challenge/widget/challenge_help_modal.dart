import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

class ChallengeHelpModal extends StatelessWidget {
  const ChallengeHelpModal({super.key});

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(ChallengeImagePath.close)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 20),
                child: Text(
                  "챌린지 더 알아보기",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 최소 크기로 조정
            children: List.generate(12, (index) {
              final stages = [
                "1단계 - 1회",
                "2단계 - 2회",
                "3단계 - 3회",
                "4단계 - 4~5회",
                "5단계 - 6~7회",
                "6단계 - 8~10회",
                "7단계 - 11~20회",
                "8단계 - 21~30회",
                "9단계 - 31~50회",
                "10단계 - 51~70회",
                "11단계 - 71~99회",
                "12단계 - 100회",
              ];
              return Text(
                stages[index],
                style: Theme.of(context).textTheme.labelMedium,
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // 필요 없는 UI 제거
  }
}

extension ChallengeImagePath on ImagePath {
  static String get close => 'assets/images/close.png';
}
