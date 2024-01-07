import 'package:flutter/material.dart';

class AnalysisTagsView extends StatelessWidget {
  final List<String> tags;

  AnalysisTagsView({required this.tags});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Generierte Schlagwörter',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < tags.length; i += 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 8),
                            child: Text(
                              tags[i],
                              style: const TextStyle(
                                fontSize: 16,
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
                            padding: const EdgeInsets.only(right: 16, top: 8),
                            child: Text(
                              tags[i],
                              style: const TextStyle(
                                fontSize: 16,
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
