import 'package:adv_flutter_labs/import_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryController extends GetxController{
  var isLoading = false.obs;
  var categoryList = <Category>[].obs;
  final String baseUrl = 'https://67c7c39fc19eb8753e7aa353.mockapi.io/category';

  void oninit(){
    fetchCategories();
    super.onInit();
  }

  // get data
  Future<void> fetchCategories() async {
    try{
      final response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        var jsonData = json.decode(response.body) as List;
        categoryList.value = jsonData.map((json)=>Category.fromJson(json)).toList();
      }else{
        Get.snackbar("Error!!", "Failed to load categories");
      }
    }catch(e){
      Get.snackbar("Exception", e.toString());
    }finally{
      isLoading(false);
    }
  }


  // create data
  Future<void> addCategory(String name) async {
    try{
      final response = await http.post(Uri.parse(baseUrl),headers: {'Content-Type':application/json},body: jsonEncode('name':name));
    }
  }


}

