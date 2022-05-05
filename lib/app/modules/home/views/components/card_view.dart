import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  String? newsSource;
  String? image;
  String? title;
  String? dateTime;

  CardView({
    Key? key,
    required this.newsSource,
    required this.image,
    required this.title,
    required this.dateTime,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                        newsSource!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        softWrap: false,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        dateTime.toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 140.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
