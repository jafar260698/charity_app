
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'network_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  ApiProvider get apiProvider;

  @lazySingleton
  NavigationService get navigationServices;

  @lazySingleton
  BottomSheetService get bottomSheetService;

  @lazySingleton
  UserData get userData;

  @lazySingleton
  NetworkService get networkService;
}
