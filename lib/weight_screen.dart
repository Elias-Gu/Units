import 'package:flutter/material.dart';
import './ext/units_icons_icons.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import './ext/util.dart';

class WeightScreen extends StatefulWidget
{
    @override
    WeightScreenState createState() => new WeightScreenState();
}

class WeightScreenState extends State<WeightScreen> 
{
    List<String> units1 = [" ", "kg", "g", "mg", " "];
    List<String> units2 = [" ", "lb", "oz", " "];
    List<int> test1 = [1,2,3];
    List<int> test2 = [1,2];
    static double initUnit1 = 0;    // Hot restart
    static double initUnit2 = 0;
    List<int> numActiveTrue = [initUnit1.round()+1,initUnit2.round()+1];    // <=== Gives active unit

    bool _doubleUnit()
    {
        return numActiveTrue[1] == 3 ? true :  false;
    }

    static double initPos;

    bool active1 = true;
    bool active2 = false;
    Color activeColor = Colors.grey[600];
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
    double _getKgFromLb()
    {
        if (degree != null)
            return degree * 2.2046;
        else return null;
    }
    double _getGFromLb()
    {
        if (degree != null)
            return _getKgFromLb()/1000;
        else return null;
    }
    double _getMgFromLb()
    {
        if (degree != null)
            return _getGFromLb()/1000;
        else return null;
    }
    double _getKgFromOz()
    {
        if (degree != null)
            return _getKgFromLb()*16;
        else return null;
    }
    double _getGFromOz()
    {
        if (degree != null)
            return _getKgFromOz()/1000;
        else return null;
    }
    double _getMgFromOz()
    {
        if (degree != null)
            return _getGFromOz()/1000;
        else return null;
    }

    double _getLbFromKg(){
        if (degree != null) return degree * 0.4536;
        else return null;
    }
    double _getLbFromG(){
        if (degree != null) return _getLbFromKg() *1000;
        else return null;
    }
    double _getLbFromMg(){
        if (degree != null) return _getLbFromG() *1000;
        else return null;
    }
    double _getOzFromKg(){
        if (degree != null) return _getLbFromKg()/16;
        else return null;
    }
    double _getOzFromG(){
        if (degree != null) return _getOzFromKg() *1000;
        else return null;
    }
    double _getOzFromMg(){
        if (degree != null) return _getOzFromG() *1000;
        else return null;
    } 
    String _getLbOzFromKg()
    {
        if (degree == null) return " ";
        else if (degree <0)
        return '-${_getKgFromLb().abs().floor()}lb -${((_getKgFromLb().abs() - _getKgFromLb().abs().floor()) * 16).abs().round()}oz';
        else return '${_getKgFromLb().abs().floor()}lb ${((_getKgFromLb().abs() - _getKgFromLb().abs().floor()) * 16).abs().round()}oz';
    }
    String _getLbOzFromG()
    {
        if (degree == null) return " ";
        else if (degree <0)
        return '-${_getGFromLb().abs().floor()}lb -${((_getGFromLb().abs() - _getGFromLb().abs().floor()) * 16).abs().round()}oz';
        else return '${_getGFromLb().abs().floor()}lb ${((_getGFromLb().abs() - _getGFromLb().abs().floor()) * 16).abs().round()}oz';
    }
    String _getLbOzFromMg()
    {
        if (degree == null) return " ";
        else if (degree <0)
        return '-${_getMgFromLb().abs().floor()}lb -${((_getMgFromLb().abs() - _getMgFromLb().abs().floor()) * 16).abs().round()}oz';
        else return '${_getMgFromLb().abs().floor()}lb ${((_getMgFromLb().abs() - _getMgFromLb().abs().floor()) * 16).abs().round()}oz';
    }

    String _getDesiredString()
    {
        if (numActiveTrue[0] == 1)
            return _getLbOzFromKg();
        else if (numActiveTrue[0] == 2)
            return _getLbOzFromG();
        else if (numActiveTrue[0] == 3)
            return _getLbOzFromMg();
        else return " ";
    }
    
    double _getDesiredValue(double inDegree, bool active)
    {
        double deg;
        if (active) {deg = inDegree;}
        else if (inDegree == null){return null;}
        else {
            if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getKgFromLb();
            else if (active1 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getGFromLb();
            else if (active1 && (numActiveTrue[0] == 3 || numActiveTrue[0] == 4) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMgFromLb();
            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 2)
                deg = _getKgFromOz();
            else if (active1 && numActiveTrue[0] == 2 && numActiveTrue[1] == 2)
                deg = _getGFromOz();
            else if (active1 && (numActiveTrue[0] == 3 || numActiveTrue[0] == 4) && numActiveTrue[1] == 2)
                deg = _getMgFromOz();
            
            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getLbFromKg();
            else if (active2 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getLbFromG();
            else if (active2 && (numActiveTrue[0] == 3 || numActiveTrue[0] == 4) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getLbFromMg();
            else if (active2 && (numActiveTrue[0] == 0 || numActiveTrue[0] == 1) && (numActiveTrue[1] == 2 || numActiveTrue[1] == 3))
                deg = _getOzFromKg();
            else if (active2 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 2 || numActiveTrue[1] == 3))
                deg = _getOzFromG();
            else if (active2 && (numActiveTrue[0] == 3 || numActiveTrue[0] == 4) && (numActiveTrue[1] == 2 || numActiveTrue[1] == 3))
                deg = _getOzFromMg();

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
                            color: Colors.grey[600],
                            ),
                        ),
                    ),

                    tableLine('1', 'g', '0.0353', 'oz'),
                    tableLine('1', 'kg', '2.2046', 'lb'),
                    
                    Text(
                        '\nImperial',
                        style: new TextStyle(fontWeight: FontWeight.bold)
                    ),
                    new SizedBox(
                        height: 4.0,
                        child: new Center(
                            child: new Container(
                            height: 2.0,
                            color: Colors.grey[600],
                            ),
                        ),
                    ),

                    tableLine('1', 'oz', '28.35', 'g'),
                    tableLine('1', 'lb', '16', 'oz'),
                    tableLine('1', 'lb', '0.4536', 'kg'),


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
                                    color: Colors.grey[600],
                                ),
                            ),

                            Expanded(
                                flex:7,
                                child: Text(
                                    "   Weight",  
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
                                    icon:Icon(UnitsIcons.weight),
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
                            color: Colors.grey[600],
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