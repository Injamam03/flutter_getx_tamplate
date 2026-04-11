import 'package:get/get.dart';
import '../model/theatre_model.dart';
class TheatreController extends GetxController {
  final RxInt selectedCategoryIndex = 0.obs;

  final RxList<CategoryModel> categories = <CategoryModel>[
    CategoryModel(name: 'Theatre'),
    CategoryModel(name: 'Sports'),
    CategoryModel(name: 'Music'),
    CategoryModel(name: 'Events'),
    CategoryModel(name: 'Games'),
  ].obs;

  final RxList<TheatreItem> items = <TheatreItem>[
    TheatreItem(
      title: 'Until we shatter',
      description:
      'Leadership & Development (L&D) is a strategic, ongoing process aimed at enhancing an individual\'s ability',
      imageAsset: 'assets/images/program_img.png',
    ),
    TheatreItem(
      title: 'Until we shatter',
      description:
      'Leadership & Development (L&D) is a strategic, ongoing process aimed at enhancing an individual\'s ability',
      imageAsset: 'assets/images/program_img.png',
    ),
    TheatreItem(
      title: 'Until we shatter',
      description:
      'Leadership & Development (L&D) is a strategic, ongoing process aimed at enhancing an individual\'s ability',
      imageAsset: 'assets/images/program_img.png',
    ),
  ].obs;

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}