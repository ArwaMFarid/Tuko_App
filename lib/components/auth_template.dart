import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_assets.dart';
import 'package:tuko_app/core/app_color.dart';

class AuthTemplate extends StatefulWidget {
  static const String routeName = "AuthTemplate";
  final Widget formContent;

  const AuthTemplate({
    super.key,
    required this.formContent,
  });

  @override
  State<AuthTemplate> createState() => _AuthTemplateState();
}

class _AuthTemplateState extends State<AuthTemplate> {
  final ScrollController _scrollController = ScrollController();
  double currentLogoSize = 150;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        currentLogoSize = (150 - _scrollController.offset).clamp(0.0, 150.0);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.toriiGate2),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                height: screenHeight * .75,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()
                      ),

                      controller: _scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 90,
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                widget.formContent,

                              Image.asset(AppAssets.katana, height: 70),

                              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: (screenHeight * .67) + (75 - (currentLogoSize / 2)),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.black.withAlpha(20),
                      blurRadius: 10,
                      spreadRadius: 6,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                height: currentLogoSize,
                width: currentLogoSize,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10000),
                  child: Image.asset(AppAssets.bird, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
