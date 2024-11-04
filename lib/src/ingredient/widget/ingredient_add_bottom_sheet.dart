import 'package:flutter/material.dart';

class IngredientAddBottomSheet extends StatelessWidget {
  const IngredientAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 634,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 즐겨찾기
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: Text(
                  "즐겨찾기",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(3, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
              // 밥 빵 면
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text(
                  "밥 빵 면",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(3, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
              // 채소 및 과일
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text(
                  "채소 및 과일",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(9, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
              // 육류 및 계란
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text(
                  "육류 및 계란",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(5, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
              // 해산물
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text(
                  "해산물",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(2, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
              // 가공식품
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text(
                  "가공식품",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(6, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
              // 유제품 및 견과류
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text(
                  "유제품 및 견과류",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(4, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
              // 주류
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                child: Text(
                  "주류",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(3, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
