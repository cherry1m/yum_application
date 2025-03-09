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
  DateTime _currentDate = DateTime.now(); // 현재 표시 중인 달
  DateTime _selectedDate = DateTime.now(); // 선택된 날짜
  bool _isDateSelected = false; // 날짜 선택 여부

  // 이전 달로 이동하는 함수
  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
    });
  }

  // 다음 달로 이동하는 함수 (현재 월을 초과하지 않도록 제한)
  void _nextMonth() {
    if (_currentDate.month < DateTime.now().month ||
        _currentDate.year < DateTime.now().year) {
      setState(() {
        _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
      });
    }
  }

  // 특정 날짜 선택 시 호출되는 함수
  void _selectDate(int day) {
    setState(() {
      _selectedDate = DateTime(_currentDate.year, _currentDate.month, day);
      _isDateSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime(_currentDate.year, _currentDate.month + 1, 0)
        .day; // 해당 월의 총 일수
    int startWeekday =
        DateTime(_currentDate.year, _currentDate.month, 1).weekday % 7; // 시작 요일
    String currentMonth =
        DateFormat('yyyy년 M월').format(_currentDate); // 현재 월 표시 형식

    // 임시로 날짜 완료 여부를 랜덤하게 설정한 리스트
    List<bool> dayCompletion =
        List.generate(daysInMonth, (index) => index % 2 == 0);

    // 날짜 배경색 투명도 리스트
    List<double> opacities = [0.23, 0.51, 0.96, 1.0, 0.75];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // 챌린지 제목
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

          // 캘린더 컨테이너
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
                // 달 이동 버튼 및 현재 월 표시
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 이전 달 버튼
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        onPressed: _previousMonth,
                      ),

                      // 현재 월 텍스트
                      Text(
                        currentMonth,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      // 다음 달 버튼 (현재 월이면 비활성화)
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
                              // 비활성화 시 공백 컨테이너로 대체
                              width: 48,
                              height: 48,
                            ),
                    ],
                  ),
                ),

                // 달력 그리드 뷰
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, // 한 줄에 7개 (요일 수)
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 7 + daysInMonth + startWeekday, // 요일 + 날짜 개수
                  itemBuilder: (context, index) {
                    if (index < 7) {
                      // 요일 표시 (일~토)
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
                      int dayIndex = index - 7 - startWeekday; // 날짜 시작 위치 계산
                      if (dayIndex < 0 || dayIndex >= daysInMonth) {
                        return const SizedBox(); // 빈 공간 채우기
                      }
                      int day = dayIndex + 1; // 실제 날짜 값
                      bool isSelected = _selectedDate.day == day &&
                          _selectedDate.month == _currentDate.month; // 선택 여부
                      double opacity =
                          opacities[dayIndex % opacities.length]; // 배경 투명도

                      return GestureDetector(
                        onTap: () => _selectDate(day), // 날짜 선택 이벤트
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white // 선택된 날짜는 흰색 배경
                                : dayCompletion[dayIndex] // 완료 여부에 따른 배경색 설정
                                    ? Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(opacity)
                                    : Theme.of(context).colorScheme.scrim,
                            borderRadius: BorderRadius.circular(5),
                            border: isSelected
                                ? Border.all(
                                    color: Colors.orange, // 선택 시 테두리 강조
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

          // 선택된 날짜가 있으면 체크리스트 표시
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
