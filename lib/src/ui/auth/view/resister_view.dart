import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/view/resisiter_logo_view.dart';
import 'package:yum_application/src/ui/auth/view/resister_textfield_view.dart';
import 'package:yum_application/src/ui/auth/viewModel/resister_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/next_button.dart';

/// 사용자 회원가입 UI입니다.
class ResisterView extends StatelessWidget {
  const ResisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 회원가입 로고
                _logo(),
                const SizedBox(
                  height: 60,
                ),
                // 회원가입 텍스트 필드 뷰
                _resisterTextFieldView(),
                const SizedBox(
                  height: 60,
                ),
                // 다음 버튼
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() => const ResisterLogoView();

  Widget _resisterTextFieldView() => const ResisterTextFieldView();

  Widget _button() => Builder(builder: (context) {
        return NextButton(
          onTap: context.read<ResisterViewModel>().moveToNext,
        );
      });
}
