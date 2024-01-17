import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cat_model.dart';
import '../../providers/cat_provider.dart';
import '../api_views_detail/cat_facts_detail.dart';

class CatFacts extends StatefulWidget {
  const CatFacts({super.key});

  @override
  State<CatFacts> createState() => _CatFactsState();
}

class _CatFactsState extends State<CatFacts> {
  TextEditingController searchController = TextEditingController();
  List<CatFact> filteredFacts = [];
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
  }

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
            final CatProvider catProvider = Provider.of<CatProvider>(context, listen: false);
              List<CatFact> catLoadedResults = catProvider.loadedResults;
            return
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        labelText: 'Hledat..',
                      ),
                      onChanged: (value) {
                        if (_debounceTimer != null) {
                          _debounceTimer!.cancel();
                        }
                        _debounceTimer = Timer(const Duration(milliseconds: 350), () {
                          setState(() {
                            filteredFacts = catLoadedResults
                                .where((fact) => fact.fact.toLowerCase().contains(value.toLowerCase()))
                                .toList();

                            //catLoadedResults = filteredFacts;
                          });
                        });
                    }
                  )),
                  Expanded(
                    child: ListView.builder(
                    itemCount: filteredFacts.isEmpty ? catLoadedResults.length : filteredFacts.length,
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
                          subtitle: Text(filteredFacts.isEmpty ? catLoadedResults[index].fact : filteredFacts[index].fact,
                            style: const TextStyle(fontSize: 18),),
                          trailing: const Icon(Icons.info_outline),
                          dense: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CatDetailPage(catFact: filteredFacts.isEmpty ? catLoadedResults[index] : filteredFacts[index], index: index,),
                              ),
                            );
                          },
                        ),
                      );
                    },
            ),
                  ),
                ],
              );
          }
        }
    );
  }
}
