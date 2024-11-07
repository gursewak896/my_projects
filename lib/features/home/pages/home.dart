import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/features/bloc/theme_bloc.dart';
import 'package:bmi_calculator/features/bloc/theme_event.dart';
import 'package:bmi_calculator/features/bloc/theme_state.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_bloc.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_event.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_state.dart';
import 'package:bmi_calculator/features/home/components/custom_dropdown.dart';
import 'package:bmi_calculator/features/home/components/custom_radio_button.dart';
import 'package:bmi_calculator/features/home/components/custom_textformfield.dart';
import 'package:bmi_calculator/features/home/constants/constants.dart';
import 'package:bmi_calculator/features/home/pages/result_dialog.dart';
import 'package:bmi_calculator/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bmiKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculateBloc(),
      child: Scaffold(
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 26, bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calculate,
                            size: 22,
                          ),
                          bText(context, 'BMI Calculator'),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: BlocBuilder<ThemeBloc, ThemeState>(
                          builder: (context, state) {
                            return Icon(
                              state.isDarkMode
                                  ? Icons.wb_sunny
                                  : Icons.brightness_3,
                              color: AppColors.dayNightIconColor,
                            );
                          },
                        ),
                        onPressed: () {
                          context.read<ThemeBloc>().add(TogglePressedEvent());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Form(
                    key: _bmiKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            mText(context, "Hi Welcome!"),
                            const Spacer(),
                            BlocBuilder<CalculateBloc, CalculateState>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
                                    _bmiKey.currentState?.reset();
                                  },
                                  child: Container(
                                    width: 34,
                                    height: 28,
                                    decoration: const BoxDecoration(
                                        color: AppColors.baseColor,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        bText(context, "Calculate your BMI"),
                        const SizedBox(
                          height: 24,
                        ),
                        BlocBuilder<CalculateBloc, CalculateState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                m1Text(
                                  context,
                                  "Gender:",
                                ),
                                const Spacer(),
                                CustomRadioButton(
                                    value: "male",
                                    onChanged: (value) {
                                      context
                                          .read<CalculateBloc>()
                                          .add(GenderChanged(value!));
                                    }),
                                m2Text(context, "M"),
                                CustomRadioButton(
                                    value: "female",
                                    onChanged: (value) {
                                      context
                                          .read<CalculateBloc>()
                                          .add(GenderChanged(value!));
                                    }),
                                m2Text(context, "F"),
                                CustomRadioButton(
                                    value: "others",
                                    onChanged: (value) {
                                      context
                                          .read<CalculateBloc>()
                                          .add(GenderChanged(value!));
                                    }),
                                m2Text(context, "Others"),
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        m1Text(
                          context,
                          "Height in (ft/cm): ",
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        BlocBuilder<ThemeBloc, ThemeState>(
                          builder: (context, themeState) {
                            return BlocBuilder<CalculateBloc, CalculateState>(
                              builder: (context, calculateState) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: CustomTextformfield(
                                        onChanged: (value) {
                                          context
                                              .read<CalculateBloc>()
                                              .add(HeightChanged(value));
                                        },
                                        hintText: "Enter your Height",
                                        prefixIcon: const Icon(Icons.height),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomDropdown(
                                        onChanged: (value) {
                                          context
                                              .read<CalculateBloc>()
                                              .add(HeightTypeChanged(value!));
                                        },
                                        value: calculateState.heightType,
                                        item: HeightScaleEnum.values
                                            .map((e) => e.key)
                                            .toList()),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        m1Text(
                          context,
                          "Weight in (kgs/pounds): ",
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        BlocBuilder<ThemeBloc, ThemeState>(
                          builder: (context, themeState) {
                            return BlocBuilder<CalculateBloc, CalculateState>(
                              builder: (context, calculateState) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: CustomTextformfield(
                                        onChanged: (value) {
                                          context
                                              .read<CalculateBloc>()
                                              .add(WeightChanged(value));
                                        },
                                        hintText: "Enter your Weight",
                                        prefixIcon:
                                            const Icon(Icons.emoji_people),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomDropdown(
                                        onChanged: (value) {
                                          context
                                              .read<CalculateBloc>()
                                              .add(WeightTypeChanged(value!));
                                        },
                                        value: calculateState.weightType,
                                        item: WeightScaleEnum.values
                                            .map((e) => e.key)
                                            .toList())
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        BlocBuilder<CalculateBloc, CalculateState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: 100,
                              height: 40,
                              child:
                                  BlocListener<CalculateBloc, CalculateState>(
                                listener: (context, state) {
                                  if (state.isCalculated) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ResultDialog(
                                          height: state.height,
                                          weight: state.weight,
                                          heightType: state.heightType,
                                          weightType: state.weightType,
                                          gender: state.gender,
                                          bmi: state.bmiResult,
                                          bmiStatus: state.status,
                                          resultColor: state.resultColor,
                                        );
                                      },
                                    );
                                  }
                                },
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: AppColors.baseColor,
                                    ),
                                    onPressed: () {
                                      if (_bmiKey.currentState!.validate()) {
                                        context
                                            .read<CalculateBloc>()
                                            .add(CalculatePressed());
                                      }
                                      // FocusScope.of(context).unfocus();
                                    },
                                    child: tText(
                                      "Calculate",
                                    )),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
