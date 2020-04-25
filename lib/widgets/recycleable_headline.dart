import 'package:flutter/material.dart';
import 'package:zero/data/recycleable.dart';
import 'package:zero/screens/instructions.dart';

class RecycleableHeadline extends StatelessWidget {
  final Recycleable recycleable; 

  const RecycleableHeadline(this.recycleable);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push<void>(MaterialPageRoute(
          builder: (context) => InstructionsScreen(recycleable.id),
          fullscreenDialog: false,
        ))
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 8,),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      recycleable.name, 
                      ),
                  ],
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}