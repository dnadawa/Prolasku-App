import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:prolasku/screens/more/change-language.dart';
import 'package:prolasku/screens/more/newsletter.dart';
import 'package:prolasku/screens/more/policy.dart';
import 'package:prolasku/screens/more/shop-locations.dart';
import 'package:prolasku/widgets/custom-text.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
            height: ScreenUtil().setHeight(120),
            child: Image.asset('assets/images/logo.png')
        ),
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          ///digital pdf newsletter
          Divider(height: 0,),
          ListTile(
           contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('digitalPDFNewsletter'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => DigitalPDFNewsletter())
              );
            },
          ),
          Divider(height: 0,),

          ///shop locations
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: SizedBox(
              width: ScreenUtil().setHeight(50),
              height: ScreenUtil().setHeight(50),
                child: Image.asset('assets/images/shop.png')
            ),
            title: CustomText(text: tr('shopLocations'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ShopLocations())
              );
            },
          ),
          Divider(height: 0,),

          ///profile
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(Icons.account_circle,color: Theme.of(context).accentColor),
            title: CustomText(text: tr('yourProfile'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),

          ///change language
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.flag_circle,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('languageChange'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ChangeLanguage())
              );
            },
          ),
          Divider(height: 0,),

          ///app guide
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.question_circle,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('appGuide'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Policy(
                    title: 'appGuide',
                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare ac lectus volutpat aliquet. Vivamus vel vestibulum erat, a vehicula augue. In in leo turpis. In dignissim semper felis, quis porta orci ullamcorper sit amet. Nam porttitor elit id metus suscipit, ut lacinia leo lobortis. Duis sagittis, nisi vestibulum suscipit sodales, ex orci venenatis dui, quis porta quam purus at nisi. In consectetur interdum volutpat. Cras imperdiet magna justo, vitae maximus lectus sodales ut. Nullam a lorem eget tellus pulvinar vulputate vitae sed sem. Nullam congue porttitor dictum.\n\nEtiam rutrum neque tincidunt lacus hendrerit, efficitur semper neque euismod. Donec eget interdum est. Pellentesque id dignissim dui. Ut ac facilisis risus. Donec ullamcorper faucibus lectus non aliquet. Curabitur quis magna ut arcu pulvinar faucibus. Aenean consequat luctus tincidunt. Aenean non tristique velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer porta ligula in diam posuere mollis.\n\nMaecenas finibus elit eu molestie ullamcorper. Nulla consectetur nunc nunc, ut rhoncus lacus pellentesque ac. Quisque in mauris et diam mattis ullamcorper. Ut at tellus eget urna viverra rhoncus. Nullam vel viverra est. Praesent faucibus, est sit amet porta maximus, eros nibh consequat nulla, id volutpat enim est sit amet odio. Vestibulum scelerisque ac libero eu vehicula. Nullam at nibh et massa sagittis porta. Fusce malesuada viverra dolor, sit amet blandit lacus finibus non.',
                  ))
              );
            },
          ),
          Divider(height: 0,),


          ///more info
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('moreInfo'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Policy(
                    title: 'moreInfo',
                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare ac lectus volutpat aliquet. Vivamus vel vestibulum erat, a vehicula augue. In in leo turpis. In dignissim semper felis, quis porta orci ullamcorper sit amet. Nam porttitor elit id metus suscipit, ut lacinia leo lobortis. Duis sagittis, nisi vestibulum suscipit sodales, ex orci venenatis dui, quis porta quam purus at nisi. In consectetur interdum volutpat. Cras imperdiet magna justo, vitae maximus lectus sodales ut. Nullam a lorem eget tellus pulvinar vulputate vitae sed sem. Nullam congue porttitor dictum.\n\nEtiam rutrum neque tincidunt lacus hendrerit, efficitur semper neque euismod. Donec eget interdum est. Pellentesque id dignissim dui. Ut ac facilisis risus. Donec ullamcorper faucibus lectus non aliquet. Curabitur quis magna ut arcu pulvinar faucibus. Aenean consequat luctus tincidunt. Aenean non tristique velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer porta ligula in diam posuere mollis.\n\nMaecenas finibus elit eu molestie ullamcorper. Nulla consectetur nunc nunc, ut rhoncus lacus pellentesque ac. Quisque in mauris et diam mattis ullamcorper. Ut at tellus eget urna viverra rhoncus. Nullam vel viverra est. Praesent faucibus, est sit amet porta maximus, eros nibh consequat nulla, id volutpat enim est sit amet odio. Vestibulum scelerisque ac libero eu vehicula. Nullam at nibh et massa sagittis porta. Fusce malesuada viverra dolor, sit amet blandit lacus finibus non.',
                  ))
              );
            },
          ),
          Divider(height: 0,),

          ///privacy policy
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('privacyPolicy'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Policy(
                    title: 'privacyPolicy',
                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare ac lectus volutpat aliquet. Vivamus vel vestibulum erat, a vehicula augue. In in leo turpis. In dignissim semper felis, quis porta orci ullamcorper sit amet. Nam porttitor elit id metus suscipit, ut lacinia leo lobortis. Duis sagittis, nisi vestibulum suscipit sodales, ex orci venenatis dui, quis porta quam purus at nisi. In consectetur interdum volutpat. Cras imperdiet magna justo, vitae maximus lectus sodales ut. Nullam a lorem eget tellus pulvinar vulputate vitae sed sem. Nullam congue porttitor dictum.\n\nEtiam rutrum neque tincidunt lacus hendrerit, efficitur semper neque euismod. Donec eget interdum est. Pellentesque id dignissim dui. Ut ac facilisis risus. Donec ullamcorper faucibus lectus non aliquet. Curabitur quis magna ut arcu pulvinar faucibus. Aenean consequat luctus tincidunt. Aenean non tristique velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer porta ligula in diam posuere mollis.\n\nMaecenas finibus elit eu molestie ullamcorper. Nulla consectetur nunc nunc, ut rhoncus lacus pellentesque ac. Quisque in mauris et diam mattis ullamcorper. Ut at tellus eget urna viverra rhoncus. Nullam vel viverra est. Praesent faucibus, est sit amet porta maximus, eros nibh consequat nulla, id volutpat enim est sit amet odio. Vestibulum scelerisque ac libero eu vehicula. Nullam at nibh et massa sagittis porta. Fusce malesuada viverra dolor, sit amet blandit lacus finibus non.',
                  ))
              );
            },
          ),
          Divider(height: 0,),

          ///data protection policy
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('dataProtectionPolicy'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Policy(
                    title: 'dataProtectionPolicy',
                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare ac lectus volutpat aliquet. Vivamus vel vestibulum erat, a vehicula augue. In in leo turpis. In dignissim semper felis, quis porta orci ullamcorper sit amet. Nam porttitor elit id metus suscipit, ut lacinia leo lobortis. Duis sagittis, nisi vestibulum suscipit sodales, ex orci venenatis dui, quis porta quam purus at nisi. In consectetur interdum volutpat. Cras imperdiet magna justo, vitae maximus lectus sodales ut. Nullam a lorem eget tellus pulvinar vulputate vitae sed sem. Nullam congue porttitor dictum.\n\nEtiam rutrum neque tincidunt lacus hendrerit, efficitur semper neque euismod. Donec eget interdum est. Pellentesque id dignissim dui. Ut ac facilisis risus. Donec ullamcorper faucibus lectus non aliquet. Curabitur quis magna ut arcu pulvinar faucibus. Aenean consequat luctus tincidunt. Aenean non tristique velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer porta ligula in diam posuere mollis.\n\nMaecenas finibus elit eu molestie ullamcorper. Nulla consectetur nunc nunc, ut rhoncus lacus pellentesque ac. Quisque in mauris et diam mattis ullamcorper. Ut at tellus eget urna viverra rhoncus. Nullam vel viverra est. Praesent faucibus, est sit amet porta maximus, eros nibh consequat nulla, id volutpat enim est sit amet odio. Vestibulum scelerisque ac libero eu vehicula. Nullam at nibh et massa sagittis porta. Fusce malesuada viverra dolor, sit amet blandit lacus finibus non.',
                  ))
              );
            },
          ),
          Divider(height: 0,),
        ],
      ),
    );
  }
}
