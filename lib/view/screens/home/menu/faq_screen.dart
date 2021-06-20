import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/main.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/home/menu/faq_viewmodel.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class FaqScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FaqViewModel>.reactive(
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: Colors.white,
        dismissible: false,
        progressIndicator: CupertinoActivityIndicator(),
        child: Scaffold(
          backgroundColor: AppThemeStyle.primaryColor,
          appBar: widgetAppBarTitle(context),
          body: Column(
            children: <Widget>[
              Text(
                getTranslated(context, 'faq'),
                style: TextStyle(
                    fontSize: 24.0,
                    letterSpacing: 0.4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(30)),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  child: Container(
                    color: Color.fromRGBO(244, 244, 244, 1),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: mainUI(model),
                    ),
                  ),
                ),
              ),
            //  mainUI(model),
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.reactCircle,
            color: Colors.black45,
            activeColor: AppThemeStyle.primaryColor,
            backgroundColor: Colors.white,
            items: [
              TabItem(
                  icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
            ],
            initialActiveIndex: 0,
            onTap: (int i) => {},
          ),
        ),
      ),
      onModelReady: (model){
        model.getFaqData();
      },
      viewModelBuilder: () => FaqViewModel(),
    );
  }

  Widget mainUI(FaqViewModel viewModel){
    if(viewModel.isLoading)
      return Container();
    else{
        if(viewModel.faq.length>0)
          return ListView.builder(
              itemCount: viewModel.faq.length,
              itemBuilder: (context,i){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      viewModel.faq[i].title,
                                      style:
                                      AppThemeStyle.titleFormStyle,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: AppThemeStyle.primaryColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        viewModel.faq[i].description,
                        style: AppThemeStyle.titleFormStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                );
              }
          );
        else Text('Data not found',style: AppThemeStyle.appBarStyle16);
      }
    }
  }
