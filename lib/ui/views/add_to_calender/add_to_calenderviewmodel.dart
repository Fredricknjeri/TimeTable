import 'package:TimeTable/app/locator.dart';
import 'package:TimeTable/app/router.dart';
import 'package:TimeTable/core/model/event.dart';
import 'package:googleapis/datastore/v1.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class AddToCalenderViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();




  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.myhomepageRoute);
  }
}