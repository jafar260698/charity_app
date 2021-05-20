import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget{
  const AvatarImage({
    this.fieldKey,
    this.imageUrl,
    this.size,
  });
  final Key fieldKey;
  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        color: const Color(0xff7c94b6),
        image: new DecorationImage(
          image: new NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(size/2)),
        border: new Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
    );
  }
}
