import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yum_application/src/ui/challenge/widget/challenge_check_list.dart';

// Challenge Storage ( 보관함 )
// Git의 잔디 심기처럼 이 앱을 사용했던 기록을 기반해 점점 진해지는 컨테이너를 달력 형식으로 보여줌.

class ChallengeCalendar extends StatefulWidget {
  const ChallengeCalendar({super.key});

  @override
  State<ChallengeCalendar> createState() => _ChallengeCalendarState();
}

class _ChallengeCalendarState extends State<ChallengeCalendar> {
  DateTime _currentDate = DateTime.now();

  // 이전 달로 이동하는 함수
  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
    });
  }

  // 다음 달로 이동하는 함수
  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth =
        DateTime(_currentDate.year, _currentDate.month + 1, 0).day;
    int startWeekday =
        DateTime(_currentDate.year, _currentDate.month, 1).weekday % 7;
    String currentMonth = DateFormat('yyyy년 M월').format(_currentDate);
    List<bool> dayCompletion =
        List.generate(daysInMonth, (index) => index % 2 == 0);
    List<double> opacities = [0.23, 0.51, 0.96, 1.0, 0.75];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                "오늘의 챌린지",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          // 챌린지 달력 컨테이너
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 월 변경을 위한 네비게이션 바
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        onPressed: _previousMonth,
                      ),
                      Text(
                        currentMonth,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        onPressed: _nextMonth,
                      ),
                    ],
                  ),
                ),
                // 캘린더 그리드
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 7 + daysInMonth + startWeekday,
                  itemBuilder: (context, index) {
                    // 요일 헤더 생성
                    if (index < 7) {
                      List<String> weekdays = [
                        "일",
                        "월",
                        "화",
                        "수",
                        "목",
                        "금",
                        "토"
                      ];
                      return Center(
                        child: Text(
                          weekdays[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    } else {
                      int dayIndex = index - 7 - startWeekday;
                      if (dayIndex < 0 || dayIndex >= daysInMonth) {
                        return const SizedBox();
                      }
                      int day = dayIndex + 1;
                      bool isToday =
                          (_currentDate.year == DateTime.now().year &&
                              _currentDate.month == DateTime.now().month &&
                              day == DateTime.now().day);
                      double opacity = opacities[dayIndex % opacities.length];

                      // 날짜별 컨테이너 스타일링
                      return Container(
                        decoration: BoxDecoration(
                          color: isToday
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : dayCompletion[dayIndex]
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(opacity)
                                  : Theme.of(context).colorScheme.scrim,
                          borderRadius: BorderRadius.circular(5),
                          border: isToday
                              ? Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 2,
                                )
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: isToday
                            ? Text("$day",
                                style: Theme.of(context).textTheme.bodyMedium)
                            : null,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          // 챌린지 체크리스트 추가
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: ChallengeCheckList(),
          ),
        ],
      ),
    );
  }
}
