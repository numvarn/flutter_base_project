import 'package:base_project/components/img_cached_cover_container.dart';
import 'package:flutter/material.dart';

class GalleryBody extends StatefulWidget {
  @override
  _GalleryBodyState createState() => _GalleryBodyState();
}

class _GalleryBodyState extends State<GalleryBody> {
  List<String> imgsList = [
    'https://numvarn.github.io/resume/asset/network_photos/cristina-gottardi-wndpWTiDuT0-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/david-marcu-78A265wPiO4-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/dino-reichmuth-kk3W5-0b6e0-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/eberhard-grossgasteiger-cgEbku0EbOg-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/frank-mckenna-iVVBVb2RqLc-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/garrett-parker-DlkF4-dbCOU-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/grant-ritchie-x1w_Q78xNEY-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/jakob-owens-n5wwck8ES4w-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/james-donovan-kFHz9Xh3PPU-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/jeremy-bishop-cEeEtjedNls-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/johannes-plenio-hvrpOmuMrAI-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/john-cobb-IE_sifhay7o-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/jonatan-pie-3N5ccOE3wGg-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/jonatan-pie-3l3RwQdHRHg-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/joshua-earle-xEh4hvxRKXM-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/luke-ellis-craven-yCsk1q2Eq0o-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/nathan-anderson-7TGVEgcTKlY-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/ray-hennessy-YCh5-MpB6C8-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/samuel-ferrara-uOi3lg8fGl4-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/vincent-guth-62V7ntlKgL8-unsplash.jpg',
    'https://numvarn.github.io/resume/asset/network_photos/wil-stewart-pHANr-CpbYM-unsplash.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SafeArea(
            top: false,
            bottom: false,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 6.0,
              padding: const EdgeInsets.all(10.0),
              children: List.generate(imgsList.length, (index) {
                return Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 1,
                  child: CachedImageCoverContainer(
                    imgUrl: "${imgsList[index]}",
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
