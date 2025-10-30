**This is to view my 'digital_framework' directly on your browser:**

[Live Demo — Click Here to View the App](https://ekjotkaursault.github.io/digital_framework/)

This is fully responsive web page with pause and resume buttons and 4 images that are being displayed on a rotating cycle and changes after 10 seconds, which works very smoothly.

------------------------------------------

**Code Attribution**
This project was designed and developed by me (Ekjot Kaur) as part of my exploration of Flutter’s web development capabilities.
While the overall structure, logic, and design are original, I referenced a few official and educational resources to understand:

Timer-based image rotation in Flutter

Handling state in StatefulWidget

Connecting AWS S3 images

Responsive layout techniques in Flutter

-----------------------------------------------------------------------------
**External Resources Used** 
that were used for my learning:


**Flutter Image Widget Documentation** https://api.flutter.dev/flutter/widgets/Image-class.html 

Helped me display online images using Image.network() from AWS S3.

**Flutter Timer Class**  https://api.flutter.dev/flutter/dart-async/Timer-class.html

Guided the implementation of automatic image transitions every 10 seconds using Timer.periodic().

**Flutter Layout and Responsiveness Guides**  https://docs.flutter.dev/development/ui/layout

Provided best practices for building responsive UI using MediaQuery, Expanded, and Flexible widgets.

**AWS S3 Documentation**  https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html

Used to upload images to the cloud and retrieve their public URLs.

**Flutter Web Deployment Guide** https://docs.flutter.dev/deployment/web

Helped me deploy the project to GitHub Pages after building it for web.

----------------------------------------------------------------------------------------

**My Original Work Includes:**

1. App concept, design, and structure

2. Integration of AWS S3 images into the Flutter app

3. Timer logic for 10-second image transitions

4. Pause and Resume button logic

5. Custom responsive layout for web and mobile

6. GitHub Pages deployment setup

7. Full documentation including README, folder structure, and run instructions

-----------------------------------
# Digital Framework

A **Flutter-based digital picture frame** application that displays images (stored in AWS Cloud Storage) on a rotating cycle.  
Built for both **mobile** and **web**, this project uses Flutter’s cross-platform capabilities to simulate a sleek and modern digital frame experience.

---

##  Features

- Displays images on a rotating slideshow
- Integrates with AWS cloud storage
- Fully responsive on mobile, tablet, and desktop
- Smooth transitions and clean UI
- Web version hosted via GitHub Pages

----------------------------------------------------------------------------------------------------------

## How to Run Locally?

In Vs Code terminal, run these codes:
git clone https://github.com/ekjotkaursault/digital_framework.git
cd digital_framework
flutter pub get
flutter run

**To build for web:** run this command in terminal:
flutter build web


## 🔧 Tech Stack**
1. Flutter / Dart
2. AWS Cloud Storage (S3)
3. GitHub Pages (Web Deployment)

----------------------------------------------------------------------------------------------------------

**Folder Overview**
lib/          → Main application code  
web/          → Web platform files  
build/web/    → Generated web build  
pubspec.yaml  → Project dependencies  
README.md     → Project documentation  


--------About the Developer-----

**Ekjot Kaur**

Computer Programming Student | Sault College, Toronto Campus

GitHub: https://github.com/ekjotkaursault







