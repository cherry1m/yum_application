import 'package:flutter/material.dart';

class IngredientAddView extends StatefulWidget {
  final bool reverse;
  const IngredientAddView({super.key, this.reverse = true});

  @override
  State<IngredientAddView> createState() => _IngredientAddViewState();
}

class _IngredientAddViewState extends State<IngredientAddView> {
  final ScrollController _scrollController = ScrollController();
  late double _screenWidth;
  late ColorScheme _colorScheme;
  final double _padding = 10.0; // 위젯 간의 패딩
  final int _animationDuration = 4000; // 애니메이션 지속 시간
  final int _visibleItems = 6;

  @override
  void initState() {
    super.initState();

    // 애니메이션을 시작하기 위해 일정 시간마다 스크롤 위치를 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  // 애니메이션 시작 메서드
  void _startAnimation() {
    if (_scrollController.hasClients) {
      _scrollController
          .animateTo(
        _scrollController.position.maxScrollExtent, // 끝까지 애니메이션
        duration: Duration(milliseconds: _animationDuration),
        curve: Curves.linear,
      )
          .then((_) {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
        _startAnimation();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width; // 화면 너비 가져오기
    _colorScheme = Theme.of(context).colorScheme;
    return ListView.builder(
      reverse: widget.reverse,
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(), // 사용자가 수동으로 스크롤하지 못하도록 설정
      itemBuilder: (context, index) {
        // 무한 스크롤 효과를 위해 0 ~ _visibleItems까지 반복

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          child: Container(
            width: _screenWidth / 3.5, // 각 컨테이너 크기

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2.0, color: _colorScheme.secondary)),
            child: const Center(
                child: Text(
              '맥주',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )),
          ),
        );
      },
      itemCount: _visibleItems, // 적은 수의 아이템을 반복하여 표시
    );
  }
}
