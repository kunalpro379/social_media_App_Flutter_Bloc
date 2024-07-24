// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'socket_service.dart';

// class CameraPage extends StatefulWidget {
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   final SocketService _socketService = SocketService();

//   @override
//   void initState() {
//     super.initState();
//     requestPermissions();
//   }

//   Future<void> requestPermissions() async {
//     var cameraStatus = await Permission.camera.request();
//     var microphoneStatus = await Permission.microphone.request();

//     if (cameraStatus.isGranted && microphoneStatus.isGranted) {
//       _initializeControllerFuture = initializeCamera();
//       _initializeControllerFuture.then((_) {
//         setState(() {}); // Refresh the UI when the camera is initialized
//       }).catchError((e) {
//         print('Error during initialization: $e');
//       });
//     } else {
//       print('Permissions denied');
//     }
//   }

//   Future<void> initializeCamera() async {
//     try {
//       final cameras = await availableCameras();
//       final firstCamera = cameras.isNotEmpty ? cameras.first : null;
//       if (firstCamera == null) {
//         throw Exception('No cameras available');
//       }
//       _controller = CameraController(
//         firstCamera,
//         ResolutionPreset.medium,
//       );
//       await _controller.initialize();
//     } catch (e) {
//       print('Error initializing camera: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void startStreaming() async {
//     try {
//       await _initializeControllerFuture;
//       _controller.startImageStream((CameraImage image) {
//         print('Image stream started');
//         final imageData = image.planes[0].bytes;
//         _socketService.startStream(imageData.toString());
//       });
//     } catch (e) {
//       print('Error starting stream: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Live Streaming')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: startStreaming,
//         child: Icon(Icons.videocam),
//       ),
//     );
//   }
// }
