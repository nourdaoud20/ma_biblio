import 'package:flutter/material.dart';

import '../data/livres_data.dart';
import '../models/livre.dart';
import 'detail_screen.dart';

class GalerieScreen extends StatelessWidget {
  const GalerieScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Galerie des livres')),
      body: GridView.extent(

        maxCrossAxisExtent: 150,

        mainAxisSpacing: 10,
        crossAxisSpacing: 10,

        padding: const EdgeInsets.all(10),

        childAspectRatio: 0.7,

        children: livres.map((livre) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(livre: livre),
                ),
              );
            },
            child: Card(
              color: livre.couleur,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icône livre blanche
                    const Icon(Icons.menu_book, color: Colors.white, size: 36),
                    const SizedBox(height: 8),
                    // Titre du livre (2 lignes max avec ellipsis)
                    Text(
                      livre.titre,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Auteur du livre
                    Text(
                      livre.auteur,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
