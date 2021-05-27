
import 'package:charity_app/view/screens/home/drawer/cabinet_drawer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CabinetDrawerViewModel extends BaseViewModel {
  bool _isLoading = false;
  Color physicColor = Colors.greenAccent,
      yattColor = Colors.purpleAccent,
      selfColor = Colors.yellowAccent;
  Color _backHeaderColor;
  int authType = 0;
  String _name = '', _tin = '', _taxDepartment = '', _taxDepartmentPhone = '';
  BuildContext context;

  bool get isLoading => _isLoading;
  Color get backHeaderColor => _backHeaderColor;
  String get name => _name;
  String get tin => _tin;
  String get taxDepartment => _taxDepartment;
  String get taxDepartmentPhone => _taxDepartmentPhone;

  void initContext(BuildContext context) async {
    this.context = context;
  }

  List<DrawerList> drawerList() {
    var drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.HOME,
        labelName: 'Главная',
        isAssetsImage: true,
        svgName: 'assets/icons/drawer/home.svg',
      ),
      if (authType == 2)
        DrawerList(
          index: DrawerIndex.Calendar,
          labelName: 'Календарь',
          isAssetsImage: true,
          svgName: 'assets/icons/services/calendar.svg',
        ),
      DrawerList(
        index: DrawerIndex.Services,
        labelName: 'Все услуги',
        isAssetsImage: true,
        svgName: 'assets/icons/drawer/services.svg',
      ),
      (authType == 2)
          ? DrawerList(
              index: DrawerIndex.Report,
              labelName: 'Состояние отчетов',
              isAssetsImage: true,
              svgName: 'assets/icons/drawer/services.svg',
            )
          : DrawerList(
              index: DrawerIndex.Help,
              labelName: 'Состояние деклараций',
              isAssetsImage: true,
              svgName: 'assets/icons/drawer/services.svg',
            ),
      DrawerList(
        index: DrawerIndex.Share,
        labelName: 'Активирование пк',
        isAssetsImage: true,
        svgName: 'assets/icons/drawer/services.svg',
      ),
      DrawerList(
        index: DrawerIndex.Message,
        labelName: 'Сообщения',
        isAssetsImage: true,
        svgName: 'assets/icons/drawer/massage.svg',
      ),
      DrawerList(
        index: DrawerIndex.Settings,
        labelName: 'Hастройки',
        isAssetsImage: true,
        svgName: 'assets/icons/drawer/settings.svg',
      ),
    ];
    return drawerList;
  }

  void exitAndClear() async {

  }

  void openYattCabinet() async {

  }

  void openSelfEmployment() async {

  }

}
