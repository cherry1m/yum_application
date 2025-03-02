import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/auth/view/login_logo_view.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

class AppLogo extends StatelessWidget {
  final double width;
  const AppLogo({super.key, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      path: LogoIconPath.logo,
      width: width,
    );
  }
}
