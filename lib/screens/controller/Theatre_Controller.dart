import 'package:get/get.dart';
import '../model/theatre_model.dart';

class TheatreController extends GetxController {
  final RxInt selectedCategoryIndex = 0.obs;

  final RxList<CategoryModel> categories = <CategoryModel>[
    CategoryModel(name: 'Theatre', backgroundAsset: 'assets/images/background_img.png'),
    CategoryModel(name: 'Sports', backgroundAsset: 'assets/images/background_img.png'),
    CategoryModel(name: 'Music', backgroundAsset: 'assets/images/background_img.png'),
    CategoryModel(name: 'Events', backgroundAsset: 'assets/images/background_img.png'),
    CategoryModel(name: 'Games', backgroundAsset: 'assets/images/background_img.png'),
  ].obs;

  String get currentBackground =>
      categories[selectedCategoryIndex.value].backgroundAsset;

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    currentOffset.value = 0;
  }

  final List<TheatreItem> allItems = [
    TheatreItem(title: 'Until We Shatter 1', description: 'Leadership & Development...', imageAsset: 'assets/images/program_img.png'),
    TheatreItem(title: 'Until We Shatter 2', description: 'A powerful story...', imageAsset: 'assets/images/rider_intro_image.webp'),
    TheatreItem(title: 'Until We Shatter 3', description: 'An epic journey...', imageAsset: 'assets/images/onboarding_01.webp'),
    TheatreItem(title: 'Until We Shatter 4', description: 'A gripping tale...', imageAsset: 'assets/images/pic_two.webp'),
    TheatreItem(title: 'Until We Shatter 5', description: 'The most anticipated...', imageAsset: 'assets/images/onboarding_01.webp'),
    TheatreItem(title: 'Until We Shatter 6', description: 'A heartfelt narrative...', imageAsset: 'assets/images/pic_three.webp'),
    TheatreItem(title: 'Until We Shatter 7', description: 'An unforgettable experience...', imageAsset: 'assets/images/program_img_7.png'),
    TheatreItem(title: 'Until We Shatter 8', description: 'Brilliant storytelling...', imageAsset: 'assets/images/pic_one.webp'),
    TheatreItem(title: 'Until We Shatter 9', description: 'A tour de force...', imageAsset: 'assets/images/rider_intro_image.webp'),
    TheatreItem(title: 'Until We Shatter 10', description: 'The final chapter...', imageAsset: 'assets/images/onboarding_01.webp'),
  ];

  // ✅ শুধু offset track করো, list কখনো modify করো না
  final RxInt currentOffset = 0.obs;

  TheatreItem get leftItem => allItems[currentOffset.value % allItems.length];
  TheatreItem get middleItem => allItems[(currentOffset.value + 1) % allItems.length];
  TheatreItem get rightItem => allItems[(currentOffset.value + 2) % allItems.length];

  void onSwipeLeft() {
    currentOffset.value = (currentOffset.value + 1) % allItems.length;
  }

  void onSwipePrev() {
    currentOffset.value = (currentOffset.value - 1 + allItems.length) % allItems.length;
  }

  void onItemTap(TheatreItem item) {}
}