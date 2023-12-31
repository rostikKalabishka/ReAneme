import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget/text_widget.dart';
import 'model_more_info/more_info_model.dart';

class MoreInfoWidget extends StatelessWidget {
  const MoreInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const SafeArea(
        child: ColumnButtonWidget(),
      ),
    );
  }
}

class ColumnButtonWidget extends StatelessWidget {
  const ColumnButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.read<MoreInfoModel>();
    // final anime = model.anime?.data[0].attributes.titles.en;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              child: const TextWidget(
                label: 'Switch to manga',
              )),
          TextButton(
              onPressed: () async {
                await model.logout(context);
              },
              child: const TextWidget(
                label: 'Logout',
              ))
        ],
      ),
    );
  }
}
