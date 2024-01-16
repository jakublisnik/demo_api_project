import 'package:flutter/material.dart';

import '../../models/cat_model.dart';

class CatDetailPage extends StatelessWidget {
  final CatFact catFact;

  const CatDetailPage({Key? key, required this.catFact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Fact about the cat', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text(catFact.fact, style: TextStyle(fontSize: 18)),
            // Další informace o catFact, které chcete zobrazit
          ],
        ),
      ),
    );
  }
}
