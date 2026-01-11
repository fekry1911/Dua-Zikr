import 'package:dua_zekr/core/theme/text_theme/text_style.dart';
import 'package:dua_zekr/features/home/presentation/screen/widgets/all_categories.dart';
import 'package:dua_zekr/features/home/presentation/screen/widgets/azkar_cate_card.dart';
import 'package:dua_zekr/features/home/presentation/screen/widgets/background_image.dart';
import 'package:dua_zekr/features/home/presentation/screen/widgets/dua_list.dart';
import 'package:dua_zekr/features/home/presentation/screen/widgets/pray_time.dart';
import 'package:dua_zekr/features/home/presentation/screen/widgets/title.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Text("احاديث و اذكار", style: AppTextStyle.font24BlackBold),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                        ),
                        color: Color(0xffF6FAFC),
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.grey)],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: DuaList(),
              ),
              SizedBox(height: 10),
              PrayTime(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return AzkarCateCard(
                      image: data[index]["image"]!,
                      title: data[index]["title"]!,
                      jsonFileName: data[index]["jsonFileName"]!,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleText(title: "احاديث"),

                    AllCategoriesList(),
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
