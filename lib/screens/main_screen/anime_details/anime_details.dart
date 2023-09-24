import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'anime_details_model/anime_details_model.dart';

class AnimeDetails extends StatelessWidget {
  const AnimeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Details()),
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
  void initState() {
    context.read<AnimeDetailsModel>().setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<AnimeDetailsModel>();
    // final title = model.animeEntity?.data.attributes;
    return ListView(
      children: [
        // title != null ? Text('${title}') :

        Text('biba')
      ],
    );
  }
}
