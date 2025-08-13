enum Gender {
  female("Female"),
  male("Male"),
  other("Other");

  final String value;

  const Gender(this.value);
  static Gender fromString(String value) {
    return Gender.values.singleWhere(
        (element) => element.value.toLowerCase() == value.toLowerCase());
  }
}
