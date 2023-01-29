import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class PhotoItem extends StatelessWidget {
  final String imgUrl;
  final bool? imgUrlInternet;

  PhotoItem({super.key, required this.imgUrl, this.imgUrlInternet});

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider =
        (imgUrlInternet != null && imgUrlInternet == true
            ? NetworkImage(imgUrl)
            : AssetImage(imgUrl)) as ImageProvider<Object>?;
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        image: DecorationImage(
          image: imageProvider ?? AssetImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
