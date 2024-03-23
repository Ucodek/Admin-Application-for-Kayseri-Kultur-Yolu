import 'dart:developer';
import 'dart:io';
import 'package:image/image.dart';
import 'package:path/path.dart' as path; // Eklendi

void main() async {
  // Kaynak ve hedef dizinleri tanımlayın
  var sourceDirPath = 'C:/Users/tolga/Desktop/kultur-yolu-resimler';
  var destDirPath = 'C:/Users/tolga/Desktop/kultur-yolu-resimler-compressed-512-512';

  // Hedef dizini oluşturun
  await Directory(destDirPath).create(recursive: true);

  int i = 0;

  // Kaynak dizindeki tüm klasörleri gezdirin
  for (var dir in Directory(sourceDirPath).listSync(recursive: true)) {
    if (dir is Directory) {
      // Her klasördeki tüm resimleri gezdirin
      for (var file in dir.listSync()) {
        if (file is File && file.path.endsWith('.jpg')) {
          // Resim dosyasını okuyun
          var imageData = await decodeImage(await file.readAsBytes());

          // Resmin boyutunu 1920x1080'e küçültün
          var resizedImage = copyResize(imageData!, width: 512, height: 512);

          // Sıkıştırılmış resim dosyasını kaydedin
          var subDirPath =
              path.join(destDirPath, path.basename(dir.path)); // Alt dizin oluşturma
          await Directory(subDirPath).create(recursive: true);
          print(file.path.toString());
          print(file.absolute.path.toString());
          var compressedFile =
              File('${subDirPath}/${i.toString()}.jpg'); // Dosya adını sayısal yapma
          await compressedFile.writeAsBytes(encodeJpg(resizedImage, quality: 80));
          print(i);

          i++;
        }
      }
    }
  }

  print('Resimler küçültülüp sıkıştırıldı!');
}
