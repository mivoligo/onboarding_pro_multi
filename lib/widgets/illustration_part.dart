import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/step_model.dart';

class IllustrationPart extends StatelessWidget {
  const IllustrationPart({
    required this.pageController,
    required this.onPageChanged,
    required this.currentPage,
    required this.stepsList,
    super.key,
  });

  final PageController? pageController;
  final Function(int)? onPageChanged;
  final int currentPage;
  final List<SingleStep> stepsList;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: AlignmentTween(
        begin: stepsList[currentPage].backgroundGradientAlignment,
        end: stepsList[currentPage].backgroundGradientAlignment,
      ),
      duration: const Duration(milliseconds: 400),
      builder: (context, value, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.white38,
                const Color(backgroundColor).withAlpha(100),
              ],
              center: value,
              radius: 0.4,
            ),
          ),
          child: child,
        );
      },
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: 6,
        clipBehavior: Clip.hardEdge,
        itemBuilder: (context, index) {
          return SinglePage(
            progress: index,
            lineImage: stepsList[index].lineImage,
            foregroundImage: stepsList[index].foregroundImage,
            backgroundImage: stepsList[index].backgroundImage,
          );
        },
      ),
    );
  }
}

class SinglePage extends StatefulWidget {
  const SinglePage({
    required this.progress,
    required this.foregroundImage,
    required this.backgroundImage,
    this.lineImage,
    super.key,
  });

  final int progress;
  final String? lineImage;
  final String foregroundImage;
  final String backgroundImage;

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  static const decors = [
    'cloud-big.png',
    'cloud-small.png',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            if (widget.lineImage != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/${widget.lineImage}',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
            ...decors.indexed.map(
              (e) {
                return SingleDecorAnimatedWidget(
                  listenable: _animationController,
                  index: e.$1,
                  child: Image.asset('assets/images/decoration/${e.$2}'),
                );
              },
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: -constraints.maxWidth,
                end: 0,
              ),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/${widget.backgroundImage}'),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: constraints.maxWidth,
                end: 0,
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/${widget.foregroundImage}'),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SingleDecorAnimatedWidget extends AnimatedWidget {
  SingleDecorAnimatedWidget({
    required this.child,
    required int index,
    required super.listenable,
    super.key,
  }) : scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: listenable as Animation<double>,
            curve: Interval(
              0.5 * index,
              0.5 + 0.1 * index,
              curve: Curves.ease,
            ),
          ),
        );

  final Widget child;
  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleAnimation.value,
      alignment: Alignment.center,
      child: child,
    );
  }
}
