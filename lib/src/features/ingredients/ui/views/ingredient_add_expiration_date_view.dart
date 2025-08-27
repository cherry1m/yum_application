import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient.dart';
import 'package:yum_application/src/ui/common/widgets/date_picker_widget.dart';
import 'package:yum_application/src/ui/common/widgets/scroll_date_dialog.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_event.dart';

class IngredientAddExpirationDateView extends StatelessWidget {
  const IngredientAddExpirationDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 구매 날짜
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Builder(builder: (context) {
                  return Text(
                    "구매 날짜",
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Consumer(builder: (context, ref, widget) {
                      final vm = ref.read(
                          createRefreginatorIngredientViewModelProvider
                              .notifier);
                      final startAt = ref.watch(
                          createRefreginatorIngredientViewModelProvider
                              .select((it) => it.startAt));
                      return DatePickerWidget(
                        time: startAt,
                        onTap: () {
                          showModalBottomSheet(
                              isDismissible: false,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32.0))),
                              context: context,
                              builder: (context) => ScrollDateDialog(
                                    onStartAtComp: (newStartAt) {
                                      vm.onEvent(
                                          UpdateSelectedIngredientStartAt(
                                              newStartAt: newStartAt));
                                    },
                                    onEndAtComp: (newEndAt) => vm.onEvent(
                                        UpdateSelectedIngredientEndAt(
                                            newEndAt: newEndAt)),
                                  ));
                        },
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Builder(builder: (context) {
                        return Text(
                          "~",
                          style: Theme.of(context).textTheme.headlineMedium,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 소비기한
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  return SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Text(
                          "소비기한",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Consumer(
                          builder: (context, ref, widget) {
                            final vm = ref.read(
                                createRefreginatorIngredientViewModelProvider
                                    .notifier);
                            final isINF = ref.watch(
                                createRefreginatorIngredientViewModelProvider
                                    .select((it) => it.isINF));
                            return Switch(
                              value: isINF,
                              onChanged: (isINF) => vm.onEvent(
                                  ToggleSelectedIngredientIsINF(isINF: isINF)),
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              inactiveThumbColor: Colors.grey,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Consumer(builder: (context, ref, widget) {
                      final vm = ref.read(
                          createRefreginatorIngredientViewModelProvider
                              .notifier);
                      final endAt = ref.watch(
                          createRefreginatorIngredientViewModelProvider
                              .select((it) => it.endAt));
                      final isINF = ref.watch(
                          createRefreginatorIngredientViewModelProvider
                              .select((it) => it.isINF));

                      return DatePickerWidget(
                        time: endAt,
                        isINF: isINF,
                        onTap: () {
                          showModalBottomSheet(
                              isDismissible: false,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32.0))),
                              context: context,
                              builder: (context) => ScrollDateDialog(
                                    onStartAtComp: (newStartAt) => vm.onEvent(
                                        UpdateSelectedIngredientStartAt(
                                            newStartAt: newStartAt)),
                                    onEndAtComp: (newEndAt) => vm.onEvent(
                                        UpdateSelectedIngredientEndAt(
                                            newEndAt: newEndAt)),
                                  ));
                        },
                      );
                    }),
                    Opacity(
                      opacity: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Builder(
                          builder: (context) {
                            return Text(
                              "~",
                              style: Theme.of(context).textTheme.headlineSmall,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
