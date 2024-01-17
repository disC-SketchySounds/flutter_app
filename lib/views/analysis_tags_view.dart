import 'package:flutter/material.dart';

class AnalysisTagsView extends StatelessWidget {
  final List<String> tags;

  const AnalysisTagsView({super.key, required this.tags});

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
                    fontFamily: 'TWKLausanne',
                    fontSize: 24,
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
