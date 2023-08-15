import 'package:StreamMaster/components/drawer.dart';
import 'package:StreamMaster/components/xtheme.dart';
import 'package:StreamMaster/components/media_card.dart';
import 'package:StreamMaster/components/bottom_nav.dart';
import 'package:StreamMaster/models/login_model.dart';
import 'package:StreamMaster/services/media_api.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:StreamMaster/components/config.dart';
import '../models/media.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  Map<String, String> imageUrl = {};

  bool isLoading = true;
  int? upcomingLength = 0;
  late List<Media> _movies;
  late List<Media> _tv;
  late List<Media> _upcoming;
  late List<Media> _action;
  late List<Media> _comedy;
  late List<Media> _horror;
  late List<Media> _naija;

  final GlobalKey<RefreshIndicatorState> _freeRefreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  late String posterPath = '';
  late String backdropPath = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  // request data from api
  Future<void> getData() async {
    Future.wait([
      Config.getImagePath(),
      MediaApi.getMedia(path: '3/movie/upcoming', mediaType: 'movie'),
      MediaApi.getMedia(path: '/3/discover/movie', mediaType: 'movie'),
      MediaApi.getMedia(path: '3/tv/top_rated', mediaType: 'tv'),
      MediaApi.getMedia(
          path: '/3/discover/movie', mediaType: 'movie', genre: '28'),
      MediaApi.getMedia(
          path: '/3/discover/movie', mediaType: 'movie', genre: '35'),
      MediaApi.getMedia(
          path: '/3/discover/movie', mediaType: 'movie', genre: '27'),
      MediaApi.getMedia(
          path: '/3/discover/movie', mediaType: 'movie', country: 'NG'),
    ]).then((List response) {
      imageUrl = response[0];
      _upcoming = response[1];
      _movies = response[2];
      _tv = response[3];
      _action = response[4];
      _comedy = response[5];
      _horror = response[6];
      _naija = response[7];
      posterPath = imageUrl['posterPath']!;
      backdropPath = imageUrl['backdropPath']!;
      setState(() {
        isLoading = false;
        upcomingLength = _upcoming.length;
      });
    }).catchError((e) => print(e));
  }

  // Get firebase auth user
  var user = FirebaseAuth.instance.currentUser;

  // Get time back button is pressed
  DateTime timeBackPressed = DateTime.now();

  // scafold key for drawer implementation
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          const message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 18);

          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.black,
        drawer: MyDrawer(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => _key.currentState?.openDrawer(),
            icon: Icon(
              Icons.menu,
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          backgroundColor: Colors.black,
          title: Image.asset(
            'assets/images/logo.png',
            height: 50,
          ),
          centerTitle: true,
          actions: [
            AnimSearchBar(
              color: Colors.transparent,
              searchIconColor: Theme.of(context).primaryColorLight,
              rtl: true,
              width: 300,
              textController: searchController,
              onSuffixTap: () {
                setState(() {
                  searchController.clear();
                });
              },
              onSubmitted: (String word) async {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: SpinKitFadingCircle(color: XTheme.of(context).primary,),
                        ));
                List<Media> searchResponse;
                searchResponse = await MediaApi.getMedia(
                    path: '3/search/multi', query: word, mediaType: '');
                Navigator.of(context)
                    .popAndPushNamed('/search_results', arguments: {
                  'results': searchResponse,
                  'poster_path': posterPath,
                  'backdrop_path': backdropPath
                });
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: RefreshIndicator(
            key: _freeRefreshIndicatorKey,
            onRefresh: () async {
              return getData();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLoading
                      ? Container(
                    height: MediaQuery.of(context).size.height,
                        child: SpinKitFadingCircle(
                            color: XTheme.of(context).primary,
                          ),
                      )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'Now Trending',
                            style: XTheme.of(context).subtitle1,
                          ),
                        ),
                  CarouselSlider(
                      items: [
                        ...List.generate(
                            upcomingLength!,
                            (index) => MediaCard(
                                  movie: _upcoming[index],
                                  posterPath: posterPath,
                                  backdropPath: backdropPath,
                                  hideTitleAndRating: true,
                                ))
                      ],
                      options: CarouselOptions(
                        initialPage: 0,
                        viewportFraction: 0.7,
                        height: 500,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        enlargeFactor: 0.5,
                        padEnds: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      )),
                  //Todo: Implement Watchlist then list here if available
                  isLoading
                      ? Text('')
                      : Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text(
                            'TV Shows',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                  isLoading
                      ? Text('')
                      : Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CarouselSlider(
                              items: [
                                ...List.generate(
                                    _tv.length,
                                    (index) => MediaCard(
                                        movie: _tv[index],
                                        posterPath: posterPath,
                                        backdropPath: backdropPath))
                              ],
                              options: CarouselOptions(
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 0.3,
                                  aspectRatio: 2.5,
                                  pageSnapping: false,
                                  padEnds: false)),
                        ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          idx: 0,
        ),
      ),
    );
  }
}
