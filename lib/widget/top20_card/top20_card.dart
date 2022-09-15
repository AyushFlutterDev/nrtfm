import 'package:nrtfm/constant/color.dart';
import 'package:nrtfm/utils/barrel.dart';

class Top20Card extends StatelessWidget {
  final String title;
  final String name;
  final String image;
  final GestureTapCallback? onTap;
  const Top20Card({
    Key? key,
    required this.title,
    required this.name,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Kcolor.transparent,
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 120.w,
              height: 110.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) {
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 32, 32, 32),
                      highlightColor: Colors.white,
                      child: Container(
                        width: 30.w,
                        height: 17.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(4, 4, 4, 0.38),
                        ),
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) =>
                    const Icon(Icons.music_note),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Column(
            children: [
              SizedBox(
                width: 120.w,
                height: 17,
                child: Text(
                  title,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: Kcolor.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 0.1.h,
              ),
              SizedBox(
                width: 120.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Kcolor.txt1,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      name,
                      style: GoogleFonts.roboto(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          color: Kcolor.txt1),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
