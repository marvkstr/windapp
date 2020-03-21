/// Class that represents a single action of maintenance
@deprecated
class MaintenanceEntry{
  final DateTime date;
  // Technician technician;
  final String comment;

  /// Creates a new MaintenanceEntry
  ///
  /// Specify
  ///  - the date/time the maintenance was registered
  ///  - (TODO the technician assigned the act was assigned to)
  ///  - what has been done
  MaintenanceEntry(this.date, this.comment);
}