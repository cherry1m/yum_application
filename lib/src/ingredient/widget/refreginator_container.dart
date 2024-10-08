import 'package:flutter/material.dart';
import 'package:yum_application/src/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/widget/page_indicator.dart';

class RefreginatorContainer extends StatefulWidget {
  final List<Ingredient> children;
  final int rowCount;
  final String label;
  const RefreginatorContainer({
    super.key,
    required this.children,
    this.rowCount = 2,
    required this.label,
  })  : assert(children.length > 0, "children can not be empty array"),
        assert(rowCount >= 2, "rowCount must bigger than two");

  @override
  State<RefreginatorContainer> createState() => _RefreginatorContainerState();
}

class _RefreginatorContainerState extends State<RefreginatorContainer>
    with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  late final List<List<List<dynamic>>> _items;
  late final int _totalPage;
  late final PageController _pageController;
  late final TabController _tabController;

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _pageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageController.jumpToPage(index);
  }

  List<List<List<dynamic>>> convertTo3D(List<Ingredient> children) {
    final oneDArray = children.map((i) => _buildItem(i)).toList();
    int groupSize = widget.rowCount * 4;

    // 3차원 배열을 저장할 리스트
    List<List<List<Widget>>> threeDArray = [];

    // 배열을 8개씩 나누어 처리
    for (int i = 0; i < oneDArray.length; i += groupSize) {
      // 8개씩 자른 서브 리스트를 만듦
      List<Widget> sublist = oneDArray.sublist(i,
          i + groupSize > oneDArray.length ? oneDArray.length : i + groupSize);

      // 마지막 그룹이 8개 미만이면 Container()로 채움
      if (sublist.length < groupSize) {
        sublist = sublist +
            List.generate(
                groupSize - sublist.length, (index) => _generateEmtpy());
      }

      // 3차원 배열 규칙에 맞게 추가
      threeDArray.add(List.generate(widget.rowCount,
          (index) => sublist.sublist(index * 4, (index + 1) * 4)));
    }

    return threeDArray;
  }

  @override
  void initState() {
    _totalPage = widget.children.length ~/ 8 + 1;
    _pageController = PageController();
    _tabController = TabController(length: _totalPage, vsync: this);
    _items = convertTo3D(widget.children);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: widget.rowCount * 130),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Theme.of(context).colorScheme.onPrimaryContainer),
      child: Stack(
        children: [
          _header(),
          _displayPageView(),
          _indicator(),
        ],
      ),
    );
  }

  Widget _displayPageView() => PageView(
      controller: _pageController,
      onPageChanged: _handlePageViewChanged,
      children: List.generate(
        _items.length,
        (index) => Padding(
          padding:
              const EdgeInsets.only(bottom: 20, top: 20, left: 8, right: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(widget.rowCount, (jndex) {
                final rowItem = _items[index][jndex];
                return _displayItemRow(rowItem);
              })),
        ),
      ));

  Widget _displayItemRow(List<dynamic> row) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
                bottom: BorderSide(width: 2.0, color: Color(0xffE8EEF2)),
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(12.0))),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) => row[index]),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildItem(Ingredient item) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                color: Colors.grey,
              ),
            ),
            Text(item.name)
          ],
        ),
      );

  Widget _generateEmtpy() => Opacity(
        opacity: 0.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                color: Colors.grey,
              ),
            ),
            const Text("Item")
          ],
        ),
      );

  Widget _header() => Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(100.0)),
                width: 50,
                height: 22,
                child: const Icon(
                  Icons.add,
                  size: 20,
                  color: Color(0xff323232),
                ),
              ),
            )
          ],
        ),
      ));

  Widget _indicator() => Align(
        alignment: Alignment.bottomCenter,
        child: (_totalPage > 1)
            ? PageIndicator(
                tabController: _tabController,
                currentPageIndex: _pageIndex,
                onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              )
            : Container(),
      );
}