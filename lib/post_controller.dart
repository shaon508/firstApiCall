import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'models/model.dart';

class PostController extends GetxController {
  var samplePosts = <SamplePost>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (Map<String, dynamic> item in data) {
          samplePosts.add(SamplePost.fromJson(item));
        }
      } else {
        throw Exception('Failed to load posts');
      }
    } finally {
      isLoading(false);
    }
  }
}
