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

  late PortfolioModel portfolioModel;
  RxBool isEditProfilePressed = false.obs;
  RxBool initialLoad = false.obs;
  RxMap<String, RxList<String>> portfolio = <String, RxList<String>>{
    "project": <String>[].obs,
    "skill": <String>[].obs,
    "achievement": <String>[].obs,
  }.obs;

  final ImagePicker _picker = ImagePicker();
  Rx<File?> profileImage = Rx<File?>(null);

  final Stream<QuerySnapshot> portfolios =
      FirebaseFirestore.instance.collection(collectionUsers).snapshots();

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
      portfolio[key]?.add(data);
    } else {
      portfolio[key] = [data].obs;
    }
    addDataController.clear();
  }

  Future<void> getUserProfile() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection(collectionUsers)
          .doc(userID.value)
          .get();
      final data = snapshot.data() as Map<String, dynamic>;
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
    isEditProfilePressed.value = true;
    if (profileImage.value != null) {
      userProfileURL.value = await uploadImage();
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
      await productDoc.set(portfolioModel.toJson());
      customSnackBar("Success", "Portfolio Successfully Updated", "green");
      await writeStorage(storageMobile, mobileController.text);
      await writeStorage(storageUserProfileURL, userProfileURL.value);
    } catch (error) {
      handleFirebaseError(error);
    } finally {
      isEditProfilePressed.value = false;
    }
  }

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage.value = File(pickedImage.path);
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
      return imageUrl;
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<void> onLogout() async {
    try {
      FirebaseAuth.instance.signOut();
      selectedBottomNavigationIndex = 0;
      Get.offAllNamed(AppRoutes.loginScreen);
    } catch (error) {
      handleFirebaseError(error);
    }
  }
}
