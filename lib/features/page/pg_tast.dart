import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/shared/app_text_style.dart';
//import 'package:flutter/rendering.dart';

class Testpagina extends StatelessWidget {
  static const String route = '/test';

  const Testpagina({super.key});

  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
              height: 136,
              width: 360,
              child: PageView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aproveite as\n ofertas',
                          style: AppTextStyle.subTitle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    width: MediaQuery.sizeOf(context).width * 0.50,
                    height: 250,
                    child: Row(
                      children: [
                        Text(
                          'Experimente\n agora!',
                          style: AppTextStyle.subTitle,
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/banner2.jpg',
                          height: double.infinity,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ],
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
