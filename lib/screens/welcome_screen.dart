import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../components/welcome_component.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {

  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: const <Widget>[
            WelcomeComponent(
              color: Color(0xFF25a978),
              lottie: 'welcome.json',
              title: 'Welcome to TapAndGo!',
              subtitle: 'Your Fast, Secure, and Reliable Mobile POS Solution',
              isLast: false,
            ),
            WelcomeComponent(
              color: Color(0xFF5bc4e2),
              lottie: 'welcome.json',
              title: 'Effortless Payments, Every Time!',
              subtitle: 'Process Transactions Quickly with Just a Tap—No Hassles, No Delays!',
              isLast: false,
            ),
            WelcomeComponent(
              color: Color(0xFF3561a8),
              lottie: 'welcome.json',
              title: 'Track Sales in Real-Time!',
              subtitle: 'Stay on Top of Your Business with Instant Transaction Updates!',
              isLast: false,
            ),
            WelcomeComponent(
              color: Color(0xFFe04661),
              lottie: 'welcome.json',
              title: 'Secure Transactions at Your Fingertips',
              subtitle: 'Experience Peace of Mind with Advanced Security Features Built Into Every Transaction!',
              isLast: false,
            ),
            WelcomeComponent(
              color: Color(0xFFf58435),
              lottie: 'welcome.json',
              title: 'Designed for Your Business Needs',
              subtitle: 'Customizable Solutions to Help You Grow and Manage Payments Easily!',
              isLast: false,
            ),
            WelcomeComponent(
              color: Color(0xFFffba3b),
              lottie: 'welcome.json',
              title: 'Get Started with TapAndGo Today!',
              subtitle: 'Boost Your Efficiency and Enhance Customer Satisfaction Effortlessly with TapAndGo!',
              isLast: true,
            ),
          ],
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          isOnDesktopAndWeb: _isOnDesktopAndWeb,
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return true;
    }
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              color: Color(0xFFFFFFFF),
              size: 32.0,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            color: Colors.transparent,
            selectedColor: const Color(0xFFFFFFFF)
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 5) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              color: Color(0xFFFFFFFF),
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}