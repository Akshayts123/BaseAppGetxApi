enum OrderType {
  all("All"),
  supermarket("Supermarket"),
  restaurant("Restaurant"),
  homeService("Home Service"),
  maid("Maid"),
  rentCar("Rent a Car"),
  events("Events & Tickets");

  final String value;
  const OrderType(this.value);

  static OrderType fromString(String value) {
    return OrderType.values.singleWhere(
        (element) => element.value.toLowerCase() == value.toLowerCase());
  }
}
