import 'package:nrtfm/constant/color.dart';
import 'package:nrtfm/utils/barrel.dart';
import 'package:nrtfm/widget/banner/custom_banner.dart';

class BookMarkCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String views;
  final String catagory;

  const BookMarkCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.views,
      required this.catagory});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 10.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.sp),
                  child: CustomPic(
                      imageUrl:
                          "https://img.freepik.com/free-photo/acoustic-guitar-close-up-beautiful-colored-background_169016-3530.jpg?w=900&t=st=1663069595~exp=1663070195~hmac=edb33da5fa3fb1daa4c8fcac815de2d1150dba4ee7dc639515dd4e5c9b64727f",
                      height: 50.h,
                      width: 65.w),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Acoustic Guitar Song',
                      style: TextStyle(
                        color: Kcolor.txt2,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      '1.5k views | podcast',
                      style: TextStyle(
                        color: Kcolor.txt1,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.favorite,
              color: Colors.green,
              size: 27.sp,
            )
          ],
        ),
      ),
    );
  }
}
