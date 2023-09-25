import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'anime_details_model/anime_details_model.dart';

class AnimeDetails extends StatefulWidget {
  const AnimeDetails({super.key});

  @override
  State<AnimeDetails> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetails> {
  @override
  void didChangeDependencies() {
    context.watch<AnimeDetailsModel>().setup();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AnimeDetailsModel>();
    final titlesEn = model.animeEntity?.data.attributes.titles.en;
    final titlesEnJp = model.animeEntity?.data.attributes.titles.enJp;
    return Scaffold(
      appBar: AppBar(
        title: titlesEn != null
            ? Text(
                titlesEn,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : titlesEnJp != null
                ? Text(
                    titlesEnJp,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : const Text('Loading...'),
      ),
      body: const SafeArea(child: Details()),
    );
  }
}

class Details extends StatefulWidget {
  const Details({
    super.key,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AnimeDetailsModel>();
    final animeEntity = model.animeEntity;
    if (animeEntity == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }
    final title = model.animeEntity?.data.attributes.titles.en;
    final tiny = model.animeEntity?.data.attributes.coverImage?.tiny;
    final small = model.animeEntity?.data.attributes.coverImage?.small;

    final description = model.animeEntity?.data.attributes.description;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.6,
            child: tiny != null
                ? Image.network(
                    tiny,
                    fit: BoxFit.cover,
                  )
                : small != null
                    ? Image.network(
                        small,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: title != null
                ? Text(
                    title,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          const Text('Description'),
          description != null
              ? Text(
                  description,
                  maxLines: 12,
                  overflow: TextOverflow.ellipsis,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
