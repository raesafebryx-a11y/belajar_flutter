import 'package:flutter/material.dart';

class LayoutSatu extends StatelessWidget {
  const LayoutSatu({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(
    child: Container(
      height: 72,
      padding: EdgeInsets.all(12),
      margin:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 246, 249, 251),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)],
      ),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1682685790910-1e7f3c5b6d9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Raesa"),
                  SizedBox(height: 4),
                  Text("XII RPL 2"),
                ],
              ),
            ),
          ],
        ) 
      ),
    );
  }
}