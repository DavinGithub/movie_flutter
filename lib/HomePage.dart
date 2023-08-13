import 'package:flutter/material.dart';
import 'package:flutter_movie/movide.dart';
import 'package:flutter_movie/movide.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<movie>? movieList = [];

  TextEditingController _searchController = TextEditingController();
  List<movie>? _searchResults = [];

  @override
  void initState() {
    super.initState();
    movie movie1 = new movie(
        "Inception",
        "2010",
        "Deskripsi: Seorang pencuri yang memasuki mimpi orang lain untuk mendapatkan informasi berharga. ",
        "https://th.bing.com/th?id=ODL.278411ebe959b0a31556e6d50a0ca08c&w=135&h=201&c=10&rs=1&qlt=90&o=6&dpr=1.1&pid=13.1");

    movie movie2 = new movie(
        "Interstellar",
        "2014",
        "Deskripsi: Tim penjelajah melakukan perjalanan melalui lubang cacing di ruang angkasa.",
        "https://www.bing.com/th?id=OIP.pvcDdE1dLB5aWhECcsl7LwHaLI&w=120&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.1&pid=3.1&rm=2");

    movie movie3 = new movie(
        "The Shawshank Redemption",
        "1994",
        "Deskripsi: Dua narapidana membentuk ikatan selama bertahun-tahun.",
        "https://th.bing.com/th?id=ODL.1f54a152d68ef2fc4bd57ceb96ebdc2d&w=135&h=201&c=10&rs=1&qlt=90&o=6&dpr=1.1&pid=13.1");

    movie movie4 = new movie(
        "The Dark Knight",
        "2008",
        "Deskripsi: Ketika ancaman yang dikenal sebagai The Joker muncul dari masa lalunya yang misterius.",
        "https://th.bing.com/th?id=ODL.2c64820ba7fac013b646cfc48e5fa505&w=135&h=201&c=10&rs=1&qlt=90&o=6&dpr=1.1&pid=13.1");
    movieList?.add(movie1);
    movieList?.add(movie2);
    movieList?.add(movie3);
    movieList?.add(movie4);
  }

  void _performSearch(String query) {
    setState(() {
      _searchResults = movieList
          ?.where(
              (movie) => movie.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(16),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  child: Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang,",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "ingin menonton apa?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Cari film...",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _performSearch(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _searchController.text.isEmpty
                  ? movieList?.length ?? 0
                  : _searchResults?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final movieData = _searchController.text.isEmpty
                    ? movieList![index]
                    : _searchResults![index];

                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            movieData.imageUrl,
                            width: 100,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieData.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Tanggal Rilis: ${movieData.date}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5),
                            Wrap(
                              children: [
                                Text(
                                  movieData.desc,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
