import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'post_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'This is my first API call',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF42A5F5),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (postController.samplePosts.isEmpty) {
          return const Center(child: Text('No data found'));
        } else {
          return ListView.builder(
            itemCount: postController.samplePosts.length,
            itemBuilder: (context, index) {
              return Container(
                height: 130,
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User Id: ${postController.samplePosts[index].userId}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Id: ${postController.samplePosts[index].id}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Title: ${postController.samplePosts[index].title}',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Body: ${postController.samplePosts[index].body}',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
