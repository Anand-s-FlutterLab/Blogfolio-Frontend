import 'dart:io';

import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/blog_screen/model/home_model.dart';

class BlogController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController readTimeController = TextEditingController();

  RxList<Blog> blogList = <Blog>[].obs;
  RxInt currentSelectedBlog = 0.obs;
  RxBool isAddBlogPressed = false.obs;

  final ImagePicker _picker = ImagePicker();
  Rx<File?> profileImage = Rx<File?>(null);

  Future<void> openImagePicker() async {
    // final XFile? pickedImage =
    // await _picker.pickImage(source: ImageSource.gallery);
    // if (pickedImage != null) {
    //   profileImage.value = File(pickedImage.path);
    // }
  }
  @override
  void onInit() {
    super.onInit();
    addBlog();
  }

  void addBlog() {
    blogList.add(Blog.fromJson({
      "id": 1,
      "title": "Travel Adventures Travel Adventures Travel Adventures",
      "content": """
      My name is Scott Chow, and I am going to show you how to start blogging today. I have been building blogs and websites since 2002. In that time I have launched several of my own blogs, and helped hundreds of others do the same.

I know that starting a blog can seem overwhelming and intimidating. This free guide is all about blogging for beginners, and will teach you how to become a blogger with just the most basic computer skills. So whether you’re 8 or 88, you can create your own blog in 20 minutes.

I am not ashamed to admit that when I was first learning how to build a blog I made a ton of mistakes. You can benefit from more than a decade of my experience so that you don’t repeat these same mistakes when you make your own blog. I created this free guide so that a complete beginner can learn how to blog quickly and easily.

So, just how do you start a blog?

Learn how to create a blog in about 20 minutes following these steps:
      """,
      "author": "user1",
      "publicationDate": "2023-08-15",
      "lastUpdatedDate": "2023-08-15",
      "tags": ["Travel", "Adventure"],
      "imageUrl": "https://example.com/image1.jpg",
      "views": 1000,
      "likes": 500,
      "comments": [
        {"user": "commenter1", "text": "Great post!"},
        {"user": "commenter2", "text": "I wish I could travel like that."},
      ],
      "status": "published",
      "urlSlug": "travel-adventures",
      "featured": true,
    }));
    blogList.add(Blog.fromJson(
      {
        "id": 2,
        "title": "Healthy Living",
        "content": "Tips for a balanced and active lifestyle. "
            "Living a healthy life involves making choices that "
            "benefit your physical, mental, and emotional well-being. "
            "In this blog post, we'll explore various aspects of "
            "health and lifestyle, from maintaining a nutritious diet "
            "to engaging in regular exercise routines. We'll also delve "
            "into the importance of mental health and stress management, "
            "providing you with practical advice on how to lead a healthier "
            "and more fulfilling life. Join us on this journey towards "
            "a happier and more vibrant you!",
        "author": "user2",
        "publicationDate": "2023-08-20",
        "lastUpdatedDate": "2023-08-20",
        "tags": ["Health", "Lifestyle"],
        "imageUrl": "https://example.com/image2.jpg",
        "views": 800,
        "likes": 600,
        "comments": [
          {"user": "commenter3", "text": "These tips are really helpful!"},
          {"user": "commenter4", "text": "I've started following your advice."},
        ],
        "status": "published",
        "urlSlug": "healthy-living",
        "featured": true,
      },
    ));
  }
}
