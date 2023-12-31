import 'package:StreamMaster/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:StreamMaster/models/media.dart';
import '../components/media_card.dart';


class SearchResultsPage extends StatefulWidget {
  static const routeName = '/search_results';

  const SearchResultsPage({Key? key}) : super(key: key);

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late List<Media> _results;

  late Map data;

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments as Map);
    _results = data['results'];
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                childAspectRatio: 0.7,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20
            ),
            children: [
              ...List.generate(
                  _results.length,
                      (index) => MediaCard(
                    movie: _results[index],
                    height: MediaQuery.of(context).size.height,
                    posterPath: data['poster_path'],
                    backdropPath: data['backdrop_path'],
                    hideTitleAndRating: true,
                  ))
            ],
          ),
        );
      }),
      // bottomNavigationBar: NavBar(idx: 3,),
      extendBody: true,
    );
  }
}
