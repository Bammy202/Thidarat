import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onlinedb_thidart/addproduct.dart';
import 'package:onlinedb_thidart/showfiltertype.dart';
import 'package:onlinedb_thidart/showproduct.dart';
import 'package:onlinedb_thidart/showproductgrid.dart';
import 'package:onlinedb_thidart/showproducttype.dart';

//Method หลักทีRun
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIVjt9TOxTe7yP5wk8fMwbbE75KODDN8c",
            authDomain: "onlinefirebase-98aa8.firebaseapp.com",
            databaseURL:
                "https://onlinefirebase-98aa8-default-rtdb.firebaseio.com",
            projectId: "onlinefirebase-98aa8",
            storageBucket: "onlinefirebase-98aa8.firebasestorage.app",
            messagingSenderId: "579491492812",
            appId: "1:579491492812:web:ad034012d8fa122cdfa369",
            measurementId: "G-5Q75DSF0N1"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

//Class stateless สั่งแสดงผลหนาจอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 217, 240, 169)),
        useMaterial3: true,
      ),
      home: Main(),
    );
  }
}

//Class stateful เรียกใช้การทํางานแบบโต้ตอบ
class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Main> {
//ส่วนเขียน Code ภาษา dart เพื่อรับค่าจากหน้าจอมาคํานวณหรือมาทําบางอย่างและส่งค่ากลับไป
//ส่วนการออกแบบหน้าจอ
//ส่วนการออกแบบหน้าจอ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังเป็นภาพ
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg1.png'), // ใส่ชื่อไฟล์ภาพพื้นหลัง
                fit: BoxFit.cover,
              ),
            ),
          ),
          // เนื้อหาหลัก
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    height: 300,
                    child: Image.asset('assets/logo.png'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => addproduct()),
                      );
                    },
                    child: Text(
                      'บันทึกสินค้า',
                      style: TextStyle(color: Colors.black), // สีตัวอักษร
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50), // ขนาดปุ่ม
                    ),
                  ),
                  SizedBox(height: 20), // เว้นระยะห่าง
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showproductgrid()),
                      );
                    },
                    child: Text(
                      'แสดงสินค้า',
                      style: TextStyle(color: Colors.black), // สีตัวอักษร
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50), // ขนาดปุ่ม
                    ),
                  ),
                  SizedBox(height: 20), // เว้นระยะห่าง
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showproducttype()),
                      );
                    },
                    child: Text(
                      'ประเภทสินค้า',
                      style: TextStyle(color: Colors.black), // สีตัวอักษร
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50), // ขนาดปุ่ม
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
