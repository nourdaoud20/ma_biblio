import 'package:flutter/material.dart';

import '../models/livre.dart';

class LivreCard extends StatelessWidget {
  final Livre livre;
  final VoidCallback? onTap;

  const LivreCard({super.key, required this.livre, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Q4.2 : elevation à 4 (0 = carte plate sans ombre, 12 = ombre très prononcée)
      elevation: 4,
      // Q4.2 : Marges externes
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      // Q4.2 : Coins arrondis de rayon 16
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // Q4.3 : Couleur de fond et couleur de l'ombre
      color: Colors.white,
      shadowColor: livre.couleur.withOpacity(0.4),
      surfaceTintColor: Colors.transparent,
      // Q4.5 : clipBehavior coupe l'effet d'encre (InkWell/onTap) pour qu'il ne déborde pas des coins arrondis
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: livre.couleur,
          child: Text(
            livre.titre.isNotEmpty ? livre.titre[0] : '?',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          livre.titre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${livre.auteur} – ${livre.annee}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              livre.note.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.star, color: Colors.amber, size: 20),
          ],
        ),
        // Q4.5 : Action au clic via le onTap du ListTile
        onTap: onTap,
      ),
    );
  }
}
