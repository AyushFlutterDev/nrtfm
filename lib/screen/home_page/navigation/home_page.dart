import 'package:nrtfm/constant/color.dart';
import 'package:nrtfm/utils/barrel.dart';
import 'package:nrtfm/utils/header/header.dart';
import 'package:nrtfm/widget/cd_card/cd_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Kcolor.bgColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {},
          backgroundColor: Kcolor.primaryColor,
          child: const Icon(Icons.music_note),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Header(
                  url: "assets/images/top20.png",
                  icon: Icon(Icons.search),
                  isShow: false),
              SizedBox(height: 15.h),
              SizedBox(
                height: 210.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(left: 15.w),
                        child: CdCard(
                          title: 'NRT FM',
                          views: '1.2M',
                          image:
                              'https://img.freepik.com/free-vector/music-festival-invitation-design-with-notes_1017-9868.jpg?w=740&t=st=1663218763~exp=1663219363~hmac=be17b93a087eeda2d9ae80d3de4eca68f00ff8933802d1ee0f32d4e7f3556815',
                          onTap: () {},
                          onShare: () {},
                          onRemove: () {},
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
