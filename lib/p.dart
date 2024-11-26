import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    // Allow user to pick multiple images
    final List<XFile>? pickedImages = await _picker.pickMultiImage();

    if (pickedImages != null) {
      // Check if the total number of images will exceed 4
      if (_images.length + pickedImages.length > 4) {
        // Show a SnackBar to notify the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You can only add up to 4 images in total.'),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      setState(() {
        // Add the selected images to the list
        _images.addAll(pickedImages.map((image) => File(image.path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promotions'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Add Shop Display Photo (Max 4):',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 19,
                color: Colors.black,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 9),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                onPressed: _pickImages, // Call the function to pick images
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text(
                  'Add Images',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _images.isEmpty
                ? const Center(
                    child: Text(
                      'You have Added No Banners!',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 19,
                        color: Colors.black38,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  )
                : Wrap(
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
          ],
        ),
      ),
    );
  }
}
