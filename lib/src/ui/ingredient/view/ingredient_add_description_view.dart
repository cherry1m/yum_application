import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/common/widgets/date_picker_widget.dart';
import 'package:yum_application/src/ui/common/widgets/scroll_date_dialog.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';

class IngredientAddDescriptionView extends StatelessWidget {
  const IngredientAddDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _ingredientName(),
      _ingredientPeriod(),
    ]);
  }

  Widget _ingredientName() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Builder(builder: (context) {
              return Text(
                "재료 이름",
                style: Theme.of(context).textTheme.headlineSmall,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: 155,
              height: 44,
              child: Builder(builder: (context) {
                final viewModel =
                    context.read<NewRefreginatorIngredientViewModel>();
                return TextField(
                  onChanged: (value) => viewModel
                      .onEvent(UpdateSelectedIngredientName(newName: value)),
                  decoration: InputDecoration(
                    // 재료가 선택되면 선택한 기본재료의 이름이 hintLabel로 지정됨.
                    hintText: viewModel.selectedIngredient?.name ?? "",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              }),
            ),
          )
        ],
      );

  Widget _ingredientPeriod() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                    Consumer<NewRefreginatorIngredientViewModel>(
                        builder: (context, provider, child) {
                      return DatePickerWidget(
                        time: provider.state.startAt,
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
                                      provider.onEvent(
                                          UpdateSelectedIngredientStartAt(
                                              newStartAt: newStartAt));
                                    },
                                    onEndAtComp: (newEndAt) => provider.onEvent(
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
                        // Consumer<RefreginatorIngredientViewModel>(
                        //   builder: (context, provider, child) {
                        //     return Switch(
                        //       // value: false,
                        //       value: provider.notINF &&
                        //           provider.selectedIngredient != null,
                        //       onChanged: provider.toggleNotInfinity,
                        //       activeColor:
                        //           Theme.of(context).colorScheme.secondary,
                        //       inactiveThumbColor: Colors.grey,
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Consumer<NewRefreginatorIngredientViewModel>(
                        builder: (context, provider, child) {
                      // if (provider.notInfinity) {
                      return DatePickerWidget(
                        time: provider.state.endAt,
                        notINF: true,
                        onTap: () {
                          showModalBottomSheet(
                              isDismissible: false,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32.0))),
                              context: context,
                              builder: (context) => ScrollDateDialog(
                                    onStartAtComp: (newStartAt) =>
                                        provider.onEvent(
                                            UpdateSelectedIngredientStartAt(
                                                newStartAt: newStartAt)),
                                    onEndAtComp: (newEndAt) => provider.onEvent(
                                        UpdateSelectedIngredientEndAt(
                                            newEndAt: newEndAt)),
                                  ));
                        },
                      );
                      // }
                      // return Container(
                      //   padding: const EdgeInsets.only(
                      //       top: 10.0, bottom: 10.0, right: 16.0),
                      //   height: 40,
                      //   width: 163,
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context)
                      //         .colorScheme
                      //         .onPrimaryContainer,
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   child: Center(
                      //       child: Text(
                      //     "무제한",
                      //     style: Theme.of(context).textTheme.labelSmall,
                      //   )),
                      // );
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
      );
}
