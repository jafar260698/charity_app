

import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/other/comment_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CommentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColor.sometimes,
        appBar: widgetAppBarTitle(context),
        body: Column(
          children: <Widget>[
            Text(
              getTranslated(context, 'comment'),
              style: TextStyle(
                  fontSize: 24.0,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(30.0)),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: Container(
                  width: SizeConfig.screenWidth,
                  color: Color.fromRGBO(244, 244, 244, 1),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: mainUI(model),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onModelReady: (model){
        model.getComment();
      },
      viewModelBuilder: () => CommentViewModel(),
    );
  }

  Widget mainUI(CommentViewModel viewModel){
    if(viewModel.isLoading) return Container();
    if(viewModel.comment!=null && viewModel.comment.data.length>0)
      return ListView.builder(
          itemCount: viewModel.comment.data.length,
          itemBuilder: (context,i){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:50.0),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text(
                            "Бибигуль Ахметова",
                            style: AppThemeStyle.appBarStyle16,
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                          Text(
                            "Жаль, что журналистка поленилась поинтересоваться, кто разрабатывал эти костюмы. Их разработал и внедрил в практику здравоохранения Государственный научный центр РФ - Институт медико- биологических проблем РАН. В 2009 году ученым этого института была присуждена награда «Врач года» как раз за этот костюм.",
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          Divider(thickness: 2,color: Colors.black54,),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          Text(
                            "15 ch... atvetit",
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
      );
    else return Container(child: EmptyData());
  }

}
