extension TimeOfDayExtension on DateTime {
  String getTimeOfDay() {
    int hour = this.hour;
    if (hour >= 5 && hour < 12) {
      return 'morning';
    } else if (hour >= 12 && hour < 18) {
      return 'afternoon';
    } else {
      return 'night';
    }
  }
}
