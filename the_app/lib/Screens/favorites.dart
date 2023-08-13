import 'package:StreamMaster/components/drawer.dart';
import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:StreamMaster/components/config.dart';
import 'package:StreamMaster/services/favorites_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/media_card.dart';
import '../components/bottom_nav.dart';


class FavoritesPage extends StatefulWidget {
  static const routeName = '/favorites';
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool _isLoading = true;
  late List<dynamic> _favorites = [];
  var imageUrl;
  var posterPath;
  var backdropPath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavorites();
  }

  Future<void> getFavorites () async {
    Future.wait([FavoritesService.getData(), Config.getImagePath()]).then((List response) {
      _favorites = response[0];
      imageUrl = response[1];
      posterPath = imageUrl['posterPath'];
      setState(() {
        _isLoading = false;
      });
      print(_favorites[0]);
    }).catchError((e)=> print(e));
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: user == null
          ? Center(
        child: Text('User not signed in'),
      )
          : _isLoading
          ? Center(
          child: SpinKitFadingCircle(color: XTheme.of(context).primary,)
      )
          : _favorites.isNotEmpty ? OrientationBuilder(builder: (context, orientation) {
        return GridView(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.5,
                crossAxisCount: orientation == Orientation.portrait ? 3 : 4),
            children: _favorites.map((e) => MediaCard(hideTitleAndRating: false, movie: e, posterPath: e.poster, backdropPath: '')).toList()
        );
      }) : Center(child: Text('You currently have no favorites, add content to favorites to view them here'),),
      bottomNavigationBar: NavBar(
        idx: 2,
      ),
    );
  }
}
