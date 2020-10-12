import 'package:TimeTable/app/locator.dart';
import 'package:TimeTable/app/router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Welcome Home';
  String get title => _title;

  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);
  }

}


