part of 'widgets.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: context.theme.scaffoldBackgroundColor,
          highlightColor: const Color(0xFFF3F3F3),
          child: Card(
            color: Colors.grey[600],
          ),
        );
      },
    );
  }
}
