class Manufacturer {
  static const Manufacturer VESTAS = Manufacturer("Vestas");
  static const Manufacturer SIEMENS = Manufacturer("Siemens");
  static const Manufacturer ENERCON = Manufacturer("Enercon");
  static const Manufacturer GENERAL_ELECTRIC = Manufacturer("General Electric");
  static const Manufacturer NORDEX = Manufacturer("NordEx");
  static const Manufacturer SCHUETZ = Manufacturer("Schütz");

  final String _name;

  const Manufacturer(this._name);

  String get name {
    return _name;
  }

  String toString(){
    return _name;
  }
}
