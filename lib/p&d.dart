import 'package:flutter/material.dart';

class PackagingAndDeliveryScreen extends StatelessWidget {
  const PackagingAndDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String text = "Save";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Packaging & Delivery'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RowWithFields(
                title: 'Delivery Time :',
                editableHint: 'Enter Value',
                nonEditableValue: 'Minutes',
              ),
              const SizedBox(height: 16),
              const RowWithFields(
                title: 'Delivery Radius :',
                editableHint: 'Enter Value',
                nonEditableValue: 'KM',
              ),
              const SizedBox(height: 16),
              const RowWithFields(
                title: 'Free Delivery Radius :',
                editableHint: 'Enter Value',
                nonEditableValue: 'KM',
              ),
              const SizedBox(height: 16),
              const Text(
                'Packaging & Delivery Fees:',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 8),
              const RowWithFields(
                title: 'Order Value (OV) Wise :',
                nonEditableValue: 'OV >= ₹ 500',
                editableHint: 'Enter Price in ₹',
              ),
              const SizedBox(height: 16),
              const RowWithFields(
                title: 'Order Value (OV) Wise :',
                nonEditableValue: 'OV< ₹ 500',
                editableHint: 'Enter Price in ₹',
              ),
              const SizedBox(height: 16),
              const Text(
                'Note:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 18),
              ),
              const Text(
                '1. Minimum Value Allowed: ₹0',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 16),
              ),
              const Text(
                '2. Maximum Value Allowed: ₹100',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 16),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      setState() {
                        text = "Saved";
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child:  Text(
                    text,
                      style:const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowWithFields extends StatelessWidget {
  final String title;
  final String editableHint;
  final String nonEditableValue;

  const RowWithFields({
    super.key,
    required this.title,
    required this.editableHint,
    required this.nonEditableValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black87,
              fontSize: 18),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: EditableTextField(hintText: editableHint),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: NonEditableTextField(value: nonEditableValue),
            ),
          ],
        ),
      ],
    );
  }
}

class EditableTextField extends StatelessWidget {
  final String hintText;

  const EditableTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.number,
    );
  }
}

class NonEditableTextField extends StatelessWidget {
  final String value;

  const NonEditableTextField({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: value,
        hintStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.transparent,
      ),
      enabled: false, // Makes the field non-editable
    );
  }
}
