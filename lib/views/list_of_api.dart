import 'package:demo_api_project/providers/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cat_fact.dart';

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
        title: Text('Cat Facts'),
      ),
      body: FutureBuilder(
        future: Provider.of<CatProvider>(context, listen: false).loadCatApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CatList(); // Vytvořte samostatný widget pro zobrazení seznamu
          }
        },
      ),
    );
  }
}

class CatList extends StatelessWidget {
  const CatList({super.key});

  @override
  Widget build(BuildContext context) {
    final CatProvider catProvider = Provider.of<CatProvider>(context, listen: false);
    final CatFactResponse catLoadedResults = catProvider.loadedResults;

    return ListView.builder(
      itemCount: catLoadedResults.data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(catLoadedResults.data[index].fact),
        );
      },
    );
  }
}

