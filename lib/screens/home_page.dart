import 'package:ai_chat_room/screens/ai_chat_room_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController fourDigitController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image selected: ${pickedFile.path}")),
      );
    }
  }

  Future<void> recordVideo() async {
    XFile? videoFile = await _picker.pickVideo(source: ImageSource.camera);
    if (videoFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Video recorded: ${videoFile.path}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/back_ground.jpg", fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: pickImage,
                      child: const Text(
                        "Upload from Gallery",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: recordVideo,
                      child: const Text(
                        "Record Video",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 51),
                Lottie.asset("assets/animation/home_page_ai_anime.json", height: 250, width: 250),
                const SizedBox(height: 11),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Enter 4-digit code"),
                          content: TextField(
                            controller: fourDigitController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: const InputDecoration(counterText: ""),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                if (fourDigitController.text.length == 4) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => AiChatRoomPage()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Enter a valid 4-digit code")),
                                  );
                                }
                              },
                              child: const Text("Submit"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(21),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/back_ground.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Enter AI Chat Room",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
