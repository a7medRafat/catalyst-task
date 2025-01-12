import 'package:flutter/cupertino.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.color,
    this.function,
    this.height,
    this.width,
    this.child,
    this.borderRadius,
    this.padding,
    this.margin,
    this.border,
    this.shadow,
    this.decorationImage,
    this.clipBehavior,
  });

  final Color? color;
  final double? height;
  final double? width;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final Function()? function;
  final List<BoxShadow>? shadow;
  final DecorationImage? decorationImage;
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        clipBehavior: clipBehavior ?? Clip.none,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            boxShadow: shadow,
            borderRadius: borderRadius,
            border: border,
            color: color,
            image: decorationImage),
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
