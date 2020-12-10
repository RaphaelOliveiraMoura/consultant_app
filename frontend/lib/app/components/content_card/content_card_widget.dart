import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentCardWidget extends StatelessWidget {
  final data;
  final YoutubePlayerController _youtubeVideoController;

  ContentCardWidget(this.data)
      : _youtubeVideoController = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(data['youtubeUrl']),
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Card(
        key: Key(data['youtubeUrl']),
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, bottom: 4, right: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['category']),
                    Text(
                      'Conteúdo publicado por: ${data['consultantName']}',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    )
                  ]),
            ),
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
                data['title'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 4, right: 8),
              child: Text(
                data['description'],
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ));
  }
}
