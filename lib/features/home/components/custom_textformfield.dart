import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/core/validators/form_validators.dart';
import 'package:bmi_calculator/features/bloc/theme_bloc.dart';
import 'package:bmi_calculator/features/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield(
      {super.key,
      required this.onChanged,
      required this.hintText,
      required this.prefixIcon});
  final ValueChanged onChanged;
  final String hintText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return TextFormField(
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9-.]"))
            ],
            validator: FormValidator.isEmpty,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              fillColor: themeState.isDarkMode
                  ? AppColors.NightModeTextFieldColor
                  : AppColors.dayModeTextFieldColor,
              filled: true,
              prefixIcon: prefixIcon,
            ));
      },
    );
  }
}
