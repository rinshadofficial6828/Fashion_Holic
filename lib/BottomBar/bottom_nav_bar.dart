import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Home/View/home_screen.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:fashion_app/Features/Profile/View/profile_view.dart';
import 'package:fashion_app/Features/wishList/View/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:no_internet_check/internet_connectivity/initialize_internet_checker.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
 
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 5;
   void initState() {
    super.initState();
    InternetChecker();
  }
    // Start a timer to replace shimmer with home screen after 5 seconds
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    // Use HomeShimmerScreen or HomeScreen based on the shouldReplaceShimmer flag
    HomeScreen(),
    Page2(),
    WishListPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return PopScope(
        onPopInvoked: (onPop)  {
            if (_pageController.page?.round() != 0) {
            _pageController.jumpToPage(0);
            _controller.jumpTo(0);
             // Allow exiting the app
          }
        },
        canPop: homeViewModel.initialPage,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  bottomBarPages.length,
                  (index) => bottomBarPages[index],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: (bottomBarPages.length <= maxCount)
                  ? AnimatedNotchBottomBar(
                      notchBottomBarController: _controller,
                      color: Colors.black,
                      showLabel: false,
                      shadowElevation: 5,
                      kBottomRadius: 28.0,
                      notchColor: Kcolors.btnColor,
                      removeMargins: false,
                      bottomBarWidth: 500,
                      durationInMilliSeconds: 300,
                      bottomBarItems: [
                        const BottomBarItem(
                          inActiveItem: Icon(
                            Icons.home_filled,
                            color: Colors.white,
                          ),
                          activeItem: Icon(
                            Icons.home_filled,
                            color: Colors.white,
                          ),
                          itemLabel: 'Page 1',
                        ),
                        const BottomBarItem(
                          inActiveItem: Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.white,
                          ),
                          activeItem: Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.white,
                          ),
                          itemLabel: 'Page 2',
                        ),
                        BottomBarItem(
                          inActiveItem: Icon(Icons.star, color: Colors.white,),
                          activeItem: Icon(Icons.star, color: Colors.white,),
                          itemLabel: 'Page 3',
                        ),
                        const BottomBarItem(
                          inActiveItem: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          activeItem: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          itemLabel: 'Page 4',
                        ),
                      ],
                      onTap: (index) {
                        _pageController.jumpToPage(index);
                        if(index != 0){
                          setState(() {
                            homeViewModel.initialPage = false;
                            print(homeViewModel.initialPage = false);
                          });
                        }
                      },
                      kIconSize: 24.0,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}