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
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    // return NetworkImage('https://iunion.s3.ap-south-1.amazonaws.com/$pathImg');
  } else {
    return Image.asset(localImage);
  }
}