import 'package:bmi_calculator/features/home/bloc/bmi_bloc.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_event.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog(
      {super.key,
      required this.height,
      required this.weight,
      required this.heightType,
      required this.weightType,
      required this.gender,
      required this.bmi,
      required this.bmiStatus,
      required this.resultColor});
  final String height;
  final String weight;
  final String heightType;
  final String weightType;
  final String gender;
  final double bmi;
  final String bmiStatus;
  final Color resultColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculateBloc, CalculateState>(
      builder: (context, state) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.zero,
          content: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60, // Height of the green portion
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        color: resultColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 24, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: resultColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              child: Text(bmiStatus,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                            )),
                        Text('Gender: ${gender.toUpperCase()}'),
                        Text('Height: $height ${heightType}'),
                        Text('Weight: $weight ${weightType}'),
                        Row(
                          children: [
                            const Text('BMI: '),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: resultColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0),
                                  child: Text(
                                    bmi.toStringAsFixed(2),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 35,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.star,
                      size: 30,
                      color: resultColor,
                    ),
                  )),
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                  width: 60,
                  height: 20,
                  decoration: const BoxDecoration(),
                  child: BlocBuilder<CalculateBloc, CalculateState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.red)),
                          onPressed: () {
                            // state.heightController.clear();
                            // state.weightController.clear();
                            context
                                .read<CalculateBloc>()
                                .add(CloseCalculation());
                            Navigator.of(context).pop();
                          },
                          child: Text('Close',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )));
                    },
                  )),
            )
          ],
        );
      },
    );
  }
}
