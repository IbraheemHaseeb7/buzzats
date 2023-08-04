import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/SocietySuggest.dart';
import 'package:flutter_app_1/CustomWidgets/UserSuggest.dart';

void main() {
  runApp(SuggestionPage());
}

class SuggestionPage  extends StatefulWidget {
  const SuggestionPage ({super.key});

  @override
  State<SuggestionPage > createState() => _SuggestionPage ();
}

class _SuggestionPage  extends State<SuggestionPage > {

  Color peopleColor = Color(0xFF4137BD);
  Color societyColor = Color(0xffffffff);

  // Add a GlobalKey to the RefreshIndicator
  final GlobalKey<RefreshIndicatorState> _refreshPeopleKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshSocietyKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _handlePeopleRefresh() async {
    // After refreshing the data, call setState to rebuild the UI if needed.
    setState(() {});
  }

  Future<void> _handleSocietyRefresh() async {
    // After refreshing the data, call setState to rebuild the UI if needed.
    setState(() {});
  }

  bool showPeopleWidgets = true;
  bool showSocietyWidgets = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff141d26),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 12, 1, 0), // Add padding to separate the Icon from TextField
                  child: Icon(
                    Icons.person, // Replace with the desired icon
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(35, 15, 10, 0),
                    child: TextField(
                      controller: TextEditingController(),
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide:
                              BorderSide(color: Color(0x006080a7), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide:
                              BorderSide(color: Color(0x006080a7), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide:
                              BorderSide(color: Color(0x006080a7), width: 1),
                        ),
                        hintText: "Search Users",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 17,
                          color: Color(0xffffffff),
                        ),
                        filled: true,
                        fillColor: Color(0x20ffffff),
                        isDense: false,
                        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                        prefixIcon: Icon(Icons.search,
                            color: Color(0xffffffff), size: 28),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 70, 0, 10),
                  child: Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Text(
                      "Suggestions for you ",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                      child: Align(
                        alignment: Alignment(-0.9, 0.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              // Reduce the font size by a certain amount when the button is pressed
                              peopleColor = Color(0xFF4137BD);
                              societyColor = Color(0xffffffff);

                              showPeopleWidgets = true;
                              showSocietyWidgets = false;
                            });
                          },
                          color: Color(0x00ffffff),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "People",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          textColor: peopleColor,
                          height: 40,
                          minWidth: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(120, 20, 0, 20),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            // Reduce the font size by a certain amount when the button is pressed
                            societyColor = Color(0xFF4137BD);
                            peopleColor = Color(0xffffffff);
                            showSocietyWidgets = true;
                            showPeopleWidgets = false;
                          });
                        },
                        color: Color(0x00ffffff),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "Society",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: societyColor,
                        height: 40,
                        minWidth: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: showPeopleWidgets,
              child: Expanded(
                child: RefreshIndicator(
                  key: _refreshPeopleKey,
                  onRefresh: _handlePeopleRefresh,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                        UserSuggest(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showSocietyWidgets,
              child: Expanded(
                child: RefreshIndicator(
                  key: _refreshSocietyKey,
                  onRefresh: _handleSocietyRefresh,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SocietySuggest(),
                        SocietySuggest(),
                        SocietySuggest(),
                        SocietySuggest(),
                        SocietySuggest(),
                        SocietySuggest(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
