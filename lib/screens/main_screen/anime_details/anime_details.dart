import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/widget/text_widget.dart';

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
    final titleEn = model.animeEntity?.data.attributes.titles.en;
    final titleEnJp = model.animeEntity?.data.attributes.titles.enJp;
    final titleJaJp = model.animeEntity?.data.attributes.titles.jaJp;
    final tiny = model.animeEntity?.data.attributes.posterImage.small;
    final small = model.animeEntity?.data.attributes.coverImage?.small;
    final large = model.animeEntity?.data.attributes.coverImage?.large;
    final createdAt = model.animeEntity?.data.attributes.createdAt;
    final status = model.animeEntity?.data.attributes.status;
    final ageRating = model.animeEntity?.data.attributes.ageRating;
    final description = model.animeEntity?.data.attributes.description;
    final userCount = model.animeEntity?.data.attributes.userCount;
    final averageRating =
        (double.parse((model.animeEntity!.data.attributes.averageRating)) / 10)
            .toStringAsFixed(1);

    // final biba = DateTime.parse(createdAt!);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 1.35,
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
                        : large != null
                            ? Image.network(
                                large,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox.shrink(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: titleEn != null
                  ? Text(
                      titleEn,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    )
                  : titleEnJp != null
                      ? Text(
                          titleEnJp,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        )
                      : titleJaJp != null
                          ? Text(
                              titleJaJp,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            )
                          : const SizedBox.shrink(),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  const TextWidget(
                    label: 'Rating: ',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  Text(
                    averageRating,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  const TextWidget(
                    label: 'Status:',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  Text(
                    status == 'current' ? '  it`s coming out' : '$status ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  const TextWidget(
                    label: 'Age rating:',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  Text(
                    ' $ageRating',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const TextWidget(
                      label: 'Created at: ',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                    createdAt != null
                        ? Text(
                            model.stringFromDate(createdAt),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const TextWidget(
                      label: 'Viewers: ',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                    userCount != null
                        ? Text(
                            '$userCount',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextWidget(
                    label: 'Description',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: description != null
                  ? Text(
                      description,
                      maxLines: 30,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
