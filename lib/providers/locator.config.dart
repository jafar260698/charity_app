// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/service/network_service.dart';
import 'package:charity_app/service/services_module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<ApiProvider>(() => thirdPartyServicesModule.apiProvider);
  gh.lazySingleton<BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationServices);
  gh.lazySingleton<NetworkService>(
      () => thirdPartyServicesModule.networkService);
  gh.lazySingleton<UserData>(() => thirdPartyServicesModule.userData);
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  ApiProvider get apiProvider => ApiProvider();

  @override
  BottomSheetService get bottomSheetService => BottomSheetService();

  @override
  NavigationService get navigationServices => NavigationService();

  @override
  NetworkService get networkService => NetworkService();

  @override
  UserData get userData => UserData();
}
