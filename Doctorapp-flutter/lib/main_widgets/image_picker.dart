// main_widgets/image_picker.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoWidget extends StatefulWidget {
  final Function(XFile?) onImagePicked;

  const AddPhotoWidget({super.key, required this.onImagePicked});

  @override
  _AddPhotoWidgetState createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends State<AddPhotoWidget> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _chooseFile(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
    // Send the picked file to the parent widget
    widget.onImagePicked(_imageFile);
  }

  void _showImageSourceSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.of(context).pop();
                _chooseFile(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _chooseFile(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Adjust text scaling based on height
    final double textMultiplier = screenHeight / 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: ElevatedButton(
                onPressed: () => _showImageSourceSelection(context),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(AppColors.appMainColour),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: screenHeight * 0.013),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Upload your ID Proof',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: textMultiplier * 1.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(
                    truncateToMaxLetters(
                        _imageFile == null ? 'No file chosen' : 'file uploaded',
                        21),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: textMultiplier * 1.6,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  _imageFile == null
                      ? const Icon(
                          Icons.upload,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.check,
                          color: AppColors.appMainColour,
                        )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  String truncateToMaxLetters(String text, int maxLetters) {
    if (text.length <= maxLetters) {
      return text;
    }
    return '${text.substring(0, maxLetters)}...';
  }
}
