import 'package:flutter/material.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/screens/business/discover/screen_create_task.dart';
import 'package:quickprism/presentation/widgets/floating_action_button/app_primary_floating_button.dart';

class ScreenBusinessDiscover extends StatelessWidget {
  const ScreenBusinessDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(100),
        child: AppPrimaryFloatingButton(
          heroTag: "create task",
          toolTip: "Create task",
          onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenCreateTask(),));
          },
        ),
      ),
      body: Center(
        child: Text(
          'Discover',
          style: AppStyles.appBarTitle,
        ),
      ),
    );
  }
}
