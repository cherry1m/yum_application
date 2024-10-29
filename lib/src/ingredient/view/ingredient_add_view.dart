import 'package:flutter/material.dart';
import 'package:yum_application/src/common/date_picker_widget.dart';

class IngredientAddView extends StatefulWidget {
  const IngredientAddView({super.key});

  @override
  State<IngredientAddView> createState() => _IngredientAddViewState();
}

class _IngredientAddViewState extends State<IngredientAddView> {
  bool _isFreezed = false;

  void showBottomSheet() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        title: Text(
          "새로운 식재료",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(250),
            child: SizedBox(
              height: 250,
              child: Center(
                child: GestureDetector(
                  onTap: showBottomSheet,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
      ),
      body: Column(
        children: [
          // _add(),
          _toggle(),
          _description(),
          const Spacer(),
          _botton(),
        ],
      ),
    );
  }

  Widget _add() => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SizedBox(
            width: double.infinity,
            height: 400,
            child: ElevatedButton(
              onPressed: () {
                // IngredientBottomBarView(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
              ),
              child: null,
            ),
          ),
        ),
      );

  Widget _toggle() => Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "냉장",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Switch(
              value: _isFreezed,
              onChanged: (bool value) {
                setState(() {
                  _isFreezed = !_isFreezed;
                });
              },
              activeColor: Colors.grey,
              inactiveThumbColor: Colors.grey,
            )
          ],
        ),
      );

  Widget _description() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "재료 이름",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          width: 155,
          height: 44,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "구매 날짜",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      DatePickerWidget(
                        onTap: () {
                          print("hello!");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "~",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "소비기한",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      DatePickerWidget(
                        onTap: () {
                          print("hello!");
                        },
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            "~",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ]);

  Widget _botton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
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
