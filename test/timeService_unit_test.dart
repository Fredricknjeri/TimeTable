import 'package:TimeTable/core/services/time_of_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TimeService timeService;
  setUp(() {
    timeService = TimeService();
  });

  group(('test the time of day service'), () {
    test(('numbers lower than 12 are Morning'), () {}
    );
    test(('numbers greater than 12 are Afternoon'), () {});
  });
}
