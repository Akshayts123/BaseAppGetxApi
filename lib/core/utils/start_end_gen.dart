List<int> generateIntegers(int start, int end) {
  if (start > end) {
    throw ArgumentError(
        'Start number ($start) must be less than or equal to end number ($end).');
  }

  return List.generate(end - start + 1, (i) => start + i);
}
