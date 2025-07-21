import 'dart:io';
import 'package:image/image.dart';

void createPlaceholderImage() {
  final image = Image(width: 150, height: 150);
  image.clear(color: ColorRgb8(192, 192, 192));
  final file = File('assets/images/placeholder.png');
  file.writeAsBytesSync(encodePng(image));
}
