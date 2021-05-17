/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 4/28/21 10:01 AM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/22/21 5:02 PM
 *
 *
 */

import 'package:flutter/material.dart';

enum AchievementState {
  opening,
  open,
  closing,
  closed,
}

enum AnimationTypeAchievement {
  fadeSlideToUp,
  fadeSlideToLeft,
  fade,
}

class CustomToastWidget extends StatefulWidget {
  final Function() finish;
  final GestureTapCallback onTab;
  final Function(AchievementState) listener;
  final Duration duration;
  final bool isCircle;
  final Widget icon;
  final AnimationTypeAchievement typeAnimationContent;
  final double borderRadius;
  final double elevation;
  final Color color;
  final TextStyle textStyleTitle;
  final TextStyle textStyleSubTitle;
  final String title;
  // final String subTitle;

  const CustomToastWidget({
    Key key,
    this.finish,
    this.duration = const Duration(seconds: 2),
    this.listener,
    this.isCircle = false,
    this.elevation = 2,
    this.icon = const Icon(
      Icons.insert_emoticon,
      color: Colors.white,
    ),
    this.onTab,
    this.typeAnimationContent = AnimationTypeAchievement.fadeSlideToUp,
    this.borderRadius = 5.0,
    this.color = Colors.blueGrey,
    this.textStyleTitle,
    this.textStyleSubTitle,
    this.title = "",
    // this.subTitle = "",
  }) : super(key: key);

  @override
  CustomToastWidgetState createState() => CustomToastWidgetState();
}

class CustomToastWidgetState extends State<CustomToastWidget>
    with TickerProviderStateMixin {
  static const HEIGHT_CARD = 60.0;
  static const MARGIN_CARD = 20.0;

  AnimationController _controllerScale;
  CurvedAnimation _curvedAnimationScale;

  AnimationController _controllerSize;
  CurvedAnimation _curvedAnimationSize;

  AnimationController _controllerTitle;
  Animation<Offset> _titleSlideUp;

  AnimationController _controllerSubTitle;
  Animation<Offset> _subTitleSlideUp;

  @override
  void initState() {
    _controllerScale =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _curvedAnimationScale =
    CurvedAnimation(parent: _controllerScale, curve: Curves.easeInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerSize.forward();
        }
        if (status == AnimationStatus.dismissed) {
          _notifyListener(AchievementState.closed);
          widget.finish();
        }
      });

    _controllerSize =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerTitle.forward();
        }
        if (status == AnimationStatus.dismissed) {
          _controllerScale.reverse();
        }
      });
    _curvedAnimationSize =
        CurvedAnimation(parent: _controllerSize, curve: Curves.ease);

    _controllerTitle =
    AnimationController(vsync: this, duration: Duration(milliseconds: 250))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerSubTitle.forward();
        }
        if (status == AnimationStatus.dismissed) {
          _controllerSize.reverse();
        }
      });

    _titleSlideUp = _buildAnimatedContent(_controllerTitle);

    _controllerSubTitle =
    AnimationController(vsync: this, duration: Duration(milliseconds: 250))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _notifyListener(AchievementState.open);
          _startTime();
        }
        if (status == AnimationStatus.dismissed) {
          _controllerTitle.reverse();
        }
      });

    _subTitleSlideUp = _buildAnimatedContent(_controllerSubTitle);
    super.initState();
    show();
  }

  void show() {
    _notifyListener(AchievementState.opening);
    _controllerScale.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(minHeight: HEIGHT_CARD),
        margin: EdgeInsets.all(MARGIN_CARD),
        child: ScaleTransition(
          scale: _curvedAnimationScale,
          child: _buildAchievement(),
        ),
      ),
    );
  }

  Widget _buildAchievement() {
    return Material(
      elevation: widget.elevation,
      borderRadius: _buildBorderCard(),
      color: widget.color,
      child: GestureDetector(
        onTap: () {
          if (widget.onTab != null) {
            widget?.onTab();
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildIcon(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: HEIGHT_CARD,
      child: widget.icon,
    );
  }

  Widget _buildContent() {
    return Flexible(
      child: AnimatedBuilder(
        animation: _curvedAnimationSize,
        builder: (context, child) {
          return Align(
            widthFactor: _curvedAnimationSize.value,
            heightFactor: 1,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: _buildPaddingContent(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildTitle(),
                  SizedBox(height: 2),
                  // _buildSubTitle(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return AnimatedBuilder(
      animation: _controllerTitle,
      builder: (_, child) {
        return SlideTransition(
          position: _titleSlideUp,
          child: FadeTransition(
            opacity: _controllerTitle,
            child: child,
          ),
        );
      },
      child: Text(
        widget.title,
        softWrap: true,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            .merge(widget.textStyleTitle),
      ),
    );
  }

  // Widget _buildSubTitle() {
  //   return AnimatedBuilder(
  //       animation: _controllerSubTitle,
  //       builder: (_, child) {
  //         return SlideTransition(
  //           position: _subTitleSlideUp,
  //           child: FadeTransition(
  //             opacity: _controllerSubTitle,
  //             child: child,
  //           ),
  //         );
  //       },
  //       child: Text(
  //         widget.subTitle,
  //         style: TextStyle(color: Colors.white).merge(widget.textStyleSubTitle),
  //       ));
  // }

  BorderRadiusGeometry _buildBorderCard() {
    if (widget.isCircle) {
      return BorderRadius.all(Radius.circular(100));
    }
    return BorderRadius.all(Radius.circular(widget.borderRadius));
  }

  EdgeInsets _buildPaddingContent() {
    if (widget.isCircle) {
      return EdgeInsets.only(right: 25.0, top: 15.0, bottom: 15.0);
    }
    return EdgeInsets.only(right: 15.0, top: 15.0, bottom: 15.0);
  }

  Animation<Offset> _buildAnimatedContent(AnimationController controller) {
    double dx = 0.0;
    double dy = 0.0;
    switch (widget.typeAnimationContent) {
      case AnimationTypeAchievement.fadeSlideToUp:
        {
          dy = 2.0;
        }
        break;
      case AnimationTypeAchievement.fadeSlideToLeft:
        {
          dx = 2.0;
        }
        break;
      case AnimationTypeAchievement.fade:
        {}
        break;
    }
    return new Tween(begin: Offset(dx, dy), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  }

  void _notifyListener(AchievementState state) {
    if (widget.listener != null) {
      widget.listener(state);
    }
  }

  void _startTime() {
    Future.delayed(widget.duration, () {
      _notifyListener(AchievementState.closing);
      _controllerSubTitle.reverse();
    });
  }

  @override
  void dispose() {
    _controllerScale.dispose();
    _controllerSize.dispose();
    _controllerTitle.dispose();
    _controllerSubTitle.dispose();
    super.dispose();
  }
}
