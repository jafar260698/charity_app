
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

}
