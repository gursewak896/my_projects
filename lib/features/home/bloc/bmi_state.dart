import 'package:flutter/material.dart';

class CalculateState {
  final String gender;
  final String weight;
  final String height;
  final String heightType;
  final String weightType;
  final double bmiResult;
  final String status;
  final Color resultColor;
  final bool isCalculated;

  CalculateState({
    this.gender = '',
    this.height = '',
    this.weight = '',
    this.heightType = 'ft',
    this.weightType = 'kgs',
    this.bmiResult = 0,
    this.status = '',
    this.resultColor = Colors.green,
    this.isCalculated = false,
  });

  CalculateState copyWith(
      {String? gender,
      String? weight,
      String? height,
      String? heightType,
      String? weightType,
      double? bmiResult,
      String? status,
      Color? resultColor,
      bool? isCalculated}) {
    return CalculateState(
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      heightType: heightType ?? this.heightType,
      weightType: weightType ?? this.weightType,
      bmiResult: bmiResult ?? this.bmiResult,
      status: status ?? this.status,
      resultColor: resultColor ?? this.resultColor,
      isCalculated: isCalculated ?? this.isCalculated,
    );
  }
}
