



import 'package:charity_app/view/theme/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExitModalView extends StatelessWidget {
  const ExitModalView({this.onTapExit});

  final GestureTapCallback onTapExit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: getTextInfo(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FlatButton(
                  height: 50,
                  textColor: Colors.grey,
                  child: Text("Cancel"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: FlatButton(
                    height: 50,
                    textColor: MyThemes.lightTheme.primaryColor,
                    color: MyThemes.lightTheme.primaryColor.withOpacity(0.1),
                    child: Text("EXIT"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: onTapExit
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column getTextInfo(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 80.0,
            child: Lottie.asset('assets/lottie/info.json'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Are you sure ? , will you leave the app",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ),
        // Opacity(
        //   opacity: 0.4,
        //   child: Text(
        //     "©2001 - 2020. Barcha huquqlar himoyalangan.",
        //     textAlign: TextAlign.center,
        //     style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
        //   ),
        // ),
        SizedBox(height: 30.0),
      ],
    );
  }
}