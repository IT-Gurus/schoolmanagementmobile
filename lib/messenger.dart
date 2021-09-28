import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class name extends StatelessWidget {
  const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, int numberOfProfile) {
              return CircleAvatar(
                radius: 10,
                backgroundImage : AssetImage('assets/images/laptop.jpg')
              );
            },
            scrollDirection: Axis.horizontal,
          ),
          ListView.builder(
              itemBuilder: (context, int numberOfProfile) {
                return Center( 
                  child :CircleAvatar(
                    radius: 10,
                    backgroundImage : AssetImage('assets/images/laptop.jpg'),
                    //backgroundImage : AssetImage('assets/image/laptop.jpg')
                    )
                );
              },
              scrollDirection: Axis.vertical)
        ],
      ),
    );
  }
}
