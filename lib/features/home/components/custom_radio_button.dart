import 'package:bmi_calculator/features/home/bloc/bmi_bloc.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {super.key, required this.value, required this.onChanged});
  final String value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculateBloc, CalculateState>(
      builder: (context, state) {
        return Radio<String>(
          value: value,
          groupValue: state.gender,
          onChanged: onChanged,
        );
      },
    );
  }
}
