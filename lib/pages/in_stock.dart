import 'package:snkrs_demo/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:snkrs_demo/lists/in_stock_list.dart';

class InStockPage extends StatelessWidget {
  const InStockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('In stock'),
      ),
      body: ListView.builder(
        itemCount: (InStockList.inStockImagesUrls.length / 2).ceil(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildImageWithBorder(
                      InStockList.inStockImagesUrls[index * 2]),
                ),
                const SizedBox(width: 3.0),
                Expanded(
                  child: index * 2 + 1 < InStockList.inStockImagesUrls.length
                      ? _buildImageWithBorder(
                          InStockList.inStockImagesUrls[index * 2 + 1])
                      : Container(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageWithBorder(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColor.vaaleanpunainen, // Määritä reunuksen väri
          width: 2.0, // Määritä reunuksen leveys
        ),
        borderRadius:
            BorderRadius.circular(6.0), // Määritä reunuksen kulma pyöristys
      ),
      child: Image.asset(
        imageUrl,
        height: 220.0,
        // Voit lisätä muita kuvan asetuksia tarpeen mukaan
      ),
    );
  }
}
