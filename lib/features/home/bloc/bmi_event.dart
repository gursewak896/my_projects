abstract class CalculateEvent {}

class GenderChanged extends CalculateEvent {
  GenderChanged(this.gender);
  final String gender;
}

class WeightChanged extends CalculateEvent {
  WeightChanged(this.weight);
  final String weight;
}

class HeightChanged extends CalculateEvent {
  HeightChanged(this.height);
  final String height;
}

class HeightTypeChanged extends CalculateEvent {
  final String heightType;

  HeightTypeChanged(this.heightType);
}

class WeightTypeChanged extends CalculateEvent {
  final String weightType;

  WeightTypeChanged(this.weightType);
}

class ResetButtonPressed extends CalculateEvent {}

class CalculatePressed extends CalculateEvent {}

class CloseCalculation extends CalculateEvent {}
