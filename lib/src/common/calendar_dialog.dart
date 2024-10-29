import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({super.key});

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xff686868)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(),
          _weekDay(),
          _calendar(),
        ],
      ),
    );
  }

  Widget _header() {
    DateTime nowMonth = DateTime.now();

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Row(
        children: [
          Container(
            color: Colors.green,
            child: Text(
              DateFormat("yyyy년 MM월").format(nowMonth),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.blue,
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xffffffff),
                size: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.red,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffffffff),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _weekDay() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeekText(label: "일"),
          WeekText(label: "월"),
          WeekText(label: "화"),
          WeekText(label: "수"),
          WeekText(label: "목"),
          WeekText(label: "금"),
          WeekText(label: "토"),
        ],
      ),
    );
  }
}

Widget _calendar() {
  return Expanded(
    child: GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 35,
      itemBuilder: (context, index) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "${index + 1}",
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}

class WeekText extends StatelessWidget {
  final String label;
  const WeekText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xff111111),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
