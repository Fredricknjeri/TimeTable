class TimeService {
  String timeOfDay(int hourOfDay) {
    if (hourOfDay == null) {
      return '';
    }
    if (hourOfDay < 12) {
      return 'Good Morning';
    }
    if (hourOfDay >= 12) {
      return 'Good Afternoon';
    } else{
      return 'Hi';
    }
      
  }
}
