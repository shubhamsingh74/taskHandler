import 'package:flutter/material.dart';
import 'package:quickprism/core/colors/app_colors.dart';

class ScreenBusinessFinance extends StatefulWidget {
  const ScreenBusinessFinance({super.key});

  @override
  State<ScreenBusinessFinance> createState() => _ScreenBusinessFinanceState();
}

class _ScreenBusinessFinanceState extends State<ScreenBusinessFinance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance'),
        backgroundColor: AppColors.primaryP3,
        foregroundColor: AppColors.textColorT4,
      ),
    );
  }
}
