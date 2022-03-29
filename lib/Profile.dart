class Profile
{

String surname;
String name;
int age;
bool gender;
double height;
String secret;
List <String> hobbies;
String favoriteLang;

Profile ({
  this.surname = "",
  this.name = "",
  this.age =10,
  this.gender = true,
  this.height = 0,
  this.secret= "",
  this.hobbies = const [],
  this. favoriteLang = "Dart"
});

  String getSurname() {
    return this.surname;
  }

  String getNom() {
    return this.name;
  }

  String getName() => this.surname + " "  + this.name;
  String getAge() {
    String ageString = "Age: $age an";
    if (age>1) {
      ageString += "s";
    }
    return ageString;
  }

 int setAge(newAge) {
    this.age = newAge;
    return this.age;
  }


  String getGender() => (gender)? "Féminin" : "Masculin";
  bool setGender() => gender =! gender;

  String getHeight() {
    int heightToInt = height.toInt();
    return "Taille : $heightToInt cm";
  }

  double setHeight(newValue){
    this.height = newValue;
    return this.height;
  }


  String getSecret() => (secret=="")? "Tu n'as pas de secret ? " : secret;

  String setSecret(newSecret) {
    this.secret = newSecret;
    return this.secret;
  }

  String getHobbies() {

    String myHobbies = "Je n'ai pas encore de  Hobby ";
    if (hobbies.length >0) {
      myHobbies = "My hobbies : ";
        hobbies.forEach((hobby) {
        myHobbies += hobby + ", ";
      });

    }
    return myHobbies;
  }

  String getFavoriteLang() => "Language Favoris: $favoriteLang";



}