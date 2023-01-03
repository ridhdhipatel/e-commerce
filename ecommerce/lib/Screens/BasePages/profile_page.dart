import 'package:flutter/material.dart';

import '../../Constants/constants.dart';
import '../../Utils/utils.dart';
import '../../Widgets/widgets.dart';
import '../screens.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1, left: 5.0, right: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: 'profile',
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    title: Row(
                      children: const [
                        CustomText(
                          text: 'View Profile',
                          textStyle: WidgetTheme.profileTitleTextStyle,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2.0,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('Your Orders'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.0,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(OrderHistoryScreen.routeName);
                },
              ),
              ListTile(
                title: const Text('Contact Us'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.0,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(ContactScreen.routeName);
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Shared shared = Shared();
                  shared.clear();
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
