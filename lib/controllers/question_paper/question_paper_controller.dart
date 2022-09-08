import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_study_app/controllers/auth_controller.dart';
import 'package:firebase_study_app/firebase_ref/references.dart';
import 'package:firebase_study_app/models/question_paper_model.dart';
import 'package:firebase_study_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperController extends GetxController{

  final allPaperImages = <String> [].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics"
    ];

    try{
      // print("error 4");
      QuerySnapshot<Map<String,dynamic>> data = await questionPaperRF.get();
      // print("error 5 ${data.docs.map((e) => QuestionPaperModel.fromSnapshot(e)).first.title}");
      final paperList = data.docs.map((e) => QuestionPaperModel.fromSnapshot(e)).toList();
      allPapers.assignAll(paperList);

      // print("error 6  ${paperList}");

      for(var paper in paperList){
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      // print("error 2");
      allPapers.assignAll(paperList);
    }catch(e){
      print("error 1 ${e}");
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper,bool tryAgain=false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggerIn()){
      if(tryAgain){
        Get.back();
        // Get.offNamed();
      }else{
        print("logged in");
        // Get.toNamed(page)
      }
    }else{
      print('${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}