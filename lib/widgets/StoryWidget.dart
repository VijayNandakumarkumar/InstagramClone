import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Colors.dart';

class StoryWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  const StoryWidget({
    Key? key, required this.name, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0, top: 5),
          child: Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: storyBorderColor)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: black, width: 2),
                ),
                child: Image.network(imageUrl),
              ),
            ),
          ),
        ),
        SizedBox(height: 2,),
        SizedBox(width: 70, child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),)
      ],
    );
  }
}