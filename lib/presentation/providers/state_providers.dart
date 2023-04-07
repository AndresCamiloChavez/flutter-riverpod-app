

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

final countProvider = StateProvider<int>((ref) {
  return 5;
});

final isDarkProvider = StateProvider<bool>((ref) => false);

final randomNameProvider = StateProvider<String>((ref) => RandomGenerator.getRandomName());