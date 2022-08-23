import 'package:flutter/material.dart';
import 'package:hsssiot/widgets/widgets.dart';
import 'package:hsssiot/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //   BoxConstraints(
    //       maxWidth: MediaQuery.of(context).size.width,
    //       maxHeight: MediaQuery.of(context).size.height),
    //   designSize: Size(360, 690),
    //   orientation: Orientation.portrait,
    // );
    ScreenUtil.init(
      context,
      // designSize: MediaQuery.of(context).size.width,
      // deviceSize: Size(screenWidth, screenHeight),
      designSize: const Size(360, 690),
      // orientation: Orientation.portrait,
    );
    var profileInfo = Column(children: <Widget>[
      Container(
        height: kSpacingUnit.w * 10,
        width: kSpacingUnit.w * 10,
        margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: kSpacingUnit.w * 5,
              backgroundImage: AssetImage('images/avatar.png'),
              backgroundColor: Theme.of(context).canvasColor,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: kSpacingUnit.w * 2.5,
                width: kSpacingUnit.w * 2.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  heightFactor: kSpacingUnit.w * 1.5,
                  widthFactor: kSpacingUnit.w * 1.5,
                  child: Icon(
                    LineAwesomeIcons.pen,
                    color: Colors.white,
                    size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: kSpacingUnit.w * 2),
      Text(
        'Musumba Gerald',
        style: kTitleTextStyle,
      ),
      SizedBox(height: kSpacingUnit.w * 0.5),
      Text(
        'musumbagerald98@gmail.com',
        style: kCaptionTextStyle,
      ),
      SizedBox(height: kSpacingUnit.w * 2),
    ]);

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              // ThemeProvider.of(context)?.brightness == Brightness.dark
              //     ? CrossFadeState.showFirst
              //     :
              CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context)?.changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context)?.changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              color: Colors.black,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        Container(
          margin: const EdgeInsets.only(top: 30, right: 10),
          child: themeSwitcher,
        ),
      ],
    );
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: ListView(
              children: <Widget>[
                header,
                Column(
                  children: const [
                    ProfileListItem(
                      icon: LineAwesomeIcons.user_shield,
                      text: 'Privacy',
                      hasNavigation: true,
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.question_circle,
                      text: 'Help & Support',
                      hasNavigation: true,
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.cog,
                      text: 'Settings',
                      hasNavigation: true,
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.user_plus,
                      text: 'Invite a Friend',
                      hasNavigation: true,
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.alternate_sign_out,
                      text: 'Logout',
                      hasNavigation: false,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
