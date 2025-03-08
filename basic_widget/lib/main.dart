import 'package:basic_widget/home.dart';
import 'package:flutter/material.dart';
import 'constants.dart';


// Dùng _ để giới hạn quyền truy cập trong file (private).

void main() {
  // 1
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {

  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

// Lớp này lưu trữ dữ liệu có thể thay đổi trong suốt vòng đời của widget.
class _YummyState extends State<Yummy> {
  // TODO: Setup default theme
  ThemeMode themeMode = ThemeMode.system;
   // chọn màu nào?
   ColorSelection colorSelected = ColorSelection.pink;

   void changeThemeMode(bool useLightMode){
     setState(() {
       themeMode =  useLightMode
           ? ThemeMode.light //
           : ThemeMode.dark;
     });
   }

  void changeColor(int value) {
    setState(() {
      // 2
      colorSelected = ColorSelection.values[value];
    });
  }

  // TODO: Add changeTheme above here
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';
    // TODO: Setup default theme
    //3
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner

      // TODO: Add theme
      //  Nếu themeMode = ThemeMode.light
    // → Giao diện sáng (theme) được áp dụng.
    // Nếu themeMode = ThemeMode.dark
    // → Giao diện tối (darkTheme) được áp dụng.
    // Nếu themeMode = ThemeMode.system
    // → Giao diện tự động thay đổi theo cài đặt hệ thống.

      // Xác định chế độ theme mà ứng dụng đang sử dụng.
      themeMode: themeMode,
      // Định nghĩa giao diện sáng (Light Mode) của ứng dụng.
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
      ),
    // Định nghĩa giao diện tối (Dark Mode).
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark
      ),

      // TODO: Apply Home widget
      // 4
      home: Home(
        changeColor: changeColor,
        changeTheme: changeThemeMode,
        colorSelected: colorSelected,
      )
    );
  }
}