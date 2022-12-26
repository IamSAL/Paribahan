import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paribahan/widgets/backward_btn.dart';

class PariBahanAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isLoggedIn;
  final bool isDark;
  const PariBahanAppBar(
      {Key? key, this.isDark = false, this.isLoggedIn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).colorScheme.brightness;
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        systemStatusBarContrastEnforced: false,
        statusBarColor: const Color(0xFFFAFAFC),
        statusBarIconBrightness:
            brightness == Brightness.dark ? Brightness.light : Brightness.dark,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      excludeHeaderSemantics: true,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: Navigator.of(context).canPop() == true
          ? BackwardBtn(
              onTap: () => Navigator.of(context).pop(),
            )
          : null,
      leadingWidth: 110,
      title: const Image(image: AssetImage('assets/images/paribahan_logo.png')),
      actions: [
        isLoggedIn == true
            ? Image(image: AssetImage('assets/images/loggedin_avatar.png'))
            : Image(image: AssetImage('assets/images/avatar.png'))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
