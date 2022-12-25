import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PariBahanAppBar extends StatelessWidget with PreferredSizeWidget {
  const PariBahanAppBar({Key? key}) : super(key: key);

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
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      toolbarOpacity: 0,
      title: const Image(image: AssetImage('assets/images/paribahan_logo.png')),
      actions: const [Image(image: AssetImage('assets/images/avatar.png'))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
