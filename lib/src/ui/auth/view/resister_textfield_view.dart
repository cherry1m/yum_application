import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/view/resister_view.dart';
import 'package:yum_application/src/ui/auth/viewModel/resister_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/auth_button.dart';
import 'package:yum_application/src/ui/auth/widget/login_text_field.dart';

/// 회원가입 UI 텍스트 필드뷰입니다.
class ResisterTextFieldView extends StatelessWidget {
  const ResisterTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 이메일
        _email(),
        // 닉네임
        _nickName(),
        // 비밀번호
        _password(),
        // 비밀번호 확인
        _passwordAgain(),
      ],
    );
  }

  /// 사용자의 이메일 확인 및 이메일 입력 필드입니다.
  ///
  /// 이메일 형식 혹은 사용가능 여부에 따라서 validation 문구가 나타납니다.
  Widget _email() =>
      Consumer<ResisterViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTextField(
                    width: 272,
                    hintText: "이메일을 입력해주세요",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: provider.validEmail),
                const SizedBox(
                  width: 10,
                ),
                const AuthButton(label: "확인"),
              ],
            ),
            Text(
              provider.emailValidLabel,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffFF3700),
              ),
            ),
          ],
        );
      });

  /// 사용자 닉네임 입력 필드입니다.
  ///
  /// validation은 수행하지 않습니다.
  Widget _nickName() =>
      Consumer<ResisterViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginTextField(
              hintText: "닉네임을 입력해주세요",
              onChanged: provider.validNickName,
            ),
            Text(
              provider.nickNameValidLabel,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffFF3700),
              ),
            ),
          ],
        );
      });

  /// 사용자 비밀번호 필드입니다.
  ///
  /// 이메일 형식 여부에 따라서 validation 문구가 나타납니다.
  Widget _password() =>
      Consumer<ResisterViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginTextField(
              hintText: "비밀번호를 입력해주세요",
              obscureText: true,
              onChanged: provider.validPassword,
            ),
            Text(
              provider.passwordValidLabel,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffFF3700),
              ),
            )
          ],
        );
      });

  /// 사용자 비밀번호 확인 필드입니다.
  ///
  /// 사용자가 위에 입력한 비밀번호와 같은지 validation을 수행합니다.
  Widget _passwordAgain() =>
      Consumer<ResisterViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginTextField(
              hintText: "비밀번호 확인",
              obscureText: true,
              onChanged: provider.validPasswordAgain,
            ),
            Text(
              provider.passwordAgainValidLabel,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffFF3700),
              ),
            )
          ],
        );
      });
}
