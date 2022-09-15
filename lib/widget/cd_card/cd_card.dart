import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nrtfm/constant/color.dart';
import 'package:nrtfm/utils/barrel.dart';

class CdCard extends StatelessWidget {
  final String title;
  final String views;
  final String image;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onShare;
  final GestureTapCallback? onRemove;
  const CdCard(
      {Key? key,
      required this.title,
      required this.views,
      required this.image,
      required this.onTap,
      required this.onShare,
      required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Kcolor.transparent,
      onTap: onTap,
      child: SizedBox(
        width: 169,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 16,
                  right: -43,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              height: 150.9,
                              width: 150.9,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromRGBO(225, 225, 225, 1),
                                  highlightColor: Colors.white,
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 45,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Color.fromARGB(108, 52, 52, 52),
                              child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Color.fromARGB(177, 0, 0, 1),
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Kcolor.bgColor,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 115,
                    height: 122,
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
                              width: 115,
                              height: 122,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(4, 4, 4, 0.38),
                              ),
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        title,
                        style: const TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Kcolor.txt2),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: 90,
                      child: Text(
                        " $views",
                        style: const TextStyle(
                            overflow: TextOverflow.fade,
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Kcolor.txt1),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                IconButton(
                    splashRadius: 15,
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: const Color.fromARGB(255, 43, 43, 44),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          controller: ModalScrollController.of(context),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  ListTile(
                                    onTap: onShare,
                                    leading: const Icon(
                                      Icons.share,
                                      color: Kcolor.white,
                                    ),
                                    title: const Text('Share',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Kcolor.white)),
                                  ),
                                  ListTile(
                                    onTap: onRemove,
                                    leading: const Icon(
                                      Icons.delete,
                                      color: Kcolor.white,
                                    ),
                                    title: const Text('Remove',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Kcolor.white,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: Kcolor.white,
                      size: 19,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
