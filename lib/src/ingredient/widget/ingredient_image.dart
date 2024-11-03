import 'package:flutter/material.dart';
import 'package:yum_application/src/common/image_widget.dart';

class IngredientImage extends StatelessWidget {
  final bool isFreezed;
  final String path;
  const IngredientImage(
      {super.key, required this.isFreezed, required this.path});

  @override
  Widget build(BuildContext context) {
    return (isFreezed) ? _freezedIcon() : _icon();
  }

  Widget _freezedIcon() => Stack(
        alignment: Alignment.center,
        children: [
          const ImageWidget(
            path: "assets/images/freezed.png",
            width: 150,
          ),
          ImageWidget(path: path),
        ],
      );

  Widget _icon() => ImageWidget(path: path);
}
