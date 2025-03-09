import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yum_application/src/ui/challenge/widget/challenge_check_list.dart';

class ChallengeCalendar extends StatefulWidget {
  const ChallengeCalendar({super.key});

  @override
  State<ChallengeCalendar> createState() => _ChallengeCalendarState();
}

class _ChallengeCalendarState extends State<ChallengeCalendar> {
  DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  bool _isDateSelected = false;

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
    });
  }

  void _nextMonth() {
    if (_currentDate.month < DateTime.now().month ||
        _currentDate.year < DateTime.now().year) {
      setState(() {
        _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
      });
    }
  }

  void _selectDate(int day) {
    setState(() {
      _selectedDate = DateTime(_currentDate.year, _currentDate.month, day);
      _isDateSelected = true;
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 왼쪽 아이콘 버튼
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        onPressed: _previousMonth,
                      ),

                      // 중앙 텍스트
                      Text(
                        currentMonth,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      // 오른쪽 버튼: 현재 월일 때는 Container로 변경
                      _currentDate.month < DateTime.now().month ||
                              _currentDate.year < DateTime.now().year
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                              onPressed: _nextMonth,
                            )
                          : const SizedBox(
                              // 오른쪽 버튼을 컨테이너로 대체
                              width: 48, // 적당한 너비 지정
                              height: 48, // 적당한 높이 지정
                            ),
                    ],
                  ),
                ),
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
                      bool isSelected = _selectedDate.day == day &&
                          _selectedDate.month == _currentDate.month;
                      double opacity = opacities[dayIndex % opacities.length];

                      return GestureDetector(
                        onTap: () => _selectDate(day),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white
                                : dayCompletion[dayIndex]
                                    ? Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(opacity)
                                    : Theme.of(context).colorScheme.scrim,
                            borderRadius: BorderRadius.circular(5),
                            border: isSelected
                                ? Border.all(
                                    color: Colors.orange,
                                    width: 2,
                                  )
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: isSelected
                              ? Text(
                                  "$day",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          if (_isDateSelected)
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: ChallengeCheckList(),
            ),
        ],
      ),
    );
  }
}
