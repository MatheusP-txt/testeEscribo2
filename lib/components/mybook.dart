import 'package:flutter/material.dart';
import 'package:teste_escribo_2/data/bookdata.dart';

Widget myBook(BookData book) {
  return Container(
    width: 122.0,
    margin: EdgeInsets.only(right: 12.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 121.66,
          height: 180.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(book.bookCover),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          book.bookTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18.0),
        ),
        Text(
          book.author,
          style: TextStyle(fontSize: 11),
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}