import 'package:delivery_app/size_config.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/pages/onboarding/on_boarding_content.dart';
import 'package:delivery_app/src/widgets/main_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  List<Map<String, String>> onboardingData = [
    {
      "title": "Get a date",
      "description": "Swipe right to get a match \nwith people you like from your area.",
      "image": "assets/images/onboarding_1.svg",
    },
    {
      "title": "Private Messages",
      "description":
      "Chat privately with people you match.",
      "image": "assets/images/onboarding_2.svg",
    },
    {
      "title": "Live dating",
      "description": "Have fun with your matches by \ndating in romantic places .",
      "image": "assets/images/onboarding_3.svg",
    },
  ];

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentPage == index ? PrimaryColor : Color(0xFFD8D8D8),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context,index) => OnboardingContent(
                    title: onboardingData[index]['title'],
                    description: onboardingData[index]['description'],
                    image: onboardingData[index]['image'],
                  )
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    currentPage == onboardingData.length - 1
                    ? MainButton(
                        name: 'Get Started',
                        onPressed: () {
                          Navigator.pushNamed(context, "login_page");
                        }
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OnBoardNavBtn(
                          name: 'Skip',
                          onPressed: () {
                            Navigator.pushNamed(context, "login_page");
                          },
                        ),
                        Row(
                          children: List.generate(onboardingData.length, (index) => dotIndicator(index)),
                        ),
                        OnBoardNavBtn(
                          name: 'Next',
                          onPressed: () {
                            _pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style: TextStyle(
              fontSize: SizeConfig.blockSizeH! * 4.5
          ),
        ),
      ),
    );
  }
}

