import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Shared/Styles/Colors.dart';

import '../../Shared/Components/components.dart';
import '../LogIn/logIn_screen.dart';

class OnBoardingModel {
  String image;
  String title;
  String body;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}


class OnboardingScreen extends StatefulWidget {

   OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController onBoardingController = PageController();

   final List <OnBoardingModel> onBoarding = [
    OnBoardingModel(
      image: 'assets/images/1.jpg',
      title: 'Welcome',
      body: ' Hello, welcome to our app',
    ),
    OnBoardingModel(
      image: 'assets/images/2.jpg',
      title: 'Easy shopping',
      body: 'The shop app is real-time buying and selling',
    ),
    OnBoardingModel(
      image: 'assets/images/3.jpg',
      title: 'Online shopping',
      body: 'The shop app is all about online shopping',
    ),
  ];
   bool isLast = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          appBarActionButton ( context, LoginScreen())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                  controller: onBoardingController,
                    itemBuilder: (context, index) => buildOnBoardingItem(onBoarding[index]),
                    itemCount: onBoarding.length,
                  onPageChanged: (int index){
                    if(index == onBoarding.length - 1){
                      setState(() {
                        isLast = true;
                      });
                    }else{
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
            ),
            SizedBox(height: 100,),
            Row(
              children: [
                onBoardingIndicator(onBoardingController, onBoarding.length),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(isLast){
                        navigatePush(context, LoginScreen());
                      }else{
                      onBoardingController.nextPage(duration: Duration(
                            milliseconds: 750,
                          ), curve: Curves.fastLinearToSlowEaseIn,);
                      }
                    },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



