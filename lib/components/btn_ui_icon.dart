import 'package:charity_app/theme/my_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BtnUIIcon extends StatefulWidget {
  const BtnUIIcon(
      {this.fieldKey,
      this.color,
      this.textColor,
      this.text,
      this.ontap,
      this.height = 60,
      this.isLoading = false,
      this.icon,
      this.child});

  final Key fieldKey;
  final String text;
  final Color color;
  final Color textColor;
  final double height;
  final child;
  final SvgPicture icon;
  final bool isLoading;
  final GestureTapCallback ontap;

  @override
  _BtnUIIconState createState() => _BtnUIIconState();
}

class _BtnUIIconState extends State<BtnUIIcon>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTap: widget.ontap,
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.color,
              width: 0.75,
            ),
            color: widget.color,
            borderRadius: BorderRadius.circular(27.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              widget.icon,
              Text(
                widget.text,
                style: TextStyle(color: widget.textColor,fontSize: 16,fontFamily: 'Montserrat'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
