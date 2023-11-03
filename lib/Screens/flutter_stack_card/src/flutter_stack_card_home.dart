import 'indicator_model.dart';
import '../flutter_stack_card.dart';
import '../../../Models/movie.dart';
import 'package:flutter/material.dart';

// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

class StackCardHomePage extends StatefulWidget {
  const StackCardHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _StackCardHomePageState createState() => _StackCardHomePageState();
}

class _StackCardHomePageState extends State<StackCardHomePage> {
  final List<Movie> _movieData = Movie().movieData;
  var width, height;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Stack CArd"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: StackCard.builder(
          displayIndicator: true,
          displayIndicatorBuilder:
              IdicatorBuilder(displayIndicatorActiveColor: Colors.blue),
          itemCount: _movieData.length,
          onSwap: (index) {},
          itemBuilder: (context, index) {
            Movie movie = _movieData[index];
            return _itemBuilder(movie);
          },
        ),
      ),
    );
  }

  Widget _itemBuilder(Movie movie) {
    return Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white),
      ),
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height * .3,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                      image: ExactAssetImage(movie.image!), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: height * .45,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          child: Text(
                            movie.title!,
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 24),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(height: 4),
                            Text(
                              movie.display!,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                              textAlign: TextAlign.right,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "IMDB: ${movie.imdb.toString()}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(movie.gendres!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 8),
                        child: Text(movie.desc!,
                            style: const TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Center(
                      child: IconButton(
                          icon:
                              const Icon(Icons.drag_handle, color: Colors.grey),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
