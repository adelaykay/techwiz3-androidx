import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:StreamMaster/models/screen_arguments.dart';

import '../models/media.dart';
import '../screens/media_details.dart';

class MediaCard extends StatefulWidget {
  final double height;
  final Media movie;
  final String? posterPath;
  final String? backdropPath;
  final bool hideTitleAndRating;

  const MediaCard({Key? key,
    this.height = 300,
    required this.movie,
    required this.posterPath,
    required this.backdropPath,
    this.hideTitleAndRating = false,
  })
      : super(key: key);

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
  Color? glowcolor;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _extractColors();

  }
  // extract colors from images
  Future<void> _extractColors() async {
    String url = '${widget.posterPath}${widget.movie.poster}';
    final PaletteGenerator paletteGenerator =
    await PaletteGenerator.fromImageProvider(
      NetworkImage(url), // Replace with your image path
    );

    // Access the prominent colors from paletteGenerator here
    setState(() {
      glowcolor = paletteGenerator.dominantColor!.color;
      setState(() {
        isLoading = false;
      });
    });
    // Now you can use glowColor to apply the glow effect
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, MediaDetailsPage.routeName,
              arguments: ScreenArguments(
                  id: widget.movie.id,
                  backdrop: (MediaQuery
                      .of(context)
                      .size
                      .width < 500)
                      ? '${widget.backdropPath}${widget.movie.poster}'
                      : '${widget.backdropPath}${widget.movie.backdrop}',
                  mediaType: widget.movie.mediaType)),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: XTheme.of(context).primaryColor,
                blurRadius: 90,
                spreadRadius: -45)
          ],
        ),
        child: Hero(
          tag: '${widget.movie.id}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.fitHeight,
              image: '${widget.posterPath}${widget.movie.poster}',
              placeholder: kTransparentImage,
              imageErrorBuilder: (context, error, stackTrace) =>
                  Image.network(
                    "https://loremflickr.com/g/240/360/movie",
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
