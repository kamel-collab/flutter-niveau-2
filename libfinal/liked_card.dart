import 'package:flutter/material.dart';
import 'package:projet/name_text.dart';

class LikeCard extends StatefulWidget {
  @override
  _LikeCardState createState() => _LikeCardState();
}

class _LikeCardState extends State<LikeCard> {
  bool isLiked = false;
  String name = 'ok';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=7',
                ),
              ),
              SizedBox(height: 12),
              NameText(),
              Text(
                'Photographe amateur',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => {
                  setState(() {
                    isLiked = !isLiked;
                  }),
                  print(isLiked),
                },
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
                label: Text('Like'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
              ),
              isLiked ? Text("merci") : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
