import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentCardWidget extends StatelessWidget {
  final String category = 'Tecnologia';
  final String youtubeUrl = 'https://youtube.com';
  final String title =
      'Musicas para ouvir no Trabalho - Músicas para animar o trabalho - Música para trabalhar 2020';
  final String description =
      'Musicas para ouvir no Trabalho - Músicas para animar o trabalho - Música para trabalhar 2020';

  final YoutubePlayerController _youtubeVideoController =
      YoutubePlayerController(
    initialVideoId: 'HgfL3MMrvzM',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(category),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8)),
            YoutubePlayer(
              controller: _youtubeVideoController,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 4, bottom: 2, right: 8),
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 4, right: 8),
              child: Text(
                description,
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ));
  }
}
