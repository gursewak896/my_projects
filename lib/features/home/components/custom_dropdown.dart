import 'package:bmi_calculator/features/bloc/theme_bloc.dart';
import 'package:bmi_calculator/features/bloc/theme_state.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_bloc.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.item});
  final ValueChanged onChanged;
  final List<String> item;
  final String value;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String defaultHeightType = 'ft';

  var heightTypes = ['ft', 'cm'];

  String defaultWeightType = 'kgs';

  var weightTypes = ['kgs', 'lbs'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<CalculateBloc, CalculateState>(
          builder: (context, calculateState) {
            return Container(
              height: 56,
              decoration: BoxDecoration(
                  color: themeState.isDarkMode
                      ? Colors.white.withOpacity(0.25)
                      : Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: Align(
                alignment: Alignment.center,
                child: DropdownButton(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    focusColor: themeState.isDarkMode
                        ? Colors.white.withOpacity(0.25)
                        : Colors.purple.withOpacity(0.1),
                    value: widget.value,
                    underline: const SizedBox.shrink(), // Removes underline
                    items: widget.item.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: widget.onChanged),
              ),
            );
          },
        );
      },
    );
  }
}
