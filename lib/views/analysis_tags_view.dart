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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Tooltip(
                  key: toolTipKey,
                  triggerMode: TooltipTriggerMode.manual,
                  showDuration: const Duration(seconds: 1),
                  message:
                      'Diese Stichwörter hat die KI in deiner Skizze entdeckt.',
                  textStyle: const TextStyle(
                    fontFamily: 'TWKLausanne',
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                  child: const Text(
                    'Generierte Schlagwörter',
                    style: TextStyle(
                      fontFamily: 'TWKLausanne',
                      fontSize: 24,
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
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < tags.length; i += 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 15),
                            child: Text(
                              tags[i],
                              style: const TextStyle(
                                fontFamily: 'TWKLausanne',
                                fontSize: 18,
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
                        for (int i = 1; i < tags.length; i += 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 15),
                            child: Text(
                              tags[i],
                              style: const TextStyle(
                                fontFamily: 'TWKLausanne',
                                fontSize: 18,
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
