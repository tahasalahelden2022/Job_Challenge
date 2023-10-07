// ignore_for_file: non_constant_identifier_names

import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //  useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ownerUser = "user1";
  String activeUser = "Father Night";
  String title = "title for ur vadio";
  int _vote = 0;
  final PanelController panal_control = PanelController();
  final TextEditingController comment_controller = TextEditingController();
  final TextEditingController commentChild_controller = TextEditingController();
  final BottomDrawerController bottomDrawer_controller =
      BottomDrawerController();
  late VideoPlayerController player_controller;
  late Future<void> _initializeVideoPlayerFuture;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    player_controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );
    _initializeVideoPlayerFuture = player_controller.initialize();
    setState(() {});
    player_controller.play();
  }

  @override
  void dispose() {
    player_controller.dispose();
    super.dispose();
  }

// Use a FutureBuilder to display a loading spinner while waiting for the
// VideoPlayerController to finish initializing.
  String _selectedItem = 'New';

  final List<String> _dropdownItems = [
    'New',
    'Old',
    'vote',
  ];

  List comments = [
    {
      "username": "user1",
      "avatar": "",
      "time": "00.00",
      "comment": "just comment for test1",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user2",
      "avatar": "",
      "time": "00.01",
      "comment": "just comment for test2",
      "vot": 0,
      "replay": false,
      "child": [
        {
          "username": "child user",
          "avatar": "",
          "time": "00.01",
          "comment": "just comment for test2 child",
          "vot": 0,
          "replay": false,
        },
        {
          "username": "child user2",
          "avatar": "",
          "time": "00.01",
          "comment": "just comment for test2 child2",
          "vot": 0,
          "replay": false,
        }
      ],
    },
    {
      "username": "user3",
      "avatar": "",
      "time": "00.02",
      "comment": "just comment for test3",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user4",
      "avatar": "",
      "time": "00.03",
      "comment": "just comment for test4",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user5",
      "avatar": "",
      "time": "00.04",
      "comment": "just comment for test5",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user6",
      "avatar": "",
      "time": "00.05",
      "comment": "just comment for test6",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user7",
      "avatar": "",
      "time": "00.06",
      "comment": "just comment for test7",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user8",
      "avatar": "",
      "time": "00.07",
      "comment": "just comment for test8",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user9",
      "avatar": "",
      "time": "00.08",
      "comment": "just comment for test9",
      "vot": 0,
      "replay": false,
      "child": [],
    },
    {
      "username": "user10",
      "avatar": "",
      "time": "00.09",
      "comment": "just comment for test10",
      "vot": 0,
      "replay": false,
      "child": [],
    }
  ];

  countcomments() {
    int count = 0;
    int child = 0;
    for (var comment in comments) {
      int c = comment["child"].length;
      child += c;
    }
    count = child + comments.length;
    return count;
  }

  _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        disableDraggableOnScrolling: true,
        controller: panal_control,
        color: Colors.black,
        minHeight: 15,
        panelBuilder: () => Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      color: const Color.fromRGBO(41, 41, 41, 0.867),
                      child: const Icon(
                        Icons.person_pin_outlined,
                        size: 75,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      " $ownerUser",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(title),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DropdownButton<String>(
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: Colors.black,
                      value: _selectedItem,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItem = newValue!;
                        });
                      },
                      items: _dropdownItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    )
                  ],
                )
              ]),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return comment(index);
                },
              ),
            ),
            commentBox(),
          ],
        ),
        header: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ForceDraggableWidget(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(41, 41, 41, 0.867),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // If the VideoPlayerController has finished initialization, use
                            // the data it provides to limit the aspect ratio of the video.
                            return AspectRatio(
                              aspectRatio: player_controller.value.aspectRatio,
                              // Use the VideoPlayer widget to display the video.
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  VideoPlayer(player_controller),
                                  const ClosedCaption(text: null),
                                  // Here you can also add Overlay capacities
                                  TextButton(
                                    onPressed: () {
                                      if (player_controller.value.isPlaying) {
                                        player_controller.pause();
                                      } else {
                                        // If the video is paused, play it.
                                        player_controller.play();
                                      }

                                      setState(() {});
                                    },
                                    child: Icon(
                                      player_controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 25,
                                      color: const Color.fromARGB(
                                          115, 255, 255, 255),
                                    ),
                                  ),
                                  VideoProgressIndicator(
                                    player_controller,
                                    allowScrubbing: true,
                                    padding: const EdgeInsets.all(3),
                                    colors: const VideoProgressColors(
                                      playedColor:
                                          Color.fromARGB(160, 118, 117, 117),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              color: const Color.fromRGBO(41, 41, 41, 0.867),
                              child: const Icon(
                                Icons.person_pin_outlined,
                                size: 75,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " $ownerUser",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Text(title),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Column(
                        children: [
                          vote(true, 0, -1),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              panal_control.open();
                            },
                            child: const Icon(
                              Icons.comment_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text("${countcomments()}"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.file_upload_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget vote(bool vertical, int index, int indexChild) {
    return Container(
        child: vertical
            ? Column(
                children: [
                  TextButton(
                    onPressed: () {
                      _vote++;
                      setState(() {});
                    },
                    child: const Icon(
                      color: Colors.white,
                      Icons.arrow_upward_rounded,
                    ),
                  ),
                  Text(
                    "$_vote",
                  ),
                  TextButton(
                    onPressed: () {
                      _vote--;
                      setState(() {});
                    },
                    child: const Icon(
                      color: Colors.white,
                      Icons.arrow_downward_rounded,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  TextButton(
                    onPressed: () {
                      indexChild == -1
                          ? comments[index]['vot']++
                          : comments[index]['child'][indexChild]['vot']++;
                      setState(() {});
                    },
                    child: const Icon(
                      color: Colors.white,
                      Icons.arrow_upward_rounded,
                    ),
                  ),
                  Text(
                    indexChild == -1
                        ? "${comments[index]['vot']}"
                        : "${comments[index]['child'][indexChild]['vot']}",
                  ),
                  TextButton(
                    onPressed: () {
                      indexChild == -1
                          ? comments[index]['vot']--
                          : comments[index]['child'][indexChild]['vot']--;
                      setState(() {});
                    },
                    child: const Icon(
                      color: Colors.white,
                      Icons.arrow_downward_rounded,
                    ),
                  ),
                ],
              ));
  }

  Widget comment(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Card(
        color: const Color.fromRGBO(41, 41, 41, 0.867),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      color: const Color.fromRGBO(41, 41, 41, 0.867),
                      child: const Icon(
                        Icons.person_pin_outlined,
                        size: 75,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      " ${comments[index]['username']}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    comments[index]['username'] == ownerUser
                        ? const Text(
                            " OP",
                            style: TextStyle(color: Colors.blue),
                          )
                        : const Text(""),
                    Text(" ${comments[index]['time']}"),
                  ],
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  comments[index]['comment'],
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            comments[index]['child'].isEmpty || comments[index]['child'] == null
                ? const Center()
                // ignore: avoid_unnecessary_containers
                : Container(
                    child: Column(
                      children: child(index),
                    ),
                  ),
            Container(
              color: const Color.fromRGBO(41, 41, 41, 0.867),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Positioned(
                                bottom: 0,
                                child: buildBottomDrawer(context, index, -1),
                              );
                            });

                        bottomDrawer_controller.open();
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )),
                  TextButton(
                      onPressed: () {
                        for (var i = 0; i < comments.length; i++) {
                          comments[index]['replay'] = false;
                        }
                        comments[index]['replay'] = true;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.reply,
                        color: Colors.white,
                      )),
                  vote(false, index, -1),
                ],
              ),
            ),
            comments[index]['replay'] ? commentBoxReplay(index) : const Center()
          ],
        ),
      ),
    );
  }

  child(index) {
    List<Widget> widgetItems = [];
    for (var i = 0; i < comments[index]['child'].length; i++) {
      widgetItems.add(commentChild(index, i));
    }
    return widgetItems;
  }

  commentChild(int index, int indexChild) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.blueGrey,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
      ),
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Card(
        color: Colors.black,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 75,
                      width: 75,
                      child: Icon(
                        Icons.person_pin_outlined,
                        size: 75,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      " ${comments[index]['child'][indexChild]['username']}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    comments[index]['child'][indexChild]['username'] ==
                            ownerUser
                        ? const Text(
                            " OP",
                            style: TextStyle(color: Colors.blue),
                          )
                        : const Text(""),
                    Text(" ${comments[index]['child'][indexChild]['time']}"),
                  ],
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  comments[index]['child'][indexChild]['comment'],
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return Positioned(
                                  bottom: 0,
                                  child: buildBottomDrawer(
                                      context, index, indexChild),
                                );
                              });

                          bottomDrawer_controller.open();
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )),
                    const Text("0"),
                    TextButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.reply,
                          color: Colors.white,
                        )),
                    vote(false, index, indexChild),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  commentBox() {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                controller: comment_controller,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Type a comment',
                  filled: true,
                  fillColor: const Color.fromRGBO(41, 41, 41, 0.867),
                  contentPadding: const EdgeInsets.only(
                      left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                comments.add({
                  "username": activeUser,
                  "avatar": "",
                  "time": "00.00",
                  "comment": comment_controller.text,
                  "vot": 0,
                  "replay": false,
                  "child": [],
                });
                comment_controller.clear();
                setState(() {});
                _scrollToBottom();
              },
              child: const Icon(Icons.send))
        ],
      ),
    );
  }

  commentBoxReplay(int index) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                controller: commentChild_controller,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Type a comment',
                  filled: true,
                  fillColor: const Color.fromRGBO(41, 41, 41, 0.867),
                  contentPadding: const EdgeInsets.only(
                      left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                comments[index]['child'].add({
                  "username": activeUser,
                  "avatar": "",
                  "time": "00.00",
                  "comment": commentChild_controller.text,
                  "vot": 0,
                  "replay": false,
                });
                commentChild_controller.clear();
                comments[index]['replay'] = false;
                setState(() {});
              },
              child: const Icon(Icons.send))
        ],
      ),
    );
  }

  /// return a bottom drawer widget.
  Widget buildBottomDrawer(BuildContext context, int index, int indexChild) {
    return BottomDrawer(
      /// your customized drawer header.
      header: Column(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Share",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Stop reply notifications",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.copy,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Copy text",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.close_fullscreen_outlined,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Collapse thread",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Edit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
                        title: const Text(
                          'Are you sure?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        content: const Text(
                          'You cannot restore comments that have been deleted',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        actions: [
                          Row(
                            children: [
                              TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                  onPressed: () {
                                    Navigator.pop(context);

                                    indexChild == -1
                                        ? comments.removeAt(index)
                                        : comments[index]['child']
                                            .removeAt(indexChild);
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontSize: 16,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    'CANCEL',
                                    style: TextStyle(
                                      color: Colors.white,
                                      //fontSize: 16,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Delete",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: TextButton(
            onPressed: () {
              bottomDrawer_controller.close();
              Navigator.pop(context);
              setState(() {});
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  " Close",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),

      /// your customized drawer body.
      body: Container(),

      /// your customized drawer header height.
      headerHeight: 550,

      /// your customized drawer body height.
      drawerHeight: 550,

      /// drawer background color.
      color: const Color.fromRGBO(41, 41, 41, 1),
      // color: Colors.black,

      /// drawer controller.
      controller: bottomDrawer_controller,
    );
  }
}
