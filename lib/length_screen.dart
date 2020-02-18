import 'package:flutter/material.dart';
import './ext/units_icons_icons.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import './ext/util.dart';

class LengthScreen extends StatefulWidget
{
    @override
    LengthScreenState createState() => new LengthScreenState();
}

class LengthScreenState extends State<LengthScreen> 
{
    List<String> units1 = [" ", "km", "m", "cm", "mm", " "];
    List<String> units2 = [" ", "mile", "yd", "ft", "in", " "];
    List<int> test1 = [1,2,3,4];
    List<int> test2 = [1,2,3,4];
    static double initUnit1 = 2;    // Hot restart
    static double initUnit2 = 2;
    List<int> numActiveTrue = [initUnit1.round()+1,initUnit2.round()+1];    // <=== Gives active unit

    bool _doubleUnit()
    {
        return numActiveTrue[1] == 5 ? true :  false;
    }

    static double initPos;

    bool active1 = true;
    bool active2 = false;
    Color activeColor = Colors.green[400];
    Color inactiveColor = Colors.grey[200];

    Color _colorChange(bool active) {
        Color color;
        active ? color = activeColor : color = inactiveColor;
        return color;
    }

    TextStyle _displayUnit(bool activeUnit)
    {
        if (activeUnit)
        {return TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: activeColor,
        );}
        else{
            return TextStyle(
                fontSize: 20.0,
                fontFamily: 'Raleway',
            );
        }
    }


    double degree;
    // METRIC TO IMPE
    //units2 -> 1
    double _getKmFromMile()
    {
        if (degree != null)
            return degree * 0.6214;
        else return null;
    }
    double _getMFromMile()
    {
        if (degree != null)
            return _getKmFromMile()/1000;
        else return null;
    }
    double _getCmFromMile()
    {
        if (degree != null)
            return _getMFromMile()/100;
        else return null;
    }
    double _getMmFromMile()
    {
        if (degree != null)
            return _getCmFromMile()/10;
        else return null;
    }
    // Units 2 -> 2
    double _getKmFromYd()
    {
        if (degree != null)
            return _getMFromYd()*1000;
        else return null;
    }
    double _getMFromYd()
    {
        if (degree != null)
            return degree * 1.0936;
        else return null;
    }
    double _getCmFromYd()
    {
        if (degree != null)
            return _getMFromYd()/100;
        else return null;
    }
    double _getMmFromYd()
    {
        if (degree != null)
            return _getCmFromYd()/10;
        else return null;
    }

    // Units 2 -> 3
    double _getKmFromFt()
    {
        if (degree != null)
            return _getMFromFt()*1000;
        else return null;
    }
    double _getMFromFt()
    {
        if (degree != null)
            return degree * 1.0936*3;
        else return null;
    }
    double _getCmFromFt()
    {
        if (degree != null)
            return _getMFromFt()/100;
        else return null;
    }
    double _getMmFromFt()
    {
        if (degree != null)
            return _getCmFromFt()/10;
        else return null;
    }

    // Units 2 -> 4
    double _getKmFromIn()
    {
        if (degree != null)
            return _getMFromIn()*1000;
        else return null;
    }
    double _getMFromIn()
    {
        if (degree != null)
            return _getCmFromIn()*100;
        else return null;
    }
    double _getCmFromIn()
    {
        if (degree != null)
            return degree*0.3937;
        else return null;
    }
    double _getMmFromIn()
    {
        if (degree != null)
            return _getCmFromIn()/10;
        else return null;
    }


    // IMP TO METRIC
    //Units2 ->1
    double _getMileFromKm(){
        if (degree != null) return degree * 1.6093;
        else return null;
    }
    double _getMileFromM(){
        if (degree != null) return _getMileFromKm() * 1000;
        else return null;
    }
    double _getMileFromCm(){
        if (degree != null) return _getMileFromM() * 100;
        else return null;
    }
    double _getMileFromMm(){
        if (degree != null) return _getMileFromCm() * 10;
        else return null;
    }

    // Units2 ->2
    double _getYdFromKm(){
        if (degree != null) return _getYdFromM() /1000;
        else return null;
    }
    double _getYdFromM(){
        if (degree != null) return degree * 0.9144;
        else return null;
    }
    double _getYdFromCm(){
        if (degree != null) return _getYdFromM() * 100;
        else return null;
    }
    double _getYdFromMm(){
        if (degree != null) return _getYdFromCm() * 10;
        else return null;
    }

    // Units2 ->3
    double _getFtFromKm(){
        if (degree != null) return _getFtFromM() /1000;
        else return null;
    }
    double _getFtFromM(){
        if (degree != null) return degree * 0.9144/3;
        else return null;
    }
    double _getFtFromCm(){
        if (degree != null) return _getFtFromM() * 100;
        else return null;
    }
    double _getFtFromMm(){
        if (degree != null) return _getFtFromCm() * 10;
        else return null;
    }

    //Units3 ->4
    double _getInFromKm(){
        if (degree != null) return _getInFromM() /1000;
        else return null;
    }
    double _getInFromM(){
        if (degree != null) return _getInFromCm()/100;
        else return null;
    }
    double _getInFromCm(){
        if (degree != null) return degree * 2.54;
        else return null;
    }
    double _getInFromMm(){
        if (degree != null) return _getInFromCm() * 10;
        else return null;
    }


    String _getFtInFromKm()
    {
        if (degree == null) return " ";
        else if (degree <0)
        return '-${_getKmFromFt().abs().floor()}ft -${((_getKmFromFt().abs() - _getKmFromFt().abs().floor()) * 12).abs().round()}in';
        else return '${_getKmFromFt().abs().floor()}ft ${((_getKmFromFt().abs() - _getKmFromFt().abs().floor()) * 12).abs().round()}in';
    }
    String _getFtInFromM()
    {
        if (degree == null) return " ";
        else if (degree <0)
        return '-${_getMFromFt().abs().floor()}ft -${((_getMFromFt().abs() - _getMFromFt().abs().floor()) * 12).abs().round()}in';
        else return '${_getMFromFt().abs().floor()}ft ${((_getMFromFt().abs() - _getMFromFt().abs().floor()) * 12).abs().round()}in';
    }
    String _getFtInFromCm()
    {
        if (degree == null) return " ";
        else if (degree <0)
        return '-${_getCmFromFt().abs().floor()}ft -${((_getCmFromFt().abs() - _getCmFromFt().abs().floor()) * 12).abs().round()}in';
        else return '${_getCmFromFt().abs().floor()}ft ${((_getCmFromFt().abs() - _getCmFromFt().abs().floor()) * 12).abs().round()}in';
    }
    String _getFtInFromMm()
    {
        if (degree == null) return " ";
        else if (degree <0)
        return '-${_getMmFromFt().abs().floor()}ft -${((_getMmFromFt().abs() - _getMmFromFt().abs().floor()) * 12).abs().round()}in';
        else return '${_getMmFromFt().abs().floor()}ft ${((_getMmFromFt().abs() - _getMmFromFt().abs().floor()) * 12).abs().round()}in';
    }


    String _getDesiredString()
    {
        if (numActiveTrue[0] == 1)
            return _getFtInFromKm();
        else if (numActiveTrue[0] == 2)
            return _getFtInFromM();
        else if (numActiveTrue[0] == 3)
            return _getFtInFromCm();
        else if (numActiveTrue[0] == 4)
            return _getFtInFromMm();
        else return " ";
    }
    
    double _getDesiredValue(double inDegree, bool active)
    {
        double deg;
        if (active) {deg = inDegree;}
        else if (inDegree == null){return null;}
        else {
            if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getKmFromMile();
            else if (active1 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMFromMile();
            else if (active1 && numActiveTrue[0] == 3 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getCmFromMile();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMmFromMile();

            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 2)
                deg = _getKmFromYd();
            else if (active1 && numActiveTrue[0] == 2 && numActiveTrue[1] == 2)
                deg = _getMFromYd();
            else if (active1 && numActiveTrue[0] == 3 && numActiveTrue[1] == 2)
                deg = _getCmFromYd();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 2)
                deg = _getMmFromYd();

            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 3)
                deg = _getKmFromFt();
            else if (active1 && numActiveTrue[0] == 2 && numActiveTrue[1] == 3)
                deg = _getMFromFt();
            else if (active1 && numActiveTrue[0] == 3 && numActiveTrue[1] == 3)
                deg = _getCmFromFt();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 3)
                deg = _getMmFromFt();

            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 4)
                deg = _getKmFromIn();
            else if (active1 && numActiveTrue[0] == 2 && numActiveTrue[1] == 4)
                deg = _getMFromIn();
            else if (active1 && numActiveTrue[0] == 3 && numActiveTrue[1] == 4)
                deg = _getCmFromIn();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 4)
                deg = _getMmFromIn();

        

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMileFromKm();
            else if (active2 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMileFromM();
            else if (active2 && numActiveTrue[0] == 3 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMileFromCm();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMileFromMm();

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 2)
                deg = _getYdFromKm();
            else if (active2 && numActiveTrue[0] == 2 && numActiveTrue[1] == 2)
                deg = _getYdFromM();
            else if (active2 && numActiveTrue[0] == 3 && numActiveTrue[1] == 2)
                deg = _getYdFromCm();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 2)
                deg = _getYdFromMm();

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 3)
                deg = _getFtFromKm();
            else if (active2 && numActiveTrue[0] == 2 && numActiveTrue[1] == 3)
                deg = _getFtFromM();
            else if (active2 && numActiveTrue[0] == 3 && numActiveTrue[1] == 3)
                deg = _getFtFromCm();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 3)
                deg = _getFtFromMm();

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 4 || numActiveTrue[1] == 5))
                deg = _getInFromKm();
            else if (active2 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 4 || numActiveTrue[1] == 5))
                deg = _getInFromM();
            else if (active2 && numActiveTrue[0] == 3 && (numActiveTrue[1] == 4 || numActiveTrue[1] == 5))
                deg = _getInFromCm();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && (numActiveTrue[1] == 4 || numActiveTrue[1] == 5))
                deg = _getInFromMm();
        }
        return deg;
    }
    
    bool decimal = false;
    int decimalCounter = 0;
    String _getDegreeString(double inDegree, bool active)
    {
        if (_doubleUnit() && active1 && !active) return _getDesiredString();

        double deg = _getDesiredValue(inDegree, active);

        if (!active && deg!=null && !decimal) {
            if (deg.abs() > 1)
                return deg.toStringAsFixed(2);
            else if (deg == 0)
                return "0";
            else
                return deg.toStringAsFixed(1-(log(deg.abs())/log(10)).floor());
        }
        else if(active && !decimal && deg!=null) {
            int deg2 = deg.truncate();
            return deg2.toString();
        }
        else if(active && decimal && deg!=null) {
            return deg.toStringAsFixed(decimalCounter);
        }
        else if(!active && deg!=null && decimal) {
            if (decimalCounter < 1)
                {if (deg.abs() > 1)
                    return deg.toStringAsFixed(2);
                else if (deg == 0)
                    return "0";
                else
                    return deg.toStringAsFixed(1-(log(deg.abs())/log(10)).floor());
                }
            else {if (deg.abs() > 1)
                    return deg.toStringAsFixed(2);
                else if (deg == 0)
                    return "0";
                else
                    return deg.toStringAsFixed(1-(log(deg.abs())/log(10)).floor());
                }
        }
        else {return " ";}
    }


    @override
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
                            Expanded(child:_buildCards(context)),

                        ],

                    ),

                ),

            ),

        );
    }

    void _infoBubble()
    {
        _textInfoBubble();
    }

    Future<void> _textInfoBubble() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Information'),
            content: SingleChildScrollView(
            child: Column(
                children: <Widget>[

                    Text(
                        'Metric',
                        style: new TextStyle(fontWeight: FontWeight.bold)
                    ),
                    new SizedBox(
                        height: 4.0,
                        child: new Center(
                            child: new Container(
                            height: 2.0,
                            color: Colors.green[400],
                            ),
                        ),
                    ),

                    tableLine('1', 'cm', '0.3937', 'in'),
                    tableLine('1', 'm', '3.2808', 'ft'),
                    tableLine('1', 'm', '1.0936', 'yd'),
                    tableLine('1', 'km', '0.6214', 'mile'),
                    
                    Text(
                        '\nImperial',
                        style: new TextStyle(fontWeight: FontWeight.bold)
                    ),
                    new SizedBox(
                        height: 4.0,
                        child: new Center(
                            child: new Container(
                            height: 2.0,
                            color: Colors.green[400],
                            ),
                        ),
                    ),

                    tableLine('1', 'in', '2.54', 'cm'),
                    tableLine('1', 'ft', '12', 'in'),
                    tableLine('1', 'ft', '0.3048', 'm'),
                    tableLine('1', 'yd', '3', 'ft'),
                    tableLine('1', 'yd', '0.9144', 'm'),
                    tableLine('1', 'mile', '1760', 'yd'),
                    tableLine('1', 'mile', '1.6093', 'km'),


                    Text(
                    '\n\nSwipe Imperial Units far left to show mixed unit conversion',
                    style: new TextStyle(fontStyle: FontStyle.italic) ),

                ],
            ),
            ),
        );
        },
    );
    }

    Widget _buildTitle(BuildContext context)
    {
        return Padding(

            padding: EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: screenAwareSize(14.0, context),
            ),

            child:Column(

                children: <Widget>[

                    Row(

                        children: <Widget>[
                            
                            Expanded(
                                flex:1,
                                child:new IconButton(
                                    icon: const Icon(Icons.arrow_back), 
                                    onPressed: () {Navigator.pop(context);},
                                    color: Colors.green[400],
                                ),
                            ),

                            Expanded(
                                flex:7,
                                child: Text(
                                    "   Length",  
                                    style: new TextStyle(
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Raleway',
                                    ),
                                ),
                            ),

                            Expanded(
                                flex:1,
                                child: IconButton(
                                    icon:Icon(UnitsIcons.length),
                                    onPressed: _infoBubble,
                                ),
                            )

                        ],

                    ),

                    // Custom divider
                    new SizedBox(
                        height: 10.0,
                        child: new Center(
                            child: new Container(
                            height: 2.0,
                            color: Colors.green[400],
                            ),
                        ),
                    )

                ],
            ),
        );
    }

    Widget _buildCards(BuildContext context)
    {
        return Padding(

            padding: EdgeInsets.only(
                left: 14.0,
                right: 14.0,
                top: screenAwareSize(0.0, context),
                bottom: screenAwareSize(28.0, context),
            ),

            child:Column(

                children: <Widget>[

                    Expanded(
                        flex:3,
                        child:Row(
                            children: <Widget>[
                            
                            Expanded(child: _buildWheels(context, test1, units1, active1, degree, numActiveTrue[0]-1, 0)),
                            Expanded(child: _buildWheels(context, test2, units2, active2, degree, numActiveTrue[1]-1, 1)),
                            
                            ],
                        ),
                    ),

                    Expanded(
                        flex:3,
                        child:_buildKeybord(context),
                    )
                ],
            )
        );
    }
    
    
    Widget _getUnits(List<int> units, List<String> unitsfont, int iniIt, int it)
    {
        int itemCount = units.length+2;
        return LayoutBuilder(
            builder: (context, constraints) {
                initPos = constraints.maxWidth/3;
                ScrollController scrollController = new ScrollController(initialScrollOffset: iniIt*initPos);
                return constraints.isTight ?
                   new Container()
                    : NotificationListener(
                        onNotification: (Notification notification)
                        {
                            if (notification is ScrollNotification)
                            {
                                int middleValue = (notification.metrics.pixels + constraints.maxWidth/2) ~/ (constraints.maxWidth/3);

                                if (notification is UserScrollNotification &&
                                notification.direction == ScrollDirection.idle &&
                                scrollController.position.activity is! HoldScrollActivity)
                                {
                                    double targetExtent = (middleValue - 1) * constraints.maxWidth/3;
                                    scrollController.animateTo(targetExtent,
                                    duration:new Duration(milliseconds: 200),
                                    curve: Curves.decelerate);
                                }

                                if (middleValue != numActiveTrue[it])
                                {
                                    setState(() {numActiveTrue[it] = middleValue;});
                                }
                            }
                            return true;
                        },
                        child:ListView.builder(
                            controller: scrollController,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: itemCount,
                            itemExtent: constraints.maxWidth/3,
                            itemBuilder: 
                                (BuildContext context, int index) 
                                {
                                bool isExtra = (index == 0) || (index == itemCount-1);
                                    return isExtra ? new Container() :
                                    GestureDetector(
                                        behavior:HitTestBehavior.translucent,
                                        onTap: () {double targetExtent = (index - 1) * constraints.maxWidth/3;
                                                    scrollController.animateTo(targetExtent,
                                                    duration:new Duration(milliseconds: 200),
                                                    curve: Curves.decelerate);},
                                        child:Column(
                                            children: <Widget> [
                                                Expanded(
                                                    flex:1, 
                                                    child:Text( 
                                                        unitsfont[units[index-1]],
                                                        style:_displayUnit(units[index-1] == numActiveTrue[it]),
                                                    ),
                                                ),
                                                Expanded(flex:4, child:Container()),
                                            ],
                                        ),
                                    );
                                }
                            ),
                            
                        );
                    },
            );
    }


    Widget _buildWheels(BuildContext context, List<int> units, List<String> unitsfont, bool state, double degreeBuf, int iniIt, int it)
    {
        return Padding(

            padding: EdgeInsets.only(
                top: screenAwareSize(8.0, context),
                bottom: screenAwareSize(5.0, context),
            ),

            child:Container(

                decoration: BoxDecoration(
                    border: Border.all(
                        color:_colorChange(state),
                        width: 2,
                        ),
                // boxShadow: [
                //     BoxShadow(
                //         color: _colorChange(state),
                //         blurRadius: 5.0,
                //     ),
                //],

                borderRadius: BorderRadius.all(
                Radius.circular(50.0),
                ),

                ),

                //child:InkWell(
                    
                    // onTap: () 
                    // { setState( () 
                    //     {
                    //         if (!active1 && state == active1)
                    //             {active1 = true; active2 = false;}
                    //         else if (!active2 && state == active2)
                    //             {active2 = true; active1 = false;}
                    //         else if (active1 && state == active2)
                    //             {active2 = true; active1 = false;}
                    //         else if (active2 && state == active1)
                    //             {active1 = true; active2 = false;}
                                
                    //     });
                    // },

                    child:Card(
                        color: Colors.grey[200],
                        elevation: 1.0,
                        margin: const EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            ),

                        child: Padding(
                            padding: EdgeInsets.only(top :screenAwareSize(20.0, context)),

                            child:Stack(
                                children: <Widget>[
                                    new Center(child:FittedBox(
                                        child:Text(
                                            _getDegreeString(degreeBuf, state),
                                            style: new TextStyle(
                                                fontSize: 40.0,
                                            ),
                                        ),
                                        fit:BoxFit.scaleDown,
                                    ),),
                                    new Padding(
                                        padding: EdgeInsets.only(
                                        left: 0,
                                        right: 0,
                                        ),
                                        child: _getUnits(units, unitsfont, iniIt, it),
                                    ),

                            ],)
                            // child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //        Expanded(
                            //             flex:1,
                            //             child:Padding(
                            //                 padding: EdgeInsets.only(
                            //                     left: 0.0,
                            //                     right: 0.0,
                            //                 ),

                            //                 child:_getUnits(units, unitsfont, iniIt, it)
                            //             ),
                            //         ),

                            //         Expanded(
                            //             flex:3,
                            //             child:FittedBox(
                            //                 child:Text(
                            //                     _getDegreeString(degreeBuf, state),
                            //                     style: new TextStyle(
                            //                         fontSize: 45.0,
                            //                         fontFamily: 'RobotoMono',
                            //                     ),
                            //                 ),
                            //                 fit:BoxFit.scaleDown,
                            //             ),
                            //         ),  children: <Widget>[
                               
                            //     ],
                            // ),
                        ),
                    ),
                //),
            ),
        );
    }




    // --------------------------------------------------------------------------------//
    //                                   Keybord                                       //
    // --------------------------------------------------------------------------------//

    Widget _buildKeybord(BuildContext context)
    {
        return Padding(

            padding: EdgeInsets.only(
                top: screenAwareSize(5.0, context),
            ),

            child:Column(

                children: <Widget>[

                    Expanded(

                        child:Row(
                            children: <Widget>[
                            
                            Expanded(child: _buildKeyDigit(context, 7)),
                            Expanded(child: _buildKeyDigit(context, 8)),
                            Expanded(child: _buildKeyDigit(context, 9)),
                            Expanded(child: _buildKeyBackspace(context)),
                            
                            ],
                        ),
                    ), 

                    Expanded(

                        child:Row(
                            children: <Widget>[
                            
                            Expanded(child: _buildKeyDigit(context, 4)),
                            Expanded(child: _buildKeyDigit(context, 5)),
                            Expanded(child: _buildKeyDigit(context, 6)),
                            Expanded(child: _buildKeyAC(context)),
                            
                            ],
                        ),
                    ), 


                    Expanded(

                        child:Row(
                            children: <Widget>[
                            
                            Expanded(child: _buildKeyDigit(context, 1)),
                            Expanded(child: _buildKeyDigit(context, 2)),
                            Expanded(child: _buildKeyDigit(context, 3)),
                            Expanded(child: _buildKeyPlusMinus(context)),
                            
                            ],
                        ),
                    ), 


                    Expanded(

                        child:Row(
                            children: <Widget>[
                            
                            Expanded(flex:1,child: _buildKeySwape(context)),
                            Expanded(flex:2,child: _buildKeyDigit(context, 0)),
                            Expanded(flex:1,child: _buildKeyDecimal(context)),
                            
                            ],
                        ),
                    ), 

                ],
            )
        );
    }


    Widget _buildKeyDigit(BuildContext context, int digit)
    {
        return InkWell(

            onTap: () {
                setState(() {
                    if (degree == null){degree = 0;}
                    if(!decimal){
                        if (degree >= 0) {degree = degree*10+digit;}
                        else if (degree < 0) {degree = degree*10-digit;}
                    }
                    if(decimal && decimalCounter < 15){
                        decimalCounter++;
                        if (degree >=0) {degree = (degree * pow(10, decimalCounter)+digit)/pow(10, decimalCounter);}
                        else if (degree < 0) {degree = (degree * pow(10, decimalCounter)-digit)/pow(10, decimalCounter);}
                    }
                });
            },

            child: Card(

                color: Colors.blueGrey[100],
                elevation: 1.0,
                margin: const EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),

                child:Container(

                    alignment: Alignment.center,

                    child:Text(
                        digit.toString(),  
                        style: new TextStyle(
                            fontSize: 20.0,
                        ),
                    ),
                ),

            )

        );
    }


    Widget _buildKeyAC(BuildContext context)
    {
        return InkWell(

            onTap: () {
                setState(() {
                    degree = null;
                    decimalCounter = 0;
                    decimal = false;
                });
            },

            child: Card(

                color: Colors.blueGrey[100],
                elevation: 1.0,
                margin: const EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),

                child:Container(

                    alignment: Alignment.center,

                    child:Text(
                        "AC",  
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
            )
        );
    }

    Widget _buildKeyBackspace(BuildContext context)
    {
        return InkWell(

            onTap: () {
                setState(() {
                    if (decimal) {
                        if (decimalCounter > 0) {
                            decimalCounter--;
                            degree = (degree * pow(10, decimalCounter)).truncate()/pow(10, decimalCounter);
                            if (decimalCounter == 0){decimal = !decimal;}
                        }
                    }
                    else {
                        if (degree.abs() < 10) {degree = null;}
                        else {degree = (degree/10);}
                    }
                });
            },

            child: Card(

                color: Colors.blueGrey[100],
                elevation: 1.0,
                margin: const EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),

                child:Container(

                    alignment: Alignment.center,

                    child:Icon(
                        Icons.backspace,
                    ),
                    
                ),
            )
        );
    }

    Widget _buildKeySwape(BuildContext context)
    {
        return InkWell(

            onTap: () {
                setState(() {
                    active1 = !active1;
                    active2 = !active2;
                });
            },

            child: Card(

                color: Colors.blueGrey[100],
                elevation: 1.0,
                margin: const EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),

                child:Container(

                    alignment: Alignment.center,

                    child:Icon(
                        Icons.swap_horiz,
                    ),
                    
                ),
            )
        );
    }

    Widget _buildKeyPlusMinus(BuildContext context)
    {
        return InkWell(

            onTap: () {
                setState(() {
                    degree = -degree;
                });
            },

            child: Card(

                color: Colors.blueGrey[100],
                elevation: 1.0,
                margin: const EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),

                child:Container(

                    alignment: Alignment.center,

                    child:Text(
                        "+/-",  
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
            )
        );
    }

    Widget _buildKeyDecimal(BuildContext context)
    {
        return InkWell(

            onTap: () {
                setState(() {
                    decimal = true;
                });
            },

            child: Card(

                color: Colors.blueGrey[100],
                elevation: 1.0,
                margin: const EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),

                child:Container(

                    alignment: Alignment.center,

                    child:Text(
                        ".",  
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
            )
        );
    }

    Row tableLine(String it1, String it2,String it3,String it4)
    {
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
            Expanded(child:Container(
                    alignment: Alignment.center,
                    child:Text(it1)),
            ),
            Expanded(child:Container(
                    alignment: Alignment.center,
                    child:Text(it2)),
            ),
            Expanded(child:Container(
                    alignment: Alignment.center,
                    child:Text('=')),
            ),
            Expanded(flex: 2,child:Container(
                    alignment: Alignment.center,
                    child:Text(it3)),
            ),
            Expanded(child:Container(
                    alignment: Alignment.center,
                    child:Text(it4)),
            ),

        ],);
    }
}