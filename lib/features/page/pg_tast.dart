import 'package:flutter/material.dart';
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
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text('Texto do produto')],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
