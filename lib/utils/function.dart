
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  static showSnackBar(String message, String subMessage, IconData icon) {
    Get.snackbar(
      message,
      subMessage,
      padding: const EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(25),
      icon: Icon(icon, size: 21),
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

}
