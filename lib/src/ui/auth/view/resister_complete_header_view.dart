import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/app_logo.dart';

class ResisterCompleteHeaderView extends StatelessWidget {
  const ResisterCompleteHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logo(),
          const SizedBox(
            height: 32,
          ),
          _title(),
          const SizedBox(
            height: 10,
          ),
          _subTitle(),
        ]);
  }

  Widget _logo() => const Row(
        children: [
          AppLogo(),
        ],
      );

  Widget _title() => const Row(
        children: [
          Text(
            "만나서 반가워요:)",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
        ],
      );

  Widget _subTitle() => const Row(
        children: [
          Text(
            "서비스 이용을 위해 약관에 동의해주세요.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      );
}
