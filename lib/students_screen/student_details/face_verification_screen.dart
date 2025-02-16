import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/main.dart';
import 'package:his_quiz/widgets/common_dialog.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class FaceVerificationScreen extends StatefulWidget {
  const FaceVerificationScreen({super.key});

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  // double _getCameraScale() {
  //   final size = MediaQuery.of(context).size;
  //   final deviceRatio = size.width / 250;
  //   final xScale = _controller.value.aspectRatio / deviceRatio;
  //   return xScale;
  // }

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras.firstWhere(
    (camera) => camera.lensDirection == CameraLensDirection.front,
    orElse: () => cameras.first, // Fallback to first camera if front not found
  ),
      ResolutionPreset.medium,
      enableAudio: false,
    );
    _initializeControllerFuture = _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      await _controller.initialize();
      // Set portrait orientation
      await _controller.lockCaptureOrientation(DeviceOrientation.landscapeLeft);
      if (mounted) setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    // Back Button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                    ),

                    // Centered Title
                    Center(
                      child: Text(
                        "Face Verification",
                        textAlign: TextAlign.center,
                        style: CommonTextStyle.regular600.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24
              ),
              child: Column(
                children: [
                  FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        // height: 300,
                        constraints: new BoxConstraints(
                          minHeight: 180.0,
                          maxHeight: 500.0,
                        ),
                        child: DottedBorder(
                          color: CommonColors.primary,
                          strokeWidth: 2,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(15),
                          padding: EdgeInsets.all(8),
                          dashPattern: const [
                            15,
                            15,
                          ],
                          child: CameraPreview(_controller)
                        ),
                      );
                }
                return CircularProgressIndicator();
                    }
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: Get.height * 0.1,
                      left: 12,
                      right: 12,
                    ),
                    child: CommonButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagePath.faceScan,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                              "Verify Face",
                              style: CommonTextStyle.bold.copyWith(
                                fontSize: 16,
                                color: CommonColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Get.dialog(
                          const VerifyFaceDialog(),
                          // const VerificationFaliedStudentDialog(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}