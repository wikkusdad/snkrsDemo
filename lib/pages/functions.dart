import 'dart:math';

import 'package:image_picker/image_picker.dart';

import 'lists.dart';

void addTobag(
    {required String brand,
    required String model,
    required String imageUrl,
    required double size,
    required int price}) {
  basket.add([brand, model, imageUrl, size.toString(), price.toString()]);
}

void addTobag2(
    {required String brand,
    required String model,
    required String imageUrl,
    required String hoodiesize,
    required int price}) {
  basket.add([brand, model, imageUrl, hoodiesize, price.toString()]);
}

//double calculateTotalAmount(List<List<dynamic>> basket) {
//double sum = 0.0;
//basket.forEach((item) {
//sum += item[4] as double;
//});
//return sum;
//}

double calculateTotalAmount(List<List<dynamic>> basket) {
  double sum = 0.0;
  basket.forEach((item) {
    sum += double.parse(item[4].toString());
  });
  return sum;
}

void emptyBasket(List<List<String>> basket) {
  basket.clear();
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
}

String randomReferenceNumber() {
  Random random = Random();
  return List.generate(12, (index) => random.nextInt(10)).join();
}
