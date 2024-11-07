import 'package:bmi_calculator/features/home/bloc/bmi_event.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(CalculateState()) {
    on<GenderChanged>((event, emit) {
      emit(state.copyWith(gender: event.gender, isCalculated: false));
    });

    on<WeightChanged>((event, emit) {
      emit(state.copyWith(weight: event.weight, isCalculated: false));
    });

    on<HeightChanged>((event, emit) {
      emit(state.copyWith(height: event.height, isCalculated: false));
    });

    on<HeightTypeChanged>((event, emit) {
      emit(state.copyWith(heightType: event.heightType, isCalculated: false));
    });

    on<WeightTypeChanged>((event, emit) {
      emit(state.copyWith(weightType: event.weightType, isCalculated: false));
    });

    on<ResetButtonPressed>((event, emit) {
      // state.weight.;
      // state.heightController.clear();
    });

    on<CloseCalculation>((event, emit) {
      emit(state.copyWith(
        isCalculated: false, // Reset isCalculated to false
      ));
    });

    on<CalculatePressed>((event, emit) {
      double height = double.parse(state.height);
      double weight = double.parse(state.weight);
      double finalHeight = 0;
      double finalWeight = 0;
      double bmi = 0;
      String status = "";
      Color resultColor = Colors.green;

      // Calculation logic
      if (state.heightType == 'ft') {
        finalHeight = (height * 30.48);
      } else if (state.heightType == 'cm') {
        finalHeight = (height);
      }

      if (state.weightType == 'lbs') {
        finalWeight = (weight * 0.4535);
      } else if (state.weightType == 'kgs') {
        finalWeight = (weight);
      }

      bmi = (finalWeight / (finalHeight * finalHeight)) * 10000;

      if (bmi < 15) {
        status = "Very Severely Underweight";
        resultColor = Colors.red;
      } else if (bmi >= 15 && bmi <= 16.9) {
        status = "Severely Underweight";
        resultColor = Colors.red;
      } else if (bmi >= 17 && bmi <= 18.4) {
        status = "Underweight";
        resultColor = Colors.orange;
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        status = "Normal Weight";
        resultColor = Colors.green;
      } else if (bmi >= 25 && bmi <= 29.9) {
        status = "Overweight";
        resultColor = Colors.orange;
      } else if (bmi >= 30 && bmi <= 34.9) {
        status = "Obese Class I";
        resultColor = Colors.red;
      } else if (bmi >= 35 && bmi <= 39.9) {
        status = "Obese Class II";
        resultColor = Colors.red;
      } else if (bmi >= 40 && bmi <= 49.9) {
        status = "Obese Class III";
        resultColor = Colors.red;
      } else if (bmi >= 50) {
        status = "Severely Obese";
        resultColor = Colors.red;
      }

      emit(state.copyWith(
          bmiResult: bmi,
          status: status,
          resultColor: resultColor,
          isCalculated: true));
    });
  }
}
