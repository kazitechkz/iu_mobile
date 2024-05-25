import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

ImageProvider<Object> getImageProviderFromServer(String? pathImg) {
  var localImage = 'assets/icons/file.png';
  if (pathImg != null) {
    return CachedNetworkImageProvider(
      "https://iunion.s3.ap-south-1.amazonaws.com/$pathImg",
    );
    // return NetworkImage('https://iunion.s3.ap-south-1.amazonaws.com/$pathImg');
  } else {
    return AssetImage(localImage);
  }
}

Widget getImageFromServer(String? pathImg) {
  var localImage = 'assets/icons/file.png';
  if (pathImg != null) {
    return CachedNetworkImage(
      imageUrl: "https://iunion.s3.ap-south-1.amazonaws.com/$pathImg",
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    // return NetworkImage('https://iunion.s3.ap-south-1.amazonaws.com/$pathImg');
  } else {
    return Image.asset(localImage);
  }
}

String getImageFromString(String? pathImg) {
  if (pathImg != null) {
    return "https://iunion.s3.ap-south-1.amazonaws.com/$pathImg";
  } else {
    return "https://cdn.vectorstock.com/i/500p/82/99/no-image-available-like-missing-picture-vector-43938299.jpg";
  }
}

String getSubjectImagePath(int subjectId) {
  String path = 'assets/images/standard_bear.png';
  switch (subjectId) {
    case 1:
      path = 'assets/images/standard_bear.png';
      break;
    case 2:
      path = 'assets/images/subjects/history.webp';
      break;
    case 3:
      path = 'assets/images/standard_bear.png';
      break;
    case 4:
      path = 'assets/images/subjects/math.webp';
      break;
    case 5:
      path = 'assets/images/subjects/phys.webp';
      break;
    case 6:
      path = 'assets/images/subjects/chem.webp';
      break;
    case 7:
      path = 'assets/images/subjects/biol.webp';
      break;
    case 8:
      path = 'assets/images/subjects/geog.webp';
      break;
    case 9:
      path = 'assets/images/subjects/allHistory.webp';
      break;
    case 10:
      path = 'assets/images/subjects/osnov.webp';
      break;
    case 11:
      path = 'assets/images/subjects/english.webp';
      break;
    case 12:
      path = 'assets/images/subjects/kazakh.webp';
      break;
    case 13:
      path = 'assets/images/standard_bear.png';
      break;
    case 14:
      path = 'assets/images/subjects/russian.webp';
      break;
    case 15:
      path = 'assets/images/subjects/information.webp';
      break;
    default:
      path = 'assets/images/standard_bear.png';
      break;
  }
  return path;
}