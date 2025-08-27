import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/basic_ingredient_list.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/basic_ingredient_list_view_model.dart';
import 'package:yum_application/src/ui/common/widgets/ingredient_tile.dart';

/// 사용자의 재료 그리드 뷰
///
/// 전달된 아이템만큼 그리드를 생성합니다.
/// [IngredientTile]로 렌더링됩니다.
class BasicIngredientGridView extends ConsumerWidget {
  final List<BasicIngredient> ingredients;
  final String label;
  final ValueSetter<BasicIngredient>? onItemTap;
  const BasicIngredientGridView({
    super.key,
    required this.ingredients,
    required this.label,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basicIngredientListState =
        ref.watch(basicIngredientListViewModelProvider);
    final basicIngredientListVM =
        ref.read(basicIngredientListViewModelProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: ingredients
                .map((i) => GestureDetector(
                      onTap: () {
                        if (onItemTap == null) return;
                        onItemTap!(i);
                      },
                      child: Consumer(builder: (context, provider, child) {
                        return IngredientTile(
                          isFavorite: basicIngredientListState.isFavorite(i),
                          ingredient: i,

                          /// 사용자의 즐겨찾기 유무를 토글링 하는 함수
                          ///
                          /// 즐겨찾기가 등록되면 아이콘이 활성화됨.
                          /// 탭을 통해서 즐겨찾기의 true false를 토글링.
                          onTap: () {
                            basicIngredientListVM.onEvent(
                                FavoriteIngredientCreateRequest(
                                    category: i.category));
                          },
                        );
                      }),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
