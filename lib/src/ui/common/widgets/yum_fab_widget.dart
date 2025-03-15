import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

class YumFabWidget extends FloatingActionButton {
  final String path;
  YumFabWidget({
    super.key,
    required super.onPressed,
    required this.path,
  }) : super(
            heroTag: path,
            foregroundColor: const Color(0xffffffff),
            backgroundColor: const Color(0xffFFB300),
            child: ImageWidget(path: path));
}
