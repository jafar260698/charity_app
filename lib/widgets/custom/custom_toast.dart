/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 4/28/21 10:01 AM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/28/21 9:29 AM
 *
 *
 */

import 'package:flutter/material.dart';

import 'custom_toast_widget.dart';

class CustomToast {
  final BuildContext _context;
  final AlignmentGeometry alignment;
  final Duration duration;
  final GestureTapCallback onTap;
  final Function(AchievementState) listener;
  final bool isCircle;
  final Widget icon;
  final AnimationTypeAchievement typeAnimationContent;
  final double borderRadius;
  final Color color;
  final TextStyle textStyleTitle;
  final TextStyle textStyleSubTitle;
  final String title;
  final double elevation;

  OverlayEntry _overlayEntry;

  CustomToast(
    this._context, {
    this.elevation = 2,
    this.onTap,
    this.listener,
    this.isCircle = false,
    this.icon = const Icon(
      Icons.insert_emoticon,
      color: Colors.white,
    ),
    this.typeAnimationContent = AnimationTypeAchievement.fadeSlideToUp,
    this.borderRadius = 5.0,
    this.color = Colors.blueGrey,
    this.textStyleTitle,
    this.textStyleSubTitle,
    this.alignment = Alignment.topCenter,
    this.duration = const Duration(seconds: 2),
    this.title = "My Title",
  });

  OverlayEntry _buildOverlay() {
    return OverlayEntry(builder: (context) {
      return Align(
        alignment: alignment,
        child: CustomToastWidget(
          title: title,
          duration: duration,
          listener: listener,
          onTab: onTap,
          isCircle: isCircle,
          elevation: elevation,
          textStyleSubTitle: textStyleSubTitle,
          textStyleTitle: textStyleTitle,
          icon: icon,
          typeAnimationContent: typeAnimationContent,
          borderRadius: borderRadius,
          color: color,
          finish: () {
            _hide();
          },
        ),
      );
    });
  }

  void show() {
    if (_overlayEntry == null) {
      _overlayEntry = _buildOverlay();
      Overlay.of(_context).insert(_overlayEntry);
    }
  }

  void _hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
