import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/features/home/widgets/banner/banner_widget.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      // =========================
      // Banners
      // =========================
      items: [
        BannerWidget(
          label: 'Aproveite as\nofertas',
          imagePath: 'assets/images/banner3.png',
        ),

        BannerWidget(
          label: 'Experimente\nagora!',
          imagePath: 'assets/images/banner2.jpg',
        ),
      ],

      // =========================
      // Configurações
      // =========================
      options: CarouselOptions(
        height: 136,
        viewportFraction: 1,

        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),

        enlargeCenterPage: false,
      ),
    );
  }
}
