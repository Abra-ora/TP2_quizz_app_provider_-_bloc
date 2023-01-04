import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_using_privider/provider/theme_manager_provider.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool darkModeActivated = false;
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeManagerProvider>(context);
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blue;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          darkModeActivated = true;
          return Colors.blue.withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          darkModeActivated = false;
          return Colors.grey.shade400;
        }
        return null;
      },
    );

    return Switch(
      // This bool value toggles the switch.
      value: darkModeActivated,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
      onChanged: (bool value) {
        setState(() {
          darkModeActivated = value;
          themeModel.toggleDarkMode();
        });
      },
    );
  }
}