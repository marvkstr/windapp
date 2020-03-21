import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker/image_picker.dart';
import 'package:windfarmville/comp/menu.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/config/strings.dart';

class ChatScreen extends StatefulWidget {
  final FirebaseUser user;

  ChatScreen({Key key, @required this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    //add information here what happens if Notification got clicked
  }

  showNotification(String title, String body) async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel Name', 'CHANNEL DESCRIPTION');
    var iOS = new IOSNotificationDetails();
    var notificationDetails = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'text': messageController.text,
        'from': widget.user.email,
        'time': DateTime.now(),
      });
      messageController.clear();
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.easeOut, duration: Duration(milliseconds: 300));
    }
  }

  Future getImage() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child(imageFile.toString())
        .child("image.jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);

    String url = await (await uploadTask.onComplete).ref.getDownloadURL();

    await _firestore.collection('messages').add({
      'text': '',
      'from': widget.user.email,
      'time': DateTime.now(),
      'picture': url
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar().setAppBar(Strings.CHAT),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('messages').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data.documents.length <= 0) {
                          return const Center(
                            child: Text(
                              "Not Available",
                              style: Config.GREY_HIND_LIGHT_30,
                            ),
                          );
                        } else {
                          List<DocumentSnapshot> docs = snapshot.data.documents;
                          docs.sort((a, b) => a.data['time'].compareTo(
                              b.data['time'])); //Sortiert Nachrichten nach Zeit
                          //creates Notification for last Message from opponend
                          if (widget.user.email != docs.last.data['from']) {
                            String titleNotification =
                                Strings.NEW_MESSAGE_FROM + docs.last.data['from'];
                            String bodyNotification = docs.last.data['text'];
                            //showNotification(titleNotification, bodyNotification);
                          }
                          List<Widget> messages = docs
                              .map((doc) => Message(
                              from: doc.data['from'],
                              text: doc.data['text'],
                              picture: doc.data['picture'],
                              time: doc.data['time'],
                              me: widget.user.email == doc.data['from']))
                              .toList();

                          return ListView(
                            controller: scrollController,
                            children: <Widget>[
                              ...messages,
                            ],
                          );
                        }
                      },
                    )),
                Container(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Flexible(
                        child: TextField(
                          onSubmitted: (value) => callback(),
                          decoration: InputDecoration(
                              labelStyle: Config.GREY_HIND_LIGHT_14,
                              hintStyle: Config.GREY_HIND_LIGHT_8,
                              border: OutlineInputBorder(),
                              labelText: Strings.MESSAGE,
                              focusColor: Config.MAIN_COLOR),
                          controller: messageController,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.photo_album),
                        color: Config.MAIN_COLOR,
                        onPressed: () {
                          getImage();
                        },
                      ),
                      SendButton(
                        icon: Icon(Icons.send),
                        callback: callback,
                      )
                    ],
                  ),
                ) // creates InputBar
              ],
            )));
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;
  final String picture;
  final Timestamp time;
  final bool me;

  const Message(
      {Key key, this.from, this.text, this.picture, this.time, this.me})
      : super(key: key);

  getContent() {
    var content;
    if (picture == "" || picture == null) {
      content = Text(text,
          style: TextStyle(
              color: me ? Config.BACKGROUND_COLOR : Config.MAIN_COLOR,
              fontSize: 18,
              fontFamily: 'Hind',
              fontWeight: FontWeight.w600));
    } else {
      content = Image.network(picture);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
        me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(13, 5, 13, 0), child: Text(from)),
          Container(
            padding: EdgeInsets.fromLTRB(10, 1, 10, 0),
            child: Material(
                color: me ? Config.MAIN_COLOR : Config.BACKGROUND_COLOR,
                borderRadius: BorderRadius.circular(10.0),
                elevation: 6.0,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                  child: getContent(),
                )),
          )
        ],
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback callback;

  const SendButton({Key key, this.icon, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: callback, icon: icon, color: Config.MAIN_COLOR);
  }
}
