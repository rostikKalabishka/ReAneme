import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widget/text_widget.dart';
import 'model/anime_tv_model.dart';

class AnimeTVWidget extends StatefulWidget {
  const AnimeTVWidget({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => AnimeMovieModel(),
      child: const AnimeTVWidget(),
    );
  }

  @override
  State<AnimeTVWidget> createState() => _AnimeTVWidgetState();
}

class _AnimeTVWidgetState extends State<AnimeTVWidget> {
  @override
  void initState() {
    final model = context.read<AnimeMovieModel>();
    model.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AnimeMovieModel>();
    final popularAnimeList = model.animeMovieList;
    return SizedBox(
      height: 310, // Set a fixed height for the Container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularAnimeList.length,
        itemBuilder: (context, int index) {
          final animeList = popularAnimeList[index];
          final small = animeList.attributes.posterImage?.small;
          final title = animeList.attributes.titles.en;
          final titleEnJp = animeList.attributes.titles.enJp;
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                            label: title ?? titleEnJp ?? ' negro',
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
          );
        },
      ),
    );
  }
}
