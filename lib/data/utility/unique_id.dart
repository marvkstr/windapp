import 'dart:math';

/// String wrapper class that creates all-time uniqueness on construction
///
/// UniqueID guaranties to
///  - be of constant, pre-defined length
///  - consist of a limited char set (0-9, a-z, A-Z, + and #)
///  - be unique compared to all other ids that either exist or existed at some point
class UniqueID{
  static const LENGTH = 8;
  static const CHAR_SET_SIZE = 64;
  static final List<String> _registered = [];

  static final Random random = Random.secure();

  final String _id;

  /// Creates a new UniqueID
  UniqueID._(this._id);

  /// Returns a String representing this UniqueID
  String toString(){
    return _id;
  }

  /// Returns whether a given String is available/suitable for use as a UniqueID
  static bool isAvailable(String id){
    if (id.length != LENGTH) return false;
    for (String registeredId in _registered) if (id == registeredId) return false;
    return true;
  }

  /// Creates a valid UniqueID
  ///
  /// Specify an id if desired, if it is not isAvailable(), it will be overwritten
  factory UniqueID({String id = ''}){
    while (!isAvailable(id)){
      id = '';
      for (int i = 0; i < LENGTH; i++){
        id += _getChar(random.nextInt(CHAR_SET_SIZE));
      }
    }

    _registered.add(id);
    return UniqueID._(id);
  }

  /// Returns the char from the used char set at the given index
  static String _getChar(int index){
    if (index < 0) throw ArgumentError('Index may not be negative: index = ' + index.toString());

    if (index < 10) return String.fromCharCode('0'.codeUnitAt(0) + index);
    if (index < 10 + 26) return String.fromCharCode('a'.codeUnitAt(0) + index - 10);
    if (index < 10 + 2 * 26) return String.fromCharCode('A'.codeUnitAt(0) + index - 10 - 26);
    if (index == 62) return '+';
    if (index == 63) return '#';

    throw ArgumentError('Index must be smaller than ' + CHAR_SET_SIZE.toString() + ': index = ' + index.toString());
  }

  /// Returns how many IDs are used over all valid IDs
  ///
  /// Measured in percent
  static double getUsedIDsPercentage(){
    return _registered.length.toDouble() / pow(CHAR_SET_SIZE, LENGTH) * 100.0;
  }
}