import 'package:flutter/material.dart';

class SettingsTabPage extends StatefulWidget {
  const SettingsTabPage({Key? key}) : super(key: key);

  @override
  State<SettingsTabPage> createState() => _SettingsTabPageState();
}

class _SettingsTabPageState extends State<SettingsTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Settings"
      ),
    );
  }
}
