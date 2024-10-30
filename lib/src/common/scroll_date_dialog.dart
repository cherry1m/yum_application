import 'package:flutter/material.dart';

class ScrollDateDialog extends StatefulWidget {
  const ScrollDateDialog({super.key});

  @override
  State<ScrollDateDialog> createState() => _ScrollDateDialogState();
}

class _ScrollDateDialogState extends State<ScrollDateDialog> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  int selectedDay = DateTime.now().day;
  int selectedYearIndex = DateTime.now().year - 2000;
  int selectedMonthIndex = DateTime.now().month - 1;
  int selectedDayIndex = DateTime.now().day - 1;
  int daysInMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

  bool isPurchaseDateSelected = true;

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  void updateDaysInMonth() {
    setState(() {
      daysInMonth = getDaysInMonth(selectedYear, selectedMonth);
      if (selectedDay > daysInMonth) {
        selectedDay = daysInMonth;
        selectedDayIndex = selectedDay - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          height: 404,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          child: Column(
            children: [
              _header(),
              _body(),
              _bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isPurchaseDateSelected
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              minimumSize: const Size(80, 26),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                isPurchaseDateSelected = true;
              });
            },
            child: Text(
              "구매날짜",
              style: isPurchaseDateSelected
                  ? Theme.of(context).textTheme.displayMedium
                  : Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: const Color(0xFFD1C6BB), // Inactive color
                      ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 20, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: !isPurchaseDateSelected
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              minimumSize: const Size(80, 26),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                isPurchaseDateSelected = false;
              });
            },
            child: Text(
              "소비기한",
              style: !isPurchaseDateSelected
                  ? Theme.of(context).textTheme.displayMedium
                  : Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: const Color(0xFFD1C6BB),
                      ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Expanded(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 28.0,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Row(
            children: [
              _yearDate(),
              _monthDate(),
              _dayDate(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _yearDate() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          controller:
              FixedExtentScrollController(initialItem: selectedYearIndex),
          itemExtent: 32.0,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedYearIndex = index;
              selectedYear = 2000 + index;
              updateDaysInMonth();
            });
          },
          children: List<Widget>.generate(
            51,
            (int index) {
              bool isSelected = index == selectedYearIndex;
              return Container(
                height: 28.0,
                alignment: Alignment.center,
                child: Text(
                  '${2000 + index}년',
                  style: isSelected
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelMedium,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _monthDate() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          controller:
              FixedExtentScrollController(initialItem: selectedMonthIndex),
          itemExtent: 32.0,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedMonthIndex = index;
              selectedMonth = index + 1;
              updateDaysInMonth();
            });
          },
          children: List<Widget>.generate(
            12,
            (int index) {
              bool isSelected = index == selectedMonthIndex;
              return Container(
                height: 28.0,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}월',
                  style: isSelected
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelMedium,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _dayDate() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          controller:
              FixedExtentScrollController(initialItem: selectedDayIndex),
          itemExtent: 32.0,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedDayIndex = index;
              selectedDay = index + 1;
            });
          },
          children: List<Widget>.generate(
            daysInMonth,
            (int index) {
              bool isSelected = index == selectedDayIndex;
              return Container(
                height: 28.0,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}일',
                  style: isSelected
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelMedium,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _bottom() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          fixedSize: const Size(390, 48),
        ),
        onPressed: () {},
        child: Text(
          "선택하기",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
