import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cat_model.dart';
import '../../providers/cat_provider.dart';
import '../api_views_detail/cat_facts_detail.dart';

class CatFacts extends StatelessWidget {
  const CatFacts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CatProvider>(context, listen: false).loadCatApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final CatProvider catProvider = Provider.of<CatProvider>(
                context, listen: false);
            final CatModelResponse catLoadedResults = catProvider.loadedResults;

            return ListView.builder(
              itemCount: catLoadedResults.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 30, right: 30),
                    leading: const Icon(Icons.pets, size: 40,),
                    title: Text("Fact about the cat #$index",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(catLoadedResults.data[index].fact,
                      style: const TextStyle(fontSize: 18),),
                    trailing: const Icon(Icons.info_outline),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CatDetailPage(catFact: catLoadedResults.data[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        }
    );
  }
}