import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widget/text_widget.dart';
import 'anime_ongoing_model/anime_ongoing_model.dart';

class AnimeOngoingWidget extends StatefulWidget {
  const AnimeOngoingWidget({Key? key}) : super(key: key);

  @override
  State<AnimeOngoingWidget> createState() => _AnimeOngoingWidgetState();
}

class _AnimeOngoingWidgetState extends State<AnimeOngoingWidget> {
  @override
  void didChangeDependencies() {
    final model = context.read<AnimeOngoingModel>();
    model.setup();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AnimeOngoingModel>();
    final anime = model.anime;
    if (anime == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }

    return SizedBox(
      height: 310, // Set a fixed height for the Container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.anime?.data.length,
        itemBuilder: (context, int index) {
          final animeList = model.anime?.data[index];
          final small = animeList?.attributes.posterImage?.small;
          final title = animeList?.attributes.titles.en;
          final titleEnJp = animeList?.attributes.titles.enJp;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => model.onAnimeTap(context, index),
              child: ClipRRect(
                child: Container(
                  width: 190, // Set a fixed width for each item
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: small != null
                            ? Image.network(small)
                            : const SizedBox.shrink(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              label: title ?? titleEnJp ?? 'None',
                              fontSize: 16,
                              maxLines: 1,
                              fontWeight: FontWeight.normal,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
