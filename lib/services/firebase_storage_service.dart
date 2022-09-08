import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';


import '../firebase_options.dart';
import '../firebase_ref/references.dart';


class FirebaseStorageService extends GetxService{


  Future<String?> getImage(String imgName) async {
    print("error 6 ${imgName}");
    if(imgName == null){
      return null;
    }
    try{
      var urlRef = firebaseStorage.child('question_paper_images/')
          .child('${imgName.toLowerCase()}.png');
      print("error 8 ${imgName}");
      var imgUrl = await urlRef.getDownloadURL();
      print("error 5 ${imgUrl}");
      return imgUrl;
    }catch(e){
      print("error 9 ${e}");
      return null;
    }
  }
}