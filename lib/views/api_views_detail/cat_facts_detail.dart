import 'package:flutter/material.dart';
import '../../models/cat_model.dart';

class CatDetailPage extends StatelessWidget {
  final CatFact catFact;
  final int index;

  const CatDetailPage({Key? key, required this.catFact, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat #$index detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fact about the cat #$index',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              catFact.fact,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Length: ${catFact.length}',
              style:const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Zde můžete přidat další informace nebo obrázky podle potřeby
          ],
        ),
      ),
    );
  }
}
