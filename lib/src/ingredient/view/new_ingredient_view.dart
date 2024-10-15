import 'package:flutter/material.dart';
import 'package:yum_application/src/App.dart';

class IngredientAddView extends StatelessWidget {
  const IngredientAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "새로운 식재료",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          _add(),
          _description(),
          Spacer(), // 이 부분을 추가하여 등록 버튼을 화면 하단에 위치
          _button(),
        ],
      ),
    );
  }

  // 주황색 네모 안에 플러스 아이콘 버튼
  Widget _add() => Container(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFF4920),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              minimumSize: Size(100, 100),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      );

  Widget _description() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("재료 이름", style: TextStyle(fontSize: 18)),
          Container(
            width: 185,
            height: 44,
            decoration: BoxDecoration(
              color: Color(0xff323232),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              "재료 수",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            children: [
              Container(
                width: 90,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xff323232), // 회색 배경
                  borderRadius: BorderRadius.circular(16), // 둥근 모서리
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Container(
                  width: 40,
                  height: 44,
                  decoration: BoxDecoration(
                      color: Color(0xff323232),
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Row(
                    children: [
                      Text(
                        "개",
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_drop_down_sharp),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "구매 날짜",
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0xff323232), // 회색 배경
                            borderRadius: BorderRadius.circular(16), // 둥근 모서리
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "년",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.arrow_drop_down_sharp),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: _datePickerContainer("월"),
                        ),
                        _datePickerContainer("일"),
                        // Text("~", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "소비기한",
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0xff323232), // 회색 배경
                            borderRadius: BorderRadius.circular(16), // 둥근 모서리
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "년",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.arrow_drop_down_sharp),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: _datePickerContainer("월"),
                        ),
                        _datePickerContainer("일"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      );

  Widget _datePickerContainer(String text) => Container(
        width: 40, // 날짜 선택 박스의 크기를 넓혀서 화면 깨짐 방지
        height: 44,
        decoration: BoxDecoration(
          color: Color(0xff323232),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
            Icon(Icons.arrow_drop_down_sharp),
          ],
        ),
      );

  Widget _button() => Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 40.0),
        child: ElevatedButton(
            onPressed: () {},
            child: Container(
              width: 354,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xff323232), // 회색 배경
                borderRadius: BorderRadius.circular(12), // 둥근 모서리
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "등록하기",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      );
}
