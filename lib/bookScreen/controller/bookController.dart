import 'package:get/get.dart';
import '../model/bookPageModel.dart';

class BookController extends GetxController {

  // ✅ এখন local assets দিয়ে কাজ করছে
  // Backend ready হলে fetchPages() call করলেই হবে
  final RxList<BookPage> pages = <BookPage>[
    BookPage(imageAsset: 'assets/images/onboarding_02.webp'),
    BookPage(imageAsset: 'assets/images/pic_one.webp'),
    BookPage(imageAsset: 'assets/images/pic_three.webp'),
    BookPage(imageAsset: 'assets/images/pic_two.webp'),
    BookPage(imageAsset: 'assets/images/program_img.png'),
    BookPage(imageAsset: 'assets/images/rider_intro_image.webp'),
    BookPage(imageAsset: 'assets/images/book_page_7.png'),
    BookPage(imageAsset: 'assets/images/book_page_8.png'),
    BookPage(imageAsset: 'assets/images/book_page_9.png'),
    BookPage(imageAsset: 'assets/images/book_page_10.png'),
  ].obs;

  final RxInt currentIndex = 0.obs;
  final RxBool isFlipping = false.obs;
  final RxBool isFlippingForward = true.obs; // true = right→left, false = left→right

  int get totalPages => pages.length;

  bool get canGoNext => currentIndex.value < totalPages - 1;
  bool get canGoPrev => currentIndex.value > 0;

  void goNext() {
    if (!canGoNext || isFlipping.value) return;
    isFlippingForward.value = true;
    isFlipping.value = true;
  }

  void goNextComplete() {
    if (canGoNext) currentIndex.value++;
    isFlipping.value = false;
  }

  void goPrev() {
    if (!canGoPrev || isFlipping.value) return;
    isFlippingForward.value = false;
    isFlipping.value = true;
  }

  void goPrevComplete() {
    if (canGoPrev) currentIndex.value--;
    isFlipping.value = false;
  }

// ✅ Backend থেকে data আনার জন্য — এখন comment করা আছে
// Future<void> fetchPages() async {
//   try {
//     final response = await http.get(Uri.parse('YOUR_API_URL/book/pages'));
//     if (response.statusCode == 200) {
//       final List data = jsonDecode(response.body);
//       pages.value = data.map((e) => BookPage.fromJson(e)).toList();
//     }
//   } catch (e) {
//     print('Error fetching pages: $e');
//   }
// }
}