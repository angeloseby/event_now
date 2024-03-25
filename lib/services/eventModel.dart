class Event {
  final String eventName;
  final String eventDesc;
  final String eventType;
  final String eventMode;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final bool eventPublished;

  Event({
    required this.eventName,
    required this.eventDesc,
    required this.eventType,
    required this.eventMode,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.eventPublished,
  });
}
