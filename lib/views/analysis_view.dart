import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:flutter_app/api/app_data.dart';
import 'package:flutter_app/resources/blue_button.dart';
import 'package:flutter_app/views/analysis_tags_view.dart';

import '../display_image/image_viewer.dart';
import '../exceptions/custom_get_music_exception.dart';
import '../resources/app_colors.dart';
import '../resources/ios_alert.dart';

class AnalysisView extends StatefulWidget {
  final VoidCallback goToCompare;
  final VoidCallback regenerate;

  const AnalysisView(
      {super.key, required this.goToCompare, required this.regenerate});

  @override
  State<AnalysisView> createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void compare() {}

  void goToFinalView() {}

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.325,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 0, top: 32, right: 70, bottom: 32),
                  child: Text(
                    'DEINE PARTITUR',
                    style: TextStyle(
                      fontFamily: 'MozartNbp',
                      fontSize: 41,
                    ),
                  ),
                ),
                Expanded(
                  child: AnalysisTagsView(
                    tags: AppData.current.analysis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: BlueButton(
                    width: 320,
                    onPressed: widget.goToCompare,
                    text: 'vergleichen',
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 3),
              SizedBox.square(
                  dimension: screenSize.width * 0.35,
                  child: Stack(children: [
                    const ImageView(imageType: "score"),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: IconButton(
                        icon: const Icon(Icons.open_in_full_outlined,
                            color: AppColors.white, size: 45),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fullscreen');
                        },
                      ),
                    ),
                  ])),
              const Spacer(flex: 1),
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.325,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text('Generierter Sound', style: TextStyle(
                    fontFamily: 'MozartNbp',
                    fontSize: 41,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: IconButton(
                    icon: Icon(
                        isPlaying
                            ? Icons.pause_sharp
                            : Icons.play_arrow,
                        color: AppColors.white,
                        size: 85),
                    onPressed: () async {
                      if (isPlaying) {
                        setState(
                              () {
                            isPlaying = !isPlaying;
                          },
                        );
                        await audioPlayer.pause();
                      } else {
                        try {
                          String? path = await APIService.instance
                              .getMusic(AppData.current.transactionId);
                          if (path != null) {
                            setState(
                                  () {
                                isPlaying = !isPlaying;
                              },
                            );
                            await audioPlayer.play(path, isLocal: true);
                          } else {
                            IOSAlert.instance.showCustomAlert(
                              context: context,
                              title: 'Fast fertig',
                              message:
                                  "Die Partitur wird aktuell noch interpretiert. Bitte warte einen Moment.\nDies kann i.d.R. bis zu 3 Minuten dauern.",
                            );
                          }
                        } on CustomGetMusicException catch (e) {
                          IOSAlert.instance.showCustomAlert(
                            context: context,
                            title: 'FEHLER',
                            message: e.errorMessage,
                          );
                        }
                      }
                    },
                  ),
                ),
                BlueButton(
                  width: 320,
                  onPressed: widget.regenerate,
                  text: 'neu generieren',
                  backgroundColor: Colors.black,
                ),
                BlueButton(
                  width: 320,
                  onPressed: () {
                    Navigator.pushNamed(context, '/end');
                  },
                  text: 'abschließen',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
