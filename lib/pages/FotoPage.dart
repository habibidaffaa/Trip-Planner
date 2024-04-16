import 'package:flutter/material.dart';

class FotoPage extends StatelessWidget {
  const FotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'poppins_bold',
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Color(0xFFC58940),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/logo/Logo_camera.png',
              width: 32,
              height: 32,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 6, // Ganti dengan jumlah foto yang ingin ditampilkan
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            child: Image.asset(
              'assets/logo/Rectangle5.png',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
