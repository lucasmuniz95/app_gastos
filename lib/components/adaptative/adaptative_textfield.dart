import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdaptativeTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final String? labelText;
  TextInputType? keybordType = TextInputType.text;

  AdaptativeTextfield({
    Key? key,
    this.controller,
    this.onSubmitted,
    this.labelText,
    this.keybordType,
  }) : super(key: key);

  @override
  State<AdaptativeTextfield> createState() => _AdaptativeTextfieldState();
}

class _AdaptativeTextfieldState extends State<AdaptativeTextfield> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              keyboardType: widget.keybordType,
              controller: widget.controller,
              onSubmitted: widget.onSubmitted,
              placeholder: widget.labelText,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            keyboardType: widget.keybordType,
            controller: widget.controller,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              labelText: widget.labelText,
            ),
          );
  }
}
