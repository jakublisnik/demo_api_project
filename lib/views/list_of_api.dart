import 'package:flutter/material.dart';

class ListOfApi extends StatefulWidget {
  const ListOfApi({super.key});

  @override
  State<ListOfApi> createState() => _ListOfApiState();
}

class _ListOfApiState extends State<ListOfApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
      ),
    );
  }
}
