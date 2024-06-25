import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_application_new/loginform.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginform.dart'; // Import halaman login form

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CameraController? _controller;
  XFile? _image;
  bool _isCameraInitialized = false;
  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> _initializeCamera() async {
    if (kIsWeb) {
      // Initialize the camera only for web
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _controller = CameraController(
          cameras.first,
          ResolutionPreset.medium,
        );
        await _controller!.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
        _showCameraPreview();
      }
    }
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        final image = await _controller!.takePicture();
        setState(() {
          _image = image;
        });
        Navigator.of(context).pop();
      } catch (e) {
        print('Error taking picture: $e');
      }
    }
  }

  void _showCameraPreview() {
    if (_isCameraInitialized) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: CameraPreview(_controller!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.brown),
                      onPressed: _takePicture,
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  void _onCameraIconClick() {
    if (_isCameraInitialized) {
      _showCameraPreview();
    } else {
      _initializeCamera();
    }
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginForm()),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? NetworkImage(_image!.path) // Display the picked image
                        : AssetImage('drink.png') as ImageProvider, // Replace with your default profile picture path
                  ),
                ),
                Positioned(
                  top: 0,
                  right: MediaQuery.of(context).size.width / 2 - 50,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.brown),
                    onPressed: _onCameraIconClick,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    'Buk Siti',
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user != null ? user!.email! : 'user@example.com',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
                  ),
                  Text(
                    '082445623867',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.currency_bitcoin),
                title: Text(
                  'Rp 45.000.000.00',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.switch_account),
                title: Text(
                  'Ganti Akun',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                onTap: _logout, // Add onTap to logout
              ),
            ),
          ],
        ),
      ),
    );
  }
}
