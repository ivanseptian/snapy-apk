
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/strings.dart';
import 'api_request_status.dart';

class Functions {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';

  static showSnackBar(String message, String subMessage) {
    Get.snackbar(
      message,
      subMessage,
      padding: const EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(25),
    );
  }

  static bool checkConnectionError(e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return true;
    } else {
      return false;
    }
  }


  static checkErrorPopup(e) {
    if (Functions.checkConnectionError(e)) {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.error,
          text: StringValue.internetProblem
      );
    } else if(e != null || e != "") {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.error,
          text: e
      );
    } else {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.error,
          text: StringValue.connectionError
      );
    }
  }

  static bool checkFormValid(GlobalKey<FormState> globalKey){
    if(globalKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  static String ConvertDateTime(String date){
    var inputFormat = DateFormat("yyyy-MM-dd");
    var outputFormat = DateFormat("dd-MM-yyyy");

    var dateInput = inputFormat.parse(date);
    var dateInputParse = outputFormat.format(dateInput);
    String dateParse = dateInputParse.toString();
    return dateParse;
  }

  static String ConvertDateToDays(String date){
    var inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    var dateInput = inputFormat.parse(date);
    var dateInputParse = DateFormat('EEEE').format(dateInput);
    String dateParse = dateInputParse.toString();
    return dateParse;
  }

  static String convertDateWithTime(String date){
    var inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    var outputFormat = DateFormat("dd MMM yyyy HH:mm:ss");

    var dateInput = inputFormat.parse(date);
    var dateInputParse = outputFormat.format(dateInput);
    String dateParse = dateInputParse.toString();
    return dateParse;
  }

  static String convertDateOnly(String date){
    var inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    var outputFormat = DateFormat("dd MMM yyyy");

    var dateInput = inputFormat.parse(date);
    var dateInputParse = outputFormat.format(dateInput);
    String dateParse = dateInputParse.toString();
    return dateParse;
  }

  static String formatDateDifference(String date) {

    DateTime dateParse = DateTime.parse(date);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateParse);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return '1 day ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } else {
      String formattedDate = DateFormat('d MMMM yyyy HH:mm').format(dateParse);
      return formattedDate;
    }
  }

  static String formatCurrency(int amount) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  static double calculatePercentage(int totalTransaction, int totalTargetTransaction) {
    if (totalTargetTransaction <= 0 || totalTargetTransaction < totalTransaction) {
      return 0;
    }

    double percentage = (totalTransaction / totalTargetTransaction);

    debugPrint(percentage.toString());
    return percentage;
  }

  static Future<bool> checkAndRequestPermission(
      Permission permissionType, String name) async {
    PermissionStatus status = await permissionType.status;
    bool statPermission = false;
    if (status.isDenied) {
      // Izin lokasi ditolak, minta izin
      status = await permissionType.request();
    }

    if (status.isDenied) {
      Functions.showSnackBar("$name permission denied.", "");
    } else if (status.isPermanentlyDenied) {
      Functions.showSnackBar("$name permissions are permanently denied.", "");
    } else if (status.isGranted) {
      statPermission = true;
    }
    return statPermission;
  }

}
