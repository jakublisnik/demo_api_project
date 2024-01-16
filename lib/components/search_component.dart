import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onTextChanged;

  const SearchComponent({
    Key? key,
    required this.controller,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: onTextChanged,
      ),
    );
  }
}
