import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingRow extends StatelessWidget {

  final double ratings;
  final String title;

  const RatingRow({Key? key, required this.ratings, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title",style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14)),
        Row(
          children: [
            RatingBarIndicator(
              rating:ratings,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.indigo,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
            Expanded(child: SizedBox(width: 10,)),
            Text("$ratings")
          ],
        ),
        SizedBox(height: 5,)
      ],
    );
  }
}
