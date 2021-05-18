/*
 * Created by Alimov Shohrukh on 5/6/21, 12:09 PM
 * Copyright (c) 2021 . All rights reserved.
 */

import 'dart:async';
import 'package:charity_app/service/network_status.dart';
import 'package:connectivity/connectivity.dart';

class NetworkService {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();

  NetworkService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var networkStatus = _getStatusFromResult(result);
      networkStatusController.add(networkStatus);
    });
  }

  NetworkStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return NetworkStatus.WiFi;
        break;
      case ConnectivityResult.mobile:
        return NetworkStatus.Cellular;
        break;
      case ConnectivityResult.none:
        return NetworkStatus.Offline;
        break;
      default:
        return NetworkStatus.Offline;
        break;
    }
  }
}
