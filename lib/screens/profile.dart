import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/data/profile_settingUI_data.dart';
import 'package:flutter_groceries_app/widgets/elevated_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SafeArea(child: _ProfileCard()),
            Expanded(
              child: ListView.builder(
                itemCount: profileSettingUIData.length,
                itemBuilder: (context, index) {
                  final setting = profileSettingUIData[index];
                  return Column(
                    children: [
                      if (index != 0)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(color: Colors.black12, thickness: 1),
                        ),
                      ProfileSettingUICard(
                        iconData: setting['icon'],
                        title: setting['title'],
                      ),
                    ],
                  );
                },
              ),
            ),
            MyElevatedButton(
              name: "Delete",
              bgColor: 0xff53B175,
              foreColor: 0xffFFF9FF,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF2F3F2),
                  foregroundColor: Color(0xff53B175),
                  fixedSize: Size(364, 67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey,
            ),
            // padding: EdgeInsets.all(12),
            width: 64,
            height: 64,
            child: ClipOval(
              child: Image.asset(
                'lib/assets/images/22IT169.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Liam Truong",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  "truongcongly139@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSettingUICard extends StatelessWidget {
  final IconData iconData;
  final String title;

  const ProfileSettingUICard({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Icon(iconData, size: 28),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios_outlined, size: 20),
      ],
    );
  }
}
