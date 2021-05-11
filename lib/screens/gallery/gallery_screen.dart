import 'package:base_project/components/img_cached_cover_container.dart';
import 'package:base_project/data/image_network.dart';
import 'package:flutter/material.dart';

Widget galleryScreen(BuildContext context) {
  print("Build Gallery Screen");
  return Column(
    children: [
      Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 6.0,
          padding: const EdgeInsets.all(10.0),
          children: List.generate(galleryList.length, (index) {
            return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              child: CachedImageCoverContainer(
                imgUrl: "${galleryList[index]}",
              ),
            );
          }),
        ),
      ),
    ],
  );
}
