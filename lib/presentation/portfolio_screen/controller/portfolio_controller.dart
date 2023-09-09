import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/portfolio_screen/model/portfolio_model.dart';

class PortfolioController extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addDataController = TextEditingController();

  late PortfolioModel portfolioModel; // Model for portfolio data
  RxBool isEditProfilePressed = false.obs; // Observable to track if the profile is being edited
  RxBool initialLoad = false.obs; // Observable to track the initial loading state
  // RxMap to store different types of portfolio data (projects, skills, achievements)
  RxMap<String, RxList<String>> portfolio = <String, RxList<String>>{
    "project": <String>[].obs,
    "skill": <String>[].obs,
    "achievement": <String>[].obs,
  }.obs;

  final ImagePicker _picker = ImagePicker(); // Image picker for selecting profile image
  Rx<File?> profileImage = Rx<File?>(null); // Observable to store the selected profile image

  final Stream<QuerySnapshot> portfolios = FirebaseFirestore.instance.collection(collectionUsers).snapshots();

  @override
  void dispose() {
    super.dispose();
    mobileController.dispose();
    nameController.dispose();
    emailController.dispose();
    addDataController.dispose();
    profileImage.close();
  }

  void addData(String key, String data) {
    if (portfolio.containsKey(key)) {
      portfolio[key]?.add(data); // Add data to the corresponding portfolio category
    } else {
      portfolio[key] = [data].obs; // Create a new category if it doesn't exist
    }
    addDataController.clear(); // Clear the input field
  }

  Future<void> getUserProfile() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection(collectionUsers)
          .doc(userID.value)
          .get();
      final data = snapshot.data() as Map<String, dynamic>;
      // Retrieve user profile data from Firestore
      userName.value = data["Name"];
      email.value = data["Email Address"];
      mobile.value = data["Mobile"];
      userProfileURL.value = data["Profile URL"].toString().isEmpty
          ? defaultProfileImage
          : data["Profile URL"];
      portfolio['project']?.value =
      data["Projects"] == null ? [] : data['Projects'].cast<String>();
      portfolio['skill']?.value =
      data["Skills"] == null ? [] : data['Skills'].cast<String>();
      portfolio['achievement']?.value = data["Achievements"] == null
          ? []
          : data['Achievements'].cast<String>();
    } catch (error) {
      handleFirebaseError(error);
    }
  }

  Future<void> updateUserProfile() async {
    isEditProfilePressed.value = true; // Set the edit flag to true
    if (profileImage.value != null) {
      userProfileURL.value = await uploadImage(); // Upload and update the user's profile image
    }

    PortfolioModel portfolioModel = PortfolioModel(
      name: nameController.text,
      emailAddress: emailController.text,
      mobile: mobileController.text,
      profileImage: userProfileURL.value,
      achievements: portfolio["achievement"]!,
      projects: portfolio["project"]!,
      skills: portfolio["skill"]!,
    );

    try {
      final DocumentReference productDoc = FirebaseFirestore.instance
          .collection(collectionUsers)
          .doc(userID.value);
      await productDoc.set(portfolioModel.toJson()); // Update the user's portfolio data in Firestore
      customSnackBar("Success", "Portfolio Successfully Updated", "green");
      await writeStorage(storageMobile, mobileController.text); // Update user data in local storage
      await writeStorage(storageUserProfileURL, userProfileURL.value);
    } catch (error) {
      handleFirebaseError(error);
    } finally {
      isEditProfilePressed.value = false; // Reset the edit flag
    }
  }

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage.value = File(pickedImage.path); // Set the selected profile image
    }
  }

  Future<String> uploadImage() async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final File? image = profileImage.value;

      final String imagePath =
          '$collectionUsers/${userID.value}/profileImage.jpg';

      UploadTask uploadTask = storage.ref().child(imagePath).putFile(image!);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      final String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl; // Return the URL of the uploaded image
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<void> onLogout() async {
    try {
      FirebaseAuth.instance.signOut(); // Sign out the user
      selectedBottomNavigationIndex = 0; // Reset the selected bottom navigation index
      Get.offAllNamed(AppRoutes.loginScreen); // Navigate to the login screen
    } catch (error) {
      handleFirebaseError(error);
    }
  }
}
