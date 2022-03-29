import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:exercice_widgets_interactifs/Profile.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget
{

  @override
    ProfilePageState createState() => ProfilePageState();


}

class ProfilePageState extends State<ProfilePage>
{

  bool gender = true;

  Profile myProfile = Profile(surname: "Olivier", name: "Lartillot");
  late TextEditingController surname;
  late TextEditingController name;
  late TextEditingController secret;
  late TextEditingController age;

  ImagePicker picker = ImagePicker();
  File? imageFile;
  bool showSecret = false;
  Map<String, bool> listHobbies = {
    "Pétanque": false,
    "Football": false,
    "Rugby": false,
    "Code": false,
    "Manga": false,
  };
  List <String> preferredLanguage = ["Dart","Php","Python","Javascript","Swift",];
  int groupValue = 1;

  @override
  void initState() {

    surname = TextEditingController();
    name = TextEditingController();
    secret = TextEditingController();
    age = TextEditingController();
    surname.text = myProfile.surname;
    name.text = myProfile.name;


    super.initState();
  }

  @override
  void dispose() {
    surname.dispose();
    name.dispose();
    secret.dispose();
    age.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

          appBar: AppBar(
              title: const Text("Easy Sports Tests"),
              centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                children: [
                    Card(
                        color: Colors.deepPurpleAccent.shade100,
                        elevation: 10,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8),

                        child: Column(

                          children: [
                            Text(myProfile.getName()),

                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20, bottom:20),
                                      padding: EdgeInsets.all(4),
                                      decoration : BoxDecoration(
                                        color: Colors.black,
                                      border: Border.all(
                                      color: Colors.black,
                                        width: 1,
                                      ),
                                       borderRadius: BorderRadius.circular(8),
                                     ),

                                      child: (imageFile==null)? Text("Aucune image") : Image.file(imageFile!, height: MediaQuery.of(context).size.width / 4,),
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(myProfile.getAge()),
                                    Text(myProfile.getHeight()),
                                    Text("Genre : ${myProfile.getGender()}"),

                                  ],
                                ),
                              ],
                            ),

                            Text(myProfile.getHobbies()),
                            Text(myProfile.getFavoriteLang()),
                            ElevatedButton(
                                onPressed: revealSecret,
                                child: Text(
                                    (showSecret)? "Masquer mon secret" :"Révéler le secret ...",
                            )),
                            Text ((showSecret) ? (myProfile.getSecret()) : ""),
  

                          ],
                        ),
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (() =>
                        pickImage(source: ImageSource.camera)
                      ), icon: Icon(Icons.camera_enhance, color: Colors.deepPurple,)),
                      IconButton(onPressed: (() =>
                          pickImage(source: ImageSource.gallery)
                      ), icon: Icon(Icons.photo_album, color: Colors.deepPurple))
                    ],
                  ),
                  Divider(color: Colors.deepPurpleAccent, thickness: 2,),

                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Modifier vos Infos ici : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      ),
                      myTextField(
                          controller: surname,
                          hint: "Entre ton prénom"
                      ),
                      myTextField(
                          controller: name,
                          hint: "Entre ton nom"

                      ),

                      TextField(
                        controller: age,
                        decoration: InputDecoration(hintText: "Entre Ton Age",),
                        keyboardType: TextInputType.number,
                        onSubmitted: ((newValue) {
                          setState(() {
                            updateUser();
                          });
                        }
                      )),


                      myTextField(
                          controller: secret,
                          hint: "Entre ton secret",
                          isSecret: true

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Genre : ${myProfile.getGender()}"),
                          Switch(value: myProfile.gender,
                              onChanged: ((newBool) {
                                setState(() {
                                  myProfile.setGender();
                                });
                              })
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(myProfile.getHeight()),
                          Expanded(
                            child: Slider(value: myProfile.height,
                                            min: 0,
                                            max: 210,
                                            onChanged: ((newValue) {
                                              setState(() {
                                                myProfile.setHeight(newValue);
                                              });
                              })
                          ),

                          )

                        ],
                      ),
                      Divider(color: Colors.deepPurpleAccent, thickness: 2,),
                      myHobbies(),
                      Divider(color: Colors.deepPurpleAccent, thickness: 2,),
                      myRadios(),
                      
                      
                      
                      
                    ],
                  ),


                   ),






                ]





              )



          )



    );

  }

  TextField myTextField ({required TextEditingController controller, required  String hint,bool isSecret = false}) {
    return TextField (
      controller: controller,
      decoration: InputDecoration(hintText: hint),
      obscureText: isSecret,
      onSubmitted: ((newData) {
        updateUser();
      }) ,

    );
  }

  void updateUser() {

    setState(() {

      (surname.text != myProfile.getSurname()) ? surname.text : myProfile.getSurname();
      (name.text != myProfile.getNom()) ? name.text : myProfile.getNom();
      (secret.text != myProfile.getSecret()) ? myProfile.setSecret(secret.text) : myProfile.getSecret();
      (age.text != myProfile.getAge()) ? myProfile.setAge(int.parse(age.text)) : myProfile.getAge();

    });


  }

  bool revealSecret () {
      setState(() {
        showSecret =! showSecret;
      });
     return showSecret;
  }

Column myHobbies () {
    // liste vide qui servira a enregistrer mes hobbies
    List<String> myHobbiesList = [];
    // liste vide qui servira a enregistrer les lignes
    List <Widget> myListOfRows = [];

    listHobbies.forEach((hobby, hobbyBool) {
        Row r = Row (
           mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(hobby),
            Checkbox(
              value: hobbyBool,
              onChanged: (newHobbyBool) {
                setState(() {
                  listHobbies[hobby] = newHobbyBool ?? false;
                  listHobbies.forEach((hobby, value) {
                    if (value== true) { myHobbiesList.add(hobby); }
                  });


                });
                myProfile.hobbies = myHobbiesList;
              })

          ]
        );
        myListOfRows.add(r);
      });

      return Column (children: myListOfRows);
  }

  Row myRadios() {

    List<Widget> radiosList = [];

    int index = preferredLanguage.indexWhere((element) => element.startsWith(myProfile.favoriteLang));
            for (var i=0; i<preferredLanguage.length; i++) {

              Column c =  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(preferredLanguage[i]),
                      Radio(
                          value: i,
                          groupValue: index,
                          onChanged:((newValue) {
                            setState(() {
                              myProfile.favoriteLang = preferredLanguage[newValue as int]; //newValue as int ;
                            });
                          })),
                    ]
              );

              radiosList.add(c);
            }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: radiosList,);

  }
  /*
  * function to get the pick Image
  */
  Future pickImage({required ImageSource source}) async {
    final XFile? chosenImage = await picker.pickImage(source: source);
    setState(() {
      if (chosenImage == null) {
        print("Nous n avons pas pu récupéré d image");
      }
      else {
        imageFile = File(chosenImage.path);
      }
    });
  }


}