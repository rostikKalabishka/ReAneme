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
    return Scaffold(
      appBar: AppBar(),
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
    return ListView(
      children: [
        Center(
          child: title != null ? Text('${title}') : const SizedBox.shrink(),
        )
      ],
    );
  }
}
