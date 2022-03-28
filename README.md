# exercice_widgets_interactifs

This project is the follow-up to a course on Flutter in order to learn how to make some Android and IOS applications

I follow the course and i do some exercices to improve myself

## Class Profile

This file is the class of the User Profile object. 

I modified an ambiguous part of the course by a better definition of getters and setters. this allowed me to use these getters/setters directly in the main.dart functions. It felt fairer to me as an object language.
I modified the updateUser() function in main.dart to use getters and setters without redefining the user profile object.

for example :
```dart
  (secret.text != myProfile.getSecret()) ? myProfile.setSecret(secret.text) : myProfile.getSecret();
```

## the interactive widgets

in this part, i learn how to use this following widgets :

- ElevatedButton
- TextField (String and int with int.parse())
- Switch
- Slider
- Checkboxes
- Radio

