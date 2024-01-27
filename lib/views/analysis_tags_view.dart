import 'package:flutter/material.dart';
import 'package:flutter_app/resources/app_colors.dart';

class AnalysisTagsView extends StatelessWidget {
  final List<String> tags;

  final GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();

  AnalysisTagsView({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          children: [
            Row(
              children: [
                Tooltip(
                  key: toolTipKey,
                  triggerMode: TooltipTriggerMode.manual,
                  showDuration: const Duration(seconds: 1),
                  message:
                      'Diese Schlagworte hat\ndie KI in deiner\nSkizze entdeckt.',
                  textStyle: const TextStyle(
                    fontFamily: 'MozartNbp',
                    fontSize: 24,
                    color: AppColors.white,
                    backgroundColor: AppColors.blue,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    border: Border.all(color: AppColors.white, width: 2.0),
                  ),
                  child: const Text(
                    'Schlagworte',
                    style: TextStyle(
                      fontFamily: 'MozartNbp',
                      fontSize: 41,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    toolTipKey.currentState?.ensureTooltipVisible();
                  },
                  icon: const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < (tags.length < 11 ? tags.length : 10); i += 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 15),
                            child: Text(
                              tags[i],
                              style: const TextStyle(
                                fontFamily: 'MozartNbp',
                                fontSize: 24,
                                height: 0.5,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 1; i < (tags.length < 11 ? tags.length : 10); i += 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 15),
                            child: Text(
                              tags[i],
                              style: const TextStyle(
                                fontFamily: 'MozartNbp',
                                fontSize: 24,
                                height: 0.5,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
