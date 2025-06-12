import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    Key? key,
    required this.url,
    this.fitModel = BoxFit.cover
  }) : super(key: key);
  final String url;
  final BoxFit fitModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      // placeholder: (_, __) => Icon(Icons.wallpaper,color: Colors.grey.shade50),
      errorWidget: (_, __, exception) {
        return Icon(Icons.error,color: Colors.grey.shade50,);
      },
      fit: fitModel,
      cacheKey: url,
      httpHeaders: const {'sec-fetch-mode':'no-cors'},
    );
  }
}

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.asset(
          //     'assets/error.json',
          //     repeat: false,
          //     alignment: Alignment.center,
          //     height: 150
          // ),
          Text(
            message.isEmpty == true ? 'اطلاعاتی یافت نشد' : message)
        ],
      ),
    );
  }
}
