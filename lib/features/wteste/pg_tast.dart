import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Testpagina extends StatelessWidget {
  static const String route = '/test';

  Testpagina({super.key});

  final List<String> banners = [
    'assets/images/banner.png',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SearchBar(
              hintText: 'Pesquisar...',
              leading: const Icon(Icons.search),
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ),
      ),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 170,
              width: 390,

              child: Container(
                color: Colors.deepOrangeAccent,
                child: CarouselSlider.builder(
                  itemCount: banners.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: itemIndex == 0
                                ? MediaQuery.of(context).size.width
                                : MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              image: DecorationImage(
                                image: AssetImage(banners[itemIndex]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 0.6,
                    autoPlay: true,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('Título'),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
