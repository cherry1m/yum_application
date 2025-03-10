import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/view/resister_complete_header_view.dart';
import 'package:yum_application/src/ui/auth/viewModel/resister_complete_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/next_button.dart';

class ResisterCompleteView extends StatelessWidget {
  const ResisterCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            _allAgree(),
            _firstAgree(),
            _secondAgree(),
            _lastAgree(),
            const SizedBox(
              height: 60,
            ),
            _button(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        elevation: 0.0,
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 430),
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: ResisterCompleteHeaderView(),
            )),
      );

  Widget _allAgree() =>
      Consumer<ResisterCompleteViewModel>(builder: (context, provider, child) {
        return Row(
          children: [
            Checkbox(
                activeColor: Theme.of(context).colorScheme.primary,
                value: provider.isAllAgree,
                onChanged: provider.allAgree),
            const Text(
              "전체 동의",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )
          ],
        );
      });

  Widget _firstAgree() => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Consumer<ResisterCompleteViewModel>(
            builder: (context, provider, child) {
          return Row(
            children: [
              Checkbox(
                  visualDensity: VisualDensity.compact,
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: provider.isAgreeFirst,
                  onChanged: provider.toggleFirstAgree),
              const Text(
                "서비스 이용 약관(필수)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          );
        }),
      );

  Widget _secondAgree() => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Consumer<ResisterCompleteViewModel>(
            builder: (context, provider, child) {
          return Row(
            children: [
              Checkbox(
                  visualDensity: VisualDensity.compact,
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: provider.isAgreeSecond,
                  onChanged: provider.toggleSecondAgree),
              const Text(
                "개인정보 수집 및 이용동의(필수)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          );
        }),
      );

  Widget _lastAgree() => Padding(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: Consumer<ResisterCompleteViewModel>(
            builder: (context, provider, child) {
          return Row(
            children: [
              Checkbox(
                  visualDensity: VisualDensity.compact,
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: provider.isAgreeLast,
                  onChanged: provider.toggleLastAgree),
              const Text(
                "서비스 푸시 알림 수신 동의(선택)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          );
        }),
      );

  Widget _button() => Builder(builder: (context) {
        return NextButton(
          label: "시작하기",
          onTap: context.read<ResisterCompleteViewModel>().resiter,
        );
      });
}
