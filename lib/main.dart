import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:converter/ext/units_icons_icons.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import './ext/util.dart';
import 'temperature_screen.dart';
import 'weight_screen.dart';
import 'volume_screen.dart';
import 'length_screen.dart';
import 'currency_screen.dart';


// ---------------------------------------------------- //
//                        SETUP                         //
// ---------------------------------------------------- //

// Main function
void main() async
{
    await fetchJSON();


    // Only for portait orientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
    ).then((_) => runApp(new MyApp()));
}

// My app (name and theme)
class MyApp extends StatelessWidget
{
  @override

  Widget build(BuildContext context)
  {
    return MaterialApp(

        // Take debug banner off
        debugShowCheckedModeBanner: false,

        title: 'Units',

        theme: ThemeData(
            primarySwatch: Colors.blue,
         ),

        home: InputPage(),

    );
  }
}


// ---------------------------------------------------- //
//                         APP                          //
// ---------------------------------------------------- //

class InputPage extends StatelessWidget
{
    // Builder
    Widget build(BuildContext context)
    {
        return Scaffold(

            body:Container(

                decoration: new BoxDecoration(color: Colors.grey[200]),

                child: Padding(

                    padding: MediaQuery.of(context).padding,

                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[

                            _buildTitle(context),
                            Expanded(child: _buildCards(context)),

                        ],

                    ),

                ),
            ),

        );
    }


    // Title widget
    Widget _buildTitle(BuildContext context)
    {
        return Padding(

            padding: EdgeInsets.only(
                left: 24.0,
                top: screenAwareSize(14.0, context),
            ),

            child: Text(
                "Units",
                style: new TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                ),
            )

        );
    }


    // Center Design
    Widget _buildCards(BuildContext context)
    {
        return Padding(

            padding: EdgeInsets.only(
                left: 14.0,
                right: 14.0,
                top: screenAwareSize(15.0, context),
                bottom: screenAwareSize(25.0, context),
            ),

            child: Column(

                children: <Widget>[

                    Expanded(
                        flex: 2,
                        child: Row(
                            children: <Widget>[
                                Expanded(child:_tempCard(context,"Temperature", Colors.red[400], UnitsIcons.temperature, 100.0, TemperatureScreen())),
                                Expanded(child:_tempCard(context,"Weight", Colors.grey[700], UnitsIcons.weight, 100.0, WeightScreen())),
                            ],
                        ),
                    ),

                    Expanded(
                        flex: 2,
                        child: Row(
                            children: <Widget>[
                                Expanded(child:_tempCard(context,"Volume", Colors.blue[400], UnitsIcons.volume, 100.0,VolumeScreen())),
                                Expanded(child:_tempCard(context,"Length", Colors.green[400], UnitsIcons.length, 100.0,LengthScreen())),
                            ],
                        ),
                    ),

                   Expanded(flex:1, child:_tempCardLarge(context,"Currency", Colors.orange[400], UnitsIcons.currency, 80.0, CurrencyScreen(date:usedDate, rate:usedRate))),
                ],

            ),

        );
    }


    // Title for cards
    Widget _cardLabel(String label)
    {
        return Text(
            label,
            style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                ),
        );
    }

    // Logo for cards
    Widget _cardIcon(Color iconColor, IconData cardIcon, double iconSize)
    {
        return Icon(
            cardIcon,
            color: iconColor,
            size: iconSize,
        );
    }


    // Card design
    Widget _tempCard(BuildContext context, String label, Color iconColor, IconData cardIcon, double iconSize, Widget secondScreen)
    {
        return Container(

            // Color shadow
            decoration: BoxDecoration(

                boxShadow: [
                    BoxShadow(
                        color: iconColor,
                        blurRadius: 2.0,
                    ),
                ],

                borderRadius: BorderRadius.all(
                Radius.circular(10.0),
                ),

            ),

            // Card
            child:InkWell(
                onTap: (){
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => secondScreen),
                    );},


                child:Card(

                    color: Colors.grey[100],
                    elevation: 1.0,
                    margin: const EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        ),

                    child: Container(
                        width: double.infinity,
                        height: double.infinity,

                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                Expanded(flex:3, child: _cardIcon(iconColor, cardIcon, iconSize)),
                                Expanded(flex:1, child: _cardLabel(label)),
                            ],
                        )

                    )

                ),
            ),

        );
    }

     Widget _tempCardLarge(BuildContext context, String label, Color iconColor, IconData cardIcon, double iconSize, Widget secondScreen)
    {
        return Container(

            // Color shadow
            decoration: BoxDecoration(

                boxShadow: [
                    BoxShadow(
                        color: iconColor,
                        blurRadius: 2.0,
                    ),
                ],

                borderRadius: BorderRadius.all(
                Radius.circular(10.0),
                ),

            ),

            // Card
            child:InkWell(
                onTap: (){
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => secondScreen),
                    );},

                child:Card(

                    color: Colors.grey[100],
                    elevation: 1.0,
                    margin: const EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        ),

                    child: Container(
                        width: double.infinity,
                        height: double.infinity,

                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                Center(child: _cardLabel(label)),
                                Center(child: _cardIcon(iconColor, cardIcon, iconSize)),
                            ],
                        )

                    )

                ),
            ),

        );
    }



}

// Get currency
String usedDate; double usedRate;
String date;  double rates;

Future fetchJSON() async {

  var response = await http.get(
    "https://api.exchangeratesapi.io/latest?symbols=USD",
    headers: {"Accept": "application/json"},
  );

  if (response.statusCode == 200) {
    String responseBody = response.body;
    var responseJSON = json.decode(responseBody);

    date =  responseJSON['date'];
    usedDate = date;
    saveDate(date);

    rates =  responseJSON['rates']['USD'];
    usedRate = rates;
    await saveRate(rates);
  }
  else{
    await getSavedDate();
    await getSavedRate();
    usedDate = dateBuffer;
    usedRate = rateBuffer;
    print('false');
  }
}

// saveData
saveRate(double rate) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('rate', rate);
}
saveDate(String date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('date', date);
}
double rateBuffer = 12;
getSavedRate() async {
        final prefs = await SharedPreferences.getInstance();
        rateBuffer = prefs.getDouble('rate');
}
String dateBuffer = '1111-11-11';
getSavedDate() async {
        final prefs = await SharedPreferences.getInstance();
        dateBuffer = prefs.getString('date');
}