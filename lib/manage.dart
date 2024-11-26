import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screens/p&d.dart';
import 'package:screens/p.dart';

class ManageShopScreen extends StatefulWidget {
  const ManageShopScreen({super.key});

  @override
  State<ManageShopScreen> createState() => _ManageShopScreenState();
}

class _ManageShopScreenState extends State<ManageShopScreen> {
  final List<File> _images = []; // To store picked images
  final ImagePicker _picker = ImagePicker(); // ImagePicker

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _images.add(File(pickedImage.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Manage Shop'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shop Name:',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    fontStyle: FontStyle.normal),
              ),
              const Text(
                'Hub Quality Bakers',
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 19,
                    color: Colors.black54,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 8),
              const Text(
                'FSSAI License Number:',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
              const Text(
                '873687DHDHJH122',
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 19,
                    color: Colors.black54,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 8),
              const Text(
                'Commission %:',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
              const Text(
                '10',
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 19,
                    color: Colors.black54,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 16),
              const Text(
                'Add Shop Display Photo (Max 1):',
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 19,
                    color: Colors.black,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 9),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    _pickImage();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text(
                    'Add Image',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
        
              const SizedBox(height: 11),
              Center(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _images.map((image) {
                    return Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _images.remove(image); // Remove image on tap
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  tileColor: const Color.fromARGB(255, 255, 253, 253),
                  title: const Text('Packaging & Delivery'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PackagingAndDeliveryScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: const Color.fromARGB(255, 255, 253, 253),
                  title: const Text('Promotions'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PromotionsScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Note:',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    fontSize: 18),
              ),
              const SizedBox(height: 16),
              const Text(
                  '1. Shop will not be visible to customers if you have  no    products added!',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      fontSize: 18)),
              const Text(
                  '2. We recommend adding products at menu price to avoid items being delisted in the future!',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
