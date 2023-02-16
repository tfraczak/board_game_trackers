import 'package:flutter/material.dart';

class NameInput extends StatefulWidget {
  final void Function(String? value) setName;
  final TextEditingController controller;

  const NameInput({
    super.key,
    required this.setName,
    required this.controller,
  });

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      maxLength: 20,
      style: TextStyle(
        fontSize: 22.0,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Name',
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: InputBorder.none,
      ),
      onSaved: widget.setName,
      onChanged: widget.setName,
      validator: (String? value) {
        if (value is String) {
          return value.length > 16
              ? 'Name cannot be more than 16 characters'
              : null;
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}
