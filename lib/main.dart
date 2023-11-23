import 'package:flutter/material.dart';
import 'package:teste_escribo_2/components/mybook.dart';
import 'package:teste_escribo_2/data/bookdata.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<BookData> books = [
    BookData(
      id: "1",
      bookCover:
          "https://www.gutenberg.org/cache/epub/72134/pg72134.cover.medium.jpg",
      bookTitle: "The Bible of Nature",
      author: "Oswald, Felix L.",
      downloadUrl: "https://www.gutenberg.org/ebooks/72134.epub3.images",
    ),
    BookData(
      id: "2",
      bookCover:
          "https://www.gutenberg.org/cache/epub/72127/pg72127.cover.medium.jpg",
      bookTitle: "Kazan",
      author: "Curwood, James Oliver",
      downloadUrl: "https://www.gutenberg.org/ebooks/72127.epub.images",
    ),
    BookData(
      id: "3",
      bookCover:
          "https://www.gutenberg.org/cache/epub/72126/pg72126.cover.medium.jpg",
      bookTitle: "Mythen en sagen uit West-Indië",
      author: "Cappelle, Herman van, Jr.",
      downloadUrl: "https://www.gutenberg.org/ebooks/72126.epub.noimages",
    ),
    BookData(
      id: "4",
      bookCover:
          "https://www.gutenberg.org/cache/epub/63606/pg63606.cover.medium.jpg",
      bookTitle: "Lupe",
      author: "Affonso Celso",
      downloadUrl: "https://www.gutenberg.org/ebooks/63606.epub3.images",
    ),
    BookData(
      id: "5",
      bookCover:
          "https://www.gutenberg.org/cache/epub/72135/pg72135.cover.medium.jpg",
      bookTitle: "Nuorta ja vanhaa väkeä: Kokoelma kertoelmia",
      author: "Fredrik Nycander",
      downloadUrl: "https://www.gutenberg.org/ebooks/72135.epub3.images",
    ),
    BookData(
      id: "6",
      bookCover:
          "https://www.gutenberg.org/cache/epub/18452/pg18452.cover.medium.jpg",
      bookTitle: "Among the Mushrooms: A Guide For Beginners",
      author: "Burgin and Dallas",
      downloadUrl: "https://www.gutenberg.org/ebooks/18452.epub3.images",
    ),
    BookData(
      id: "7",
      bookCover:
          "https://www.gutenberg.org/cache/epub/19218/pg19218.cover.medium.jpg",
      bookTitle: "The History of England in Three Volumes, Vol.III.",
      author: "Edward Farr and E. H. Nolan",
      downloadUrl: "https://www.gutenberg.org/ebooks/19218.epub3.images",
    ),
    BookData(
      id: "8",
      bookCover:
          "https://www.gutenberg.org/cache/epub/76/pg76.cover.medium.jpg",
      bookTitle: "Adventures of Huckleberry Finn",
      author: "Mark Twain",
      downloadUrl: "https://www.gutenberg.org/ebooks/76.epub3.images",
    ),
    BookData(
      id: "9",
      bookCover:
          "https://www.gutenberg.org/cache/epub/72133/pg72133.cover.medium.jpg",
      bookTitle: "The octopus: or, The 'devil-fish' of fiction and of fact",
      author: "Henry Lee",
      downloadUrl: "https://www.gutenberg.org/ebooks/72133.epub3.images",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Leitor de eBooks"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Meus Livros",
                style: TextStyle(
                  fontSize: 20.0,
                  ),
              ),
              SizedBox(
                height: 12.0,
              ),
               Container(
                width: double.infinity,
                height: 280.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      child: myBook(books[index]),
                      onTap: () async {
                        final file = await books[index].downloadBook();
                        VocsyEpub.open(file.path);
                      },

                    );
                  },
                ),
              ),
            ]),
      )),
    );
  }
}
