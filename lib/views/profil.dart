import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:windfarmville/comp/menu.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/config/strings.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  Image profilPicture = Image.asset('assets/images/user.png');
  final  emailController = TextEditingController();
  final  nameController = TextEditingController();
  final passwordController = TextEditingController();
  final telephoneController = TextEditingController();
  final adressController = TextEditingController();

  Future getImage() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        profilPicture = Image.file(imageFile);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (Config.userType == "technician") {
      emailController.text = 'techniker@test.com';
      nameController.text = "Werner Müller";
      passwordController.text = "techniker123";
      telephoneController.text = "040428380";
      adressController.text = "Germany,Schleswig-Holstein,25335,Elmshorn";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: MyDrawer().setDrawer(context),
        appBar: MyAppBar().setAppBar("Profile"),
        resizeToAvoidBottomInset: false,
        body: new Container(
          alignment: Alignment.center,
          color: Config.LIGHT_BLUE,
          child: Column(children: <Widget>[
            //Profilbild
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: profilPicture.image, fit: BoxFit.cover),
                  color: Colors.black12),
              child: IconButton(
                icon: Icon(Icons.person),
                iconSize: 100,
                color: Colors.transparent,
                onPressed: () {
                  getImage();
                },
              ),
            ),

            //Email
            Container(
              padding:
                  EdgeInsets.only(top: 5, left: 40.0, bottom: 5, right: 40.0),
              child: new TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  labelStyle: Config.GREY_HIND_LIGHT_14,
                  labelText: Strings.EMAIL,
                  filled: true,
                  fillColor: Config.BACKGROUND_COLOR,
                  prefixIcon: Icon(Icons.account_box),
                ),
              ),
            ),

            //Name
            Container(
              padding:
                  EdgeInsets.only(top: 5, left: 40.0, bottom: 5, right: 40.0),
              child: new TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  labelStyle: Config.GREY_HIND_LIGHT_14,
                  labelText: Strings.NAME,
                  filled: true,
                  fillColor: Config.BACKGROUND_COLOR,
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),

            //Password
            Container(
              padding:
                  EdgeInsets.only(top: 5, left: 40.0, bottom: 5, right: 40.0),
              child: new TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelStyle: Config.GREY_HIND_LIGHT_14,
                  labelText: Strings.PASSWORD,
                  filled: true,
                  fillColor: Config.BACKGROUND_COLOR,
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
            ),

            //Rufnummer
            Container(
              padding:
                  EdgeInsets.only(top: 5, left: 40.0, bottom: 5, right: 40.0),
              child: new TextField(
                keyboardType: TextInputType.number,
                controller: telephoneController,
                decoration: InputDecoration(
                  labelStyle: Config.GREY_HIND_LIGHT_14,
                  labelText: Strings.TELEPHONE,
                  filled: true,
                  fillColor: Config.BACKGROUND_COLOR,
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),

            //Anschrift
            Container(
              padding:
                  EdgeInsets.only(top: 5, left: 40.0, bottom: 5, right: 40.0),
              child: new TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: adressController,
                decoration: InputDecoration(
                  labelStyle: Config.GREY_HIND_LIGHT_14,
                  labelText: Strings.ADDRESS,
                  filled: true,
                  fillColor: Config.BACKGROUND_COLOR,
                  prefixIcon: Icon(Icons.home),
                ),
              ),
            ),

            //Speichern
            Container(
              padding:
                  EdgeInsets.only(top: 7, left: 70.0, bottom: 2, right: 70.0),
              width: double.infinity,
              height: 60,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Config.BUTTON_COLOR,
                onPressed: () {},
                child:
                    new Text("Save changes", style: Config.WHITE_HIND_BUTTON),
              ),
            ),
          ]),
        ));
  }
}
