import 'dart:io';
import 'package:image/image.dart' as img;

void createPlaceholderImage() {
  final image = img.Image(width: 150, height: 150);
  img.fill(image, color: img.ColorRgb8(192, 192, 192));
  final file = File('assets/images/placeholder.png');
  file.writeAsBytesSync(img.encodePng(image));
}
