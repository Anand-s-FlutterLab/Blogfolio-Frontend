import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/core/network/dio_exception.dart';
import 'package:flutter_frontend/presentation/blog_screen/model/blog_model.dart';

// This is a controller class for managing blog-related functionality.
class BlogController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController readTimeController = TextEditingController();

  late BlogModel blogModel;
  RxString errorText = "".obs;
  RxString profileURL = "".obs;
  RxInt currentSelectedBlog = 0.obs;
  RxBool isAddBlogPressed = false.obs;
  RxBool initialLoad = false.obs;

  final ImagePicker _picker = ImagePicker();
  Rx<File?> profileImage = Rx<File?>(null);

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
    readTimeController.dispose();
    profileImage.close();
  }

  // Fetch a list of blogs from the server.
  Future<void> getBlogs() async {
    try {
      initialLoad.value = true;
      errorText.value = "";
      dio.Response response = await dio.Dio()
          .get(
        "$baseUrl/blogs",
        options: dio.Options(
          headers: {"Authorization": token},
        ),
      )
          .timeout(
        const Duration(seconds: 15),
      );
      blogModel = BlogModel.fromJson(response.data);
    } on dio.DioException catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      customSnackBar("Error", errorMessage);
      errorText.value = errorMessage;
    } catch (e) {
      customSnackBar("Error", "Connection Time Out");
      errorText.value = "Connection Timeout";
    } finally {
      initialLoad.value = false;
    }
  }

  // Add a new blog post.
  Future<void> addBlogs() async {
    try {
      isAddBlogPressed.value = true;

      if (profileImage.value != null) {
        profileURL.value = await uploadImage();
      }

      dio.Response response = await dio.Dio().post(
        "$baseUrl/blogs",
        data: {
          "data": {
            "title": titleController.text,
            "content": contentController.text,
            "author": userName.value,
            "imageUrl": profileURL.isEmpty ? defaultBlogImage : profileURL.value,
            "authorID": userID.value,
            "readMin": readTimeController.text,
            "userProfileUrl": defaultProfileImage
          }
        },
        options: dio.Options(
          headers: {"Authorization": token},
        ),
      );

      getBlogs();
      Get.back();
      customSnackBar("Success", "Blog Added", "green");
    } on dio.DioException catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      customSnackBar("Error", errorMessage);
      errorText.value = errorMessage;
    } catch (e) {
      errorText.value = "Something Went Wrong";
    } finally {
      isAddBlogPressed.value = false;
      titleController.clear();
      contentController.clear();
      readTimeController.clear();
      profileURL.value = "";
      profileImage.value = null;
    }
  }

  // Edit an existing blog post.
  Future<void> editBlog(int id) async {
    try {
      isAddBlogPressed.value = true;

      if (profileImage.value != null) {
        profileURL.value = await uploadImage();
      }
      dio.Response response = await dio.Dio().put(
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
    } on dio.DioException catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      customSnackBar("Error", errorMessage);
      errorText.value = errorMessage;
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

  // Delete a blog post.
  Future<void> deleteBlog(int id) async {
    try {
      dio.Response response = await dio.Dio().delete(
        "$baseUrl/blogs/$id",
        options: dio.Options(
          headers: {"Authorization": token},
        ),
      );
      customSnackBar("Success", "Blog Deleted Successfully", "green");
      getBlogs();
    } on dio.DioException catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      customSnackBar("Error", errorMessage);
      errorText.value = errorMessage;
    } catch (e) {
      print(e);
    }
  }

  // Open an image picker to select a profile image.
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage.value = File(pickedImage.path);
    }
  }

  // Upload an image to Firebase Storage and get its URL.
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
      handleFirebaseError(e);
      return "";
    }
  }

  // Populate form fields for editing a blog post.
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
