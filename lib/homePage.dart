import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bodyController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //
  //Instantiate the BodyController and put it into GetX dependency injection
  //
  final BodyController bodyController = Get.put(BodyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        //There are four buttons in the appBar that
        // allow you to add additional functionality(for later)
        //
        backgroundColor: Colors.white60,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Product List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 2),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          const SizedBox(width: 2),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      //
      // Use Obx to update the UI
      //
      body: Obx(() {
        //
        //Show a loading spinner while the data is being fetched
        //Show a message if no data is found
        //Show the list of products when data is available
        //
        if (bodyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (bodyController.productList.isEmpty) {
          return const Center(child: Text('No data found'));
        } else {
          return ListView.builder(
            itemCount: bodyController.productList.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          bodyController.productList[index].image,
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        bodyController.productList[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${bodyController.productList[index].price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bodyController.productList[index].description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
      //
      // Define the bottom navigation bar
      //
      bottomNavigationBar: BottomNavigationBar(
        items:  const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
