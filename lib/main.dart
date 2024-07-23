import 'package:connectiva/presentation/Explore_main_Container/explore.dart';
import 'package:connectiva/presentation/Explore_pages/bloc/Explore.state.dart';
import 'package:connectiva/presentation/Explore_pages/models/explore.model.dart';
import 'package:connectiva/presentation/stories_screen/stories_screen.dart';
import 'package:connectiva/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/utils/size_utils.dart';
import 'global_classes/Custom_TabBar/TabBar.cubit.dart';
import 'presentation/Explore_main_Container/bloc/explore.bloc.dart';
import 'presentation/Explore_main_Container/bloc/explore.state.dart';
import 'presentation/Explore_main_Container/models/explore.model.dart';
import 'presentation/Explore_pages/bloc/Explore.bloc.dart';
import 'presentation/stories_screen/bloc/live_events/event.bloc.dart';
import 'presentation/stories_screen/bloc/live_events/event.event.dart';
import 'presentation/stories_screen/bloc/live_events/event.state.dart';
import 'presentation/stories_screen/bloc/stories/stories_bloc.dart';
import 'presentation/stories_screen/bloc/stories/stories_event.dart';
import 'presentation/stories_screen/bloc/stories/stories_state.dart';
import 'presentation/stories_screen/models/Events.dart';
import 'presentation/stories_screen/models/stories.model.dart';
import 'theme/theme_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:connectiva/routes/app_routes.dart'; // Adjust the path according to your project structure
import 'package:connectiva/global_classes/NavigationService.dart'; // Adjust the path according to your project structure

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          BlocProvider<StoriesBloc>(
            create: (context) => StoriesBloc(StoriesState(
              searchController: TextEditingController(),
              storiesModelObj: StoriesModel(storiesItemList: []),
              isLoading: false,
            ))
              ..add(StoriesInitialEvent()), // Ensure initial event is added
          ),
          BlocProvider<ExploreContainerBloc>(
            create: (context) => ExploreContainerBloc(
              ExploreContentState(
                exploreContentModelObj: ExploreContentModel(),
              ),
            ),
          ),
          BlocProvider<ExploreBloc>(
              create: (context) =>
                  ExploreBloc(ExploreState(ExploreModelObj: ExploreModel()))),
          BlocProvider<TabBarCubit>(
            create: (context) => TabBarCubit(),
          ),
          // BlocProvider<EventBloc>(create: (context) => EventBloc()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        // onGenerateRoute: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        theme: theme, // Applying the theme from theme_helper.dart
        locale: Get.deviceLocale, // Using the device's locale
        fallbackLocale: const Locale('en', 'US'), // Fallback locale
        title: 'connectiva', // App title
        home: ExploreContent(), // Initial screen
      );
    });
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(event.thumbnailUrl,
                  fit: BoxFit.cover, height: 150, width: double.infinity),
              if (event.isLive)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    color: Colors.red,
                    child: Text(
                      'LIVE',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(event.venue),
                Text(event.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is EventInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is EventsLoaded) {
          final events = state.events;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventCard(event: event);
            },
          );
        } else if (state is EventLoadError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => EventBloc()..add(LoadEvents()),
        child: Scaffold(
          appBar: AppBar(title: Text('Events')),
          body: EventList(),
        ),
      ),
    );
  }
}
*/
/*

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeScreen.dart'; // Assuming HomeScreen.dart contains your HomeScreen widget
import 'TabBarCubit.dart'; // Assuming TabBarCubit.dart contains your TabBarCubit class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TabBarCubit(), // Provide your TabBarCubit
        child: HomeScreen(), // Use HomeScreen as the initial screen
      ),
    );
  }
}

// */

// // class _MyAppState extends State<MyApp> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       SizeUtils.init(context);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiBlocProvider(
// //       providers: [
// //         BlocProvider<ExploreContainerBloc>(
// //           create: (context) => ExploreContainerBloc(
// //             ExploreContentState(
// //               exploreContentModelObj: ExploreContentModel(),
// //             ),
// //           ),
// //         ),
// //       ],
// //       child: MaterialApp(
// //         title: 'Flutter Bottom Navigation Bar',
// //         theme: ThemeData(
// //           primarySwatch: Colors.blue,
// //           visualDensity: VisualDensity.adaptivePlatformDensity,
// //         ),
// //         initialRoute: AppRoutes.ExplorePage,
// //         routes: {
// //           AppRoutes.ExplorePage: (context) => ExploreContent.builder(context),
// //           AppRoutes.stories: (context) => StoriesScreen(),
// //           // Remove the duplicate route
// //           // AppRoutes.ExplorePage: (context) => ExploreContent(),
// //         },
// //       ),
// //     );
// //   }
// // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_webrtc/flutter_webrtc.dart';
// // import 'package:socket_io_client/socket_io_client.dart' as IO;
// // import 'package:uuid/uuid.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter WebRTC Chat',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   final String serverUrl =
// //       'http://192.168.208.227:3000'; // Replace with your server IP
// //   late IO.Socket socket;
// //   late RTCVideoRenderer _localRenderer = RTCVideoRenderer();
// //   late RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
// //   late RTCPeerConnection _peerConnection;
// //   final TextEditingController _roomIdController = TextEditingController();
// //   final TextEditingController _messageController = TextEditingController();
// //   final ScrollController _scrollController = ScrollController();
// //   String? _roomId;
// //   List<String> _messages = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initSocket();
// //     _initRenderers();
// //   }

// //   void _initSocket() {
// //     socket = IO.io(serverUrl, <String, dynamic>{
// //       'transports': ['websocket'],
// //     });

// //     socket.on('connect', (_) {
// //       print('Connected: ${socket.id}');
// //     });

// //     socket.on('roomCreated', (roomId) {
// //       print('Room created: $roomId');
// //       setState(() {
// //         _roomId = roomId;
// //         _joinRoom();
// //       });
// //     });

// //     socket.on('roomJoined', (roomId) {
// //       print('Room joined: $roomId');
// //       setState(() {
// //         _roomId = roomId;
// //       });
// //       _createPeerConnection();
// //       _startLocalVideo();
// //     });

// //     socket.on('roomNotFound', (_) {
// //       print('Room not found');
// //     });

// //     socket.on('offer', (data) {
// //       print('Received offer: ${data['sdp']}');
// //       _handleOffer(data);
// //     });

// //     socket.on('answer', (data) {
// //       print('Received answer: ${data['sdp']}');
// //       _handleAnswer(data);
// //     });

// //     socket.on('iceCandidate', (data) {
// //       print('Received ICE candidate: ${data['candidate']}');
// //       _handleCandidate(data);
// //     });

// //     socket.on('chatMessage', (data) {
// //       setState(() {
// //         _messages.add('${data['id']}: ${data['message']}');
// //       });
// //       _scrollController.animateTo(
// //         _scrollController.position.maxScrollExtent,
// //         duration: Duration(milliseconds: 300),
// //         curve: Curves.easeOut,
// //       );
// //     });
// //   }

// //   void _initRenderers() async {
// //     await _localRenderer.initialize();
// //     await _remoteRenderer.initialize();
// //   }

// //   void _createRoom() {
// //     // Generate a room ID (using uuid package)
// //     String roomId = Uuid().v4();

// //     // Replace with your logic to interact with signaling server or other backend
// //     // Here's an example of how you might handle room creation logic
// //     print('Creating room: $roomId');

// //     // Call start local video after room creation
// //     _startLocalVideo();

// //     // For demonstration purposes, we print the roomId and do nothing else
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text('Room Created'),
// //           content: Text('Room ID: $roomId'),
// //           actions: <Widget>[
// //             TextButton(
// //               child: Text('OK'),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _joinRoom() {
// //     // Retrieve room ID from text field
// //     String roomId = _roomIdController.text.trim();

// //     // Replace with your logic to interact with signaling server or other backend
// //     // Here's an example of how you might handle room joining logic
// //     print('Joining room: $roomId');

// //     // Call start local video after joining room
// //     _startLocalVideo();

// //     // For demonstration purposes, we print the roomId and do nothing else
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text('Joining Room'),
// //           content: Text('Room ID: $roomId'),
// //           actions: <Widget>[
// //             TextButton(
// //               child: Text('OK'),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _createPeerConnection() async {
// //     final Map<String, dynamic> config = {
// //       'iceServers': [
// //         {'urls': 'stun:stun.l.google.com:19302'},
// //       ],
// //     };

// //     _peerConnection = await createPeerConnection(config, {});
// //     _peerConnection.onIceCandidate = _handleIceCandidate;
// //     _peerConnection.onIceConnectionState = _handleIceConnectionStateChange;
// //     _peerConnection.onAddStream = _handleAddStream;
// //   }

// //   void _handleOffer(dynamic data) async {
// //     RTCSessionDescription description =
// //         RTCSessionDescription(data['sdp'], data['type']);
// //     await _peerConnection.setRemoteDescription(description);
// //     RTCSessionDescription answer = await _peerConnection.createAnswer({});
// //     await _peerConnection.setLocalDescription(answer);
// //     socket.emit('answer', {
// //       'sdp': answer.sdp,
// //       'type': answer.type,
// //       'roomId': _roomId,
// //     });
// //   }

// //   void _handleAnswer(dynamic data) async {
// //     RTCSessionDescription description =
// //         RTCSessionDescription(data['sdp'], data['type']);
// //     await _peerConnection.setRemoteDescription(description);
// //   }

// //   void _handleCandidate(dynamic data) {
// //     RTCIceCandidate candidate = RTCIceCandidate(
// //         data['candidate'], data['sdpMid'], data['sdpMLineIndex']);
// //     _peerConnection.addCandidate(candidate);
// //   }

// //   void _startLocalVideo() async {
// //     MediaStream stream = await navigator.mediaDevices.getUserMedia({
// //       'audio': true,
// //       'video': true,
// //     });
// //     _localRenderer.srcObject = stream;
// //     _peerConnection.addStream(stream);
// //     socket.emit('publish', {'roomId': _roomId});
// //   }

// //   void _handleIceCandidate(RTCIceCandidate candidate) {
// //     socket.emit('iceCandidate', {
// //       'candidate': candidate.candidate,
// //       'sdpMid': candidate.sdpMid,
// //       'sdpMLineIndex': candidate.sdpMLineIndex,
// //       'roomId': _roomId,
// //     });
// //   }

// //   void _handleIceConnectionStateChange(RTCIceConnectionState state) {
// //     print('ICE Connection State: $state');
// //     // Handle ICE connection state changes if needed
// //   }

// //   void _handleAddStream(MediaStream stream) {
// //     _remoteRenderer.srcObject = stream;
// //   }

// //   void _sendMessage(String message) {
// //     socket.emit('chatMessage', {'roomId': _roomId, 'message': message});
// //     _messageController.clear();
// //   }

// //   @override
// //   void dispose() {
// //     socket.disconnect();
// //     _localRenderer.dispose();
// //     _remoteRenderer.dispose();
// //     _roomIdController.dispose();
// //     _messageController.dispose();
// //     _scrollController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Flutter WebRTC Chat'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             TextField(
// //               controller: _roomIdController,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter Room ID',
// //               ),
// //             ),
// //             ElevatedButton(
// //               onPressed: _createRoom,
// //               child: Text('Create Room'),
// //             ),
// //             ElevatedButton(
// //               onPressed: _joinRoom,
// //               child: Text('Join Room'),
// //             ),
// //             if (_roomId != null)
// //               Column(
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: TextField(
// //                           controller: _messageController,
// //                           decoration: InputDecoration(
// //                             hintText: 'Enter your message',
// //                           ),
// //                           onSubmitted: _sendMessage,
// //                         ),
// //                       ),
// //                       IconButton(
// //                         icon: Icon(Icons.send),
// //                         onPressed: () => _sendMessage(_messageController.text),
// //                       ),
// //                     ],
// //                   ),
// //                   Expanded(
// //                     child: ListView.builder(
// //                       controller: _scrollController,
// //                       itemCount: _messages.length,
// //                       itemBuilder: (context, index) => ListTile(
// //                         title: Text(_messages[index]),
// //                       ),
// //                     ),
// //                   ),
// //                   RTCVideoView(
// //                     _remoteRenderer,
// //                     mirror: true,
// //                   ),
// //                 ],
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:connectiva/socket_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp().then((_) {
//     print("Firebase initialized successfully");
//   }).catchError((error) {
//     print("Firebase initialization error: $error");
//   });
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Signaling signaling = Signaling();
//   RTCVideoRenderer _localRenderer = RTCVideoRenderer();
//   RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
//   String? roomId;
//   TextEditingController textEditingController = TextEditingController(text: '');

//   @override
//   void initState() {
//     _localRenderer.initialize();
//     _remoteRenderer.initialize();

//     signaling.onAddRemoteStream = ((stream) {
//       _remoteRenderer.srcObject = stream;
//       setState(() {});
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _localRenderer.dispose();
//     _remoteRenderer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome to Flutter Explained - WebRTC"),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   signaling.openUserMedia(_localRenderer, _remoteRenderer);
//                 },
//                 child: Text("Open camera & microphone"),
//               ),
//               SizedBox(
//                 width: 8,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   roomId = await signaling.createRoom(_remoteRenderer);
//                   textEditingController.text = roomId!;
//                   setState(() {});
//                 },
//                 child: Text("Create room"),
//               ),
//               SizedBox(
//                 width: 8,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add roomId
//                   signaling.joinRoom(
//                     textEditingController.text.trim(),
//                     _remoteRenderer,
//                   );
//                 },
//                 child: Text("Join room"),
//               ),
//               SizedBox(
//                 width: 8,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   signaling.hangUp(_localRenderer);
//                 },
//                 child: Text("Hangup"),
//               )
//             ],
//           ),
//           SizedBox(height: 8),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
//                   Expanded(child: RTCVideoView(_remoteRenderer)),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Join the following Room: "),
//                 Flexible(
//                   child: TextFormField(
//                     controller: textEditingController,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(height: 8)
//         ],
//       ),
//     );
//   }
// }
