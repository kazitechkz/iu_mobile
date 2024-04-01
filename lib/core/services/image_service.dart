import 'package:flutter/cupertino.dart';

class ImageService {
  static String getAvaFromServer(String? pathImg) {
    var localImage = 'assets/icons/person.png';
    if (pathImg != null) {
      return 'https://iunion.s3.ap-south-1.amazonaws.com/$pathImg';
    } else {
      return localImage;
    }
  }
}