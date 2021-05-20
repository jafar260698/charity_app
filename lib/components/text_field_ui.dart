
import 'package:charity_app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme_provider/theme_provider.dart';

class TextFieldUI extends StatefulWidget {
  const TextFieldUI(
      {this.hintText,
      this.errorText,
      this.errorValidate = false,
      this.enabled,
      this.helperText,
      this.onSaved,
      this.style,
      this.validator,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.keyboardType = TextInputType.multiline,
      this.text,
      this.isTextHas = false,
      this.controller,
      this.inputFormatters,
      this.minLine = 1,
      this.maxLine = 1,
      this.inputAction = TextInputAction.next,
      this.textCapitalization = TextCapitalization.sentences,
      this.textMaxLength,
      this.counterText,
      this.onChanged,
      this.hasIcon = false,
      this.isPhoneNumber = false,
      this.isReadOnly = false,
      this.prefixText,
      this.showCursor = false,
      this.prefixIcon});

  final String text;
  final bool isTextHas;
  final String hintText;
  final String errorText;
  final String prefixText;
  final bool errorValidate;
  final bool enabled;
  final String helperText;
  final Widget prefixIcon;
  final TextStyle style;
  final bool showCursor;
  final TextEditingController controller;
  final suffixIcon;
  final keyboardType;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final TextCapitalization textCapitalization;
  final minLine;
  final maxLine;
  final TextInputAction inputAction;
  final textMaxLength;
  final counterText;
  final onChanged;
  final bool hasIcon;
  final bool isPhoneNumber;
  final bool isReadOnly;

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldUI> {
  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.isTextHas,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.text == null ? "" : widget.text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        TextFormField(
          showCursor: widget.showCursor,
          maxLength: widget.textMaxLength,
          readOnly: widget.isReadOnly,
          autofocus: false,
          style: widget.isPhoneNumber ? AppThemeStyle.listStyle : null,
          textInputAction: widget.inputAction,
          controller: widget.controller,
          enabled: widget.enabled,
          inputFormatters: widget.inputFormatters,
          textCapitalization: widget.textCapitalization,
          onSaved: widget.onSaved,
          minLines: widget.minLine,
          maxLines: widget.maxLine,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            prefixText: widget.prefixText ?? "",
            prefixIcon: widget.prefixIcon != null
                ? widget.prefixIcon
                : widget.hasIcon
                    ? Icon(Icons.call)
                    : null,
            errorText: widget.errorValidate ? widget.errorText : null,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            counterText: widget.counterText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(30.0),
            ),
            filled: true,
            fillColor: theme.cardColor,
            hintText: widget.hintText,
            labelStyle: AppThemeStyle.titleStyle,
            helperText: widget.helperText,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
