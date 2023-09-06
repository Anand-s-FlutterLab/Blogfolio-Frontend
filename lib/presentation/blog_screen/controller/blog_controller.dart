import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/blog_screen/model/blog_model.dart';

class BlogController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController readTimeController = TextEditingController();

  late BlogModel blogModel;
  RxString profileURL = "".obs;
  RxInt currentSelectedBlog = 0.obs;
  RxBool isAddBlogPressed = false.obs;
  RxBool initialLoad = false.obs;

  final ImagePicker _picker = ImagePicker();
  Rx<File?> profileImage = Rx<File?>(null);

  @override
  void onReady() {
    super.onReady();
    getBlogs();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
    readTimeController.dispose();
  }

  Future<void> getBlogs() async {
    try {
      initialLoad.value = true;
      dio.Response responce = await dio.Dio().get(
        "$baseUrl/blogs",
        options: dio.Options(
          headers: {"Authorization": token},
        ),
      );
      blogModel = BlogModel.fromJson(responce.data);
    } catch (e) {
      print(e);
    } finally {
      initialLoad.value = false;
    }
  }

  Future<void> addBlogs() async {
    try {
      isAddBlogPressed.value = true;

      if (profileImage.value != null) {
        profileURL.value = await uploadImage();
      }

      dio.Response responce = await dio.Dio().post(
        "$baseUrl/blogs",
        data: {
          "data": {
            "title": titleController.text,
            "content": contentController.text,
            "author": userName.value,
            "imageUrl": profileURL,
            "authorID": userID.value,
            "readMin": readTimeController.text,
            "userProfileUrl": defaultProfileImage
          }
        },
        options: dio.Options(
          headers: {"Authorization": token},
        ),
      );
      customSnackBar("Success", "Blog Added", "green");
    } catch (e) {
      print(e);
    } finally {
      isAddBlogPressed.value = false;
      titleController.clear();
      contentController.clear();
      readTimeController.clear();
      profileURL.value = "";
    }
  }

  Future<void> editBlog(int id) async {
    try {
      isAddBlogPressed.value = true;

      if (profileImage.value != null) {
        profileURL.value = await uploadImage();
      }
      dio.Response responce = await dio.Dio().put(
        "$baseUrl/blogs/$id",
        data: {
          "data": {
            "title": titleController.text,
            "content": contentController.text,
            "imageUrl": profileURL.value,
            "readMin": readTimeController.text,
            "userProfileUrl": defaultProfileImage
          }
        },
        options: dio.Options(
          headers: {"Authorization": token},
        ),
      );
      Get.back();
      customSnackBar("Success", "Blog Edited Successfully", "green");
      getBlogs();
    } catch (e) {
      print(e);
    } finally {
      isAddBlogPressed.value = false;
      titleController.clear();
      contentController.clear();
      readTimeController.clear();
      profileURL.value = "";
    }
  }

  Future<void> deleteBlog(int id) async {
    try {
      dio.Response responce = await dio.Dio().delete(
        "$baseUrl/blogs/$id",
        options: dio.Options(
          headers: {"Authorization": token},
        ),
      );
      customSnackBar("Success", "Blog Deleted Successfully", "green");
      getBlogs();
    } catch (e) {
      print(e);
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
      var random = Random.secure();
      var values = List<int>.generate(20, (i) => random.nextInt(255));
      String imageName = base64UrlEncode(values);

      final String imagePath =
          '$collectionUsers/${userID.value}/$imageName.jpg';

      UploadTask uploadTask = storage.ref().child(imagePath).putFile(image!);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      final String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print(e);
      return "";
    }
  }

  void onEdit() {
    titleController.text =
        blogModel.data[currentSelectedBlog.value].attributes.title;
    contentController.text =
        blogModel.data[currentSelectedBlog.value].attributes.content;
    readTimeController.text =
        blogModel.data[currentSelectedBlog.value].attributes.readMin.toString();
    profileURL.value =
        blogModel.data[currentSelectedBlog.value].attributes.imageUrl;
  }
}
