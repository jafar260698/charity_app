
import 'package:flutter/material.dart';

class ListUI extends StatefulWidget {
  const ListUI({this.fieldKey, this.text, this.icon, this.onTap});

  final Key fieldKey;
  final String text;
  final Icon icon;
  final GestureTapCallback onTap;

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<ListUI> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 13.0, bottom: 13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: widget.icon),
            SizedBox(width: 16.0),
            Text(
              widget.text,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
