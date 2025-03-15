import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/loading_progress_indicator.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingProgressIndicator(),
    );
  }
}
