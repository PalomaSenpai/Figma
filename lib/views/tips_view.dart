import 'package:flutter/material.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 8), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Texto y contenido
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Strength Training Tips",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          // Imagen
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.asset(
                "assets/Rock.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
