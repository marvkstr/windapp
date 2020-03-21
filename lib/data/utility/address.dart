class Address {
  final String country;
  final String state;
  final int postalCode;
  final String town;
  final String street;
  final int number;
  final String numberSupplement;

  Address(this.country,
      this.state,
      this.postalCode,
      this.town,
      this.street,
      this.number,
      {this.numberSupplement = ''});

  @override
  String toString() {
     return street + numberSupplement + ' ' + number.toString() + ', ' + postalCode.toString() + ' ' + town + ', ' + state + ', ' + country;
  }
}
