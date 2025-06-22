import 'package:get/get.dart';

class MainBottomNavController extends GetxController{
  int _currentIndex = 0;
  int get selectedIndex => _currentIndex;

  void setCurrentIndex(int index){
    if(index == _currentIndex) return;
    _currentIndex = index;
    update();
  }
  void moveToCategory(){
    _currentIndex = 1;
    update();
  }
  void backToHome(){
    _currentIndex = 0;
    update();
  }
}