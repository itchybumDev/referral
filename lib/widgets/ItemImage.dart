import 'package:cached_network_image/cached_network_image.dart';
import 'package:contact_tracer/model/Colors.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget{

  final String url;

  const ItemImage({this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: 300.0,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      imageUrl: url,
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: detailPageBackground,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: detailPageBackground,
        ),
      ),
    );
  }
}