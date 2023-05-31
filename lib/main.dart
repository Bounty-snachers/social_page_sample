import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_page_sample/constant.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.teal,
        textTheme:
            GoogleFonts.notoSansAnatolianHieroglyphsTextTheme().copyWith(),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "자유톡",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [Image.asset("assets/image/bell.png")],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/image/MainProfile.png"),
              backgroundColor: Color(0xfffcd9ac),
            ),
            title: const Row(
              children: [
                Text(
                  "안녕 나 응애 ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.teal,
                ),
                Text(
                  "1일전",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            subtitle: const Row(
              children: [
                Text(
                  "165cm",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  ".",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "53kg",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(30)),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
              child: const Text(
                "팔로우",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "지난 월요일에 했던 이벤트 중 가장 괜찮은 상품 뭐야?" + "\n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "$postDescription\n",
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (dynamic tag in allTags)
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: const Color(0xfff7f8fa),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: const Color(0xff9cacbc), width: 1.5),
                      ),
                      child: Text(
                        tag,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              color: const Color(0xffEDEEF3),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageURL,
                placeholder: (context, url) => Center(
                  child: Container(
                    color: const Color(0xffAFB9CA),
                    height: 200,
                    width: double.infinity,
                    child: const Icon(Icons.image_outlined),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Container(
                    color: const Color(0xffAFB9CA),
                    height: 200,
                    width: double.infinity,
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 18),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffAFB9CA),
                  width: 2.0,
                ),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_border_outlined,
                  color: Color(0xffAFB9CA),
                  size: 26,
                ),
                const Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "5",
                    style: TextStyle(color: Color(0xffAFB9CA), fontSize: 15),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset("assets/image/Comment.png"),
                const Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "5",
                    style: TextStyle(color: Color(0xffAFB9CA), fontSize: 15),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.bookmark_border_outlined,
                  color: Color(0xffAFB9CA),
                ),
                const SizedBox(
                  width: 20,
                ),
                const HorizontalDots(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const ListTile(
            trailing: HorizontalDots(),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/image/MainProfile.png"),
              backgroundColor: Color(0xfffcd9ac),
            ),
            title: Row(
              children: [
                Text(
                  "안녕 나 응애 ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.teal,
                ),
                Text(
                  "1일전",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18, left: 18 + 60),
            child: Column(
              children: [
                const Text(
                  "어머 제가 있던 테이블이 제일 반응이 좋았나보네요🤭  우짤래미님도 아시겠지만 저도 일반인 몸매 그 이상도 이하도 아니잖아요?! 그런 제가 기꺼이 도전해봤는데 생각보다 괜찮았어요! 오늘 중으로 라이브 리뷰 올라온다고 하니 꼭 봐주세용~!",
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.favorite_border_outlined,
                      color: Color(0xffAFB9CA),
                      size: 26,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "5",
                        style:
                            TextStyle(color: Color(0xffAFB9CA), fontSize: 15),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset("assets/image/Comment.png"),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "5",
                        style:
                            TextStyle(color: Color(0xffAFB9CA), fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 60),
            child: ListTile(
              trailing: HorizontalDots(),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage("assets/image/SecondProfilePicture.png"),
                backgroundColor: Color(0xfffbb0ae),
              ),
              title: Row(
                children: [
                  Text(
                    "ㅇㅅㅇ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "1일전",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18 + 60 + 60),
            child: Column(
              children: [
                Text(
                  "오 대박! 라이브 리뷰 오늘 올라온대요? 챙겨봐야겠다",
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Color(0xffAFB9CA),
                      size: 26,
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "5",
                        style:
                            TextStyle(color: Color(0xffAFB9CA), fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xffAFB9CA),
                  width: 2.0,
                ),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "등록",
                      style: TextStyle(
                          color: Color(0xffAFB9CA),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.image_outlined,
                    color: Color(0xffAFB9CA),
                  ),
                  hintText: '댓글을 남겨주세요.',
                  hintStyle: const TextStyle(
                      color: Color(0xffAFB9CA),
                      overflow: TextOverflow.ellipsis)),
            ),
          )
        ],
      ),
    );
  }
}

class HorizontalDots extends StatelessWidget {
  const HorizontalDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -90 * math.pi / 180,
      child: const Icon(
        Icons.more_vert,
        color: Color(0xffAFB9CA),
      ),
    );
  }
}
