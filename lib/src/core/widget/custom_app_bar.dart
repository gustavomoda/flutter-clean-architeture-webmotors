import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injector.dart';
import '../controllers/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppBar(
          title: Text(title),
          actions: _buildActions(context),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<Widget> _buildActions(BuildContext context) => [
        PopupMenuButton<dynamic>(
          itemBuilder: (context) => [
            ..._themeMenu(context),
            const PopupMenuDivider(),
          ],
          icon: const Icon(Icons.settings),
        )
      ];

  List<PopupMenuItem> _themeMenu(BuildContext context) {
    final controller = injector<ThemeController>();
    return controller.themes.entries.map(
      (e) {
        final isSelected = controller.brightness == e.key;
        return PopupMenuItem<Brightness>(
          value: e.key,
          onTap: () => controller.change(e.key),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(e.value)),
              Icon(
                isSelected ? Icons.radio_button_on : Icons.radio_button_off,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
        );
      },
    ).toList();
  }
}
