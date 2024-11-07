enum HeightScaleEnum {
  cm(key: 'cm'),
  ft(key: 'ft');

  const HeightScaleEnum({required this.key});
  final String key;
}

enum WeightScaleEnum {
  kgs(key: 'kgs'),
  lbs(key: 'lbs');

  const WeightScaleEnum({required this.key});
  final String key;
}

enum GenderScaleEnum {
  male(key: 'c'),
  female(key: 'f'),
  others(key: 'others');

  const GenderScaleEnum({required this.key});
  final String key;
}
