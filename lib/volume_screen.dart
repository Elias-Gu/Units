import 'package:flutter/material.dart';
import './ext/units_icons_icons.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import './ext/util.dart';

class VolumeScreen extends StatefulWidget
{
    @override
    VolumeScreenState createState() => new VolumeScreenState();
}

class VolumeScreenState extends State<VolumeScreen> 
{
    List<String> units1 = [" ", "l", "dl", "cl", "ml", " "];
    List<String> units2 = [" ", "gal", "cp", "fl oz", "tbsp", "tsp", " "];
    List<int> test1 = [1,2,3,4];
    List<int> test2 = [1,2,3,4,5];
    static double initUnit1 = 2;    // Hot restart
    static double initUnit2 = 2;
    List<int> numActiveTrue = [initUnit1.round()+1,initUnit2.round()+1];    // <=== Gives active unit

    static double initPos;

    bool active1 = true;
    bool active2 = false;
    Color activeColor = Colors.blue[400];
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
    double _getLFromGal()
    {
        if (degree != null)
            return degree * 0.2642;
        else return null;
    }
    double _getDlFromGal()
    {
        if (degree != null)
            return _getLFromGal()/10;
        else return null;
    }
    double _getClFromGal()
    {
        if (degree != null)
            return _getDlFromGal()/10;
        else return null;
    }
    double _getMlFromGal()
    {
        if (degree != null)
            return _getClFromGal()/10;
        else return null;
    }
    // Units 2 -> 2
    double _getLFromCp()
    {
        if (degree != null)
            return degree*4.2268;
        else return null;
    }
    double _getDlFromCp()
    {
        if (degree != null)
            return _getLFromCp()/10;
        else return null;
    }
    double _getClFromCp()
    {
        if (degree != null)
            return _getDlFromCp()/10;
        else return null;
    }
    double _getMlFromCp()
    {
        if (degree != null)
            return _getClFromCp()/10;
        else return null;
    }

    // Units 2 -> 3
    double _getLFromOz()
    {
        if (degree != null)
            return degree *33.8140;
        else return null;
    }
    double _getDlFromOz()
    {
        if (degree != null)
            return _getLFromOz() / 10;
        else return null;
    }
    double _getClFromOz()
    {
        if (degree != null)
            return _getDlFromOz()/10;
        else return null;
    }
    double _getMlFromOz()
    {
        if (degree != null)
            return _getClFromOz()/10;
        else return null;
    }

    // Units 2 -> 4
    double _getLFromTbsp()
    {
        if (degree != null)
            return _getDlFromTbsp()*10;
        else return null;
    }
    double _getDlFromTbsp()
    {
        if (degree != null)
            return degree*6.7628;
        else return null;
    }
    double _getClFromTbsp()
    {
        if (degree != null)
            return _getDlFromTbsp()/10;
        else return null;
    }
    double _getMlFromTbsp()
    {
        if (degree != null)
            return _getClFromTbsp()/10;
        else return null;
    }

    //Units 2->5
    double _getLFromTsp()
    {
        if (degree != null)
            return _getDlFromTsp()*10;
        else return null;
    }
    double _getDlFromTsp()
    {
        if (degree != null)
            return _getClFromTsp()*10;
        else return null;
    }
    double _getClFromTsp()
    {
        if (degree != null)
            return degree * 2.028841;
        else return null;
    }
    double _getMlFromTsp()
    {
        if (degree != null)
            return _getClFromTsp()/10;
        else return null;
    }


    // IMP TO METRIC
    //Units2 ->1
    double _getGalFromL(){
        if (degree != null) return degree * 3.7854;
        else return null;
    }
    double _getGalFromDl(){
        if (degree != null) return _getGalFromL() * 10;
        else return null;
    }
    double _getGalFromCl(){
        if (degree != null) return _getGalFromDl() * 10;
        else return null;
    }
    double _getGalFromMl(){
        if (degree != null) return _getGalFromCl() * 10;
        else return null;
    }

    // Units2 ->2
    double _getCpFromL(){
        if (degree != null) return _getCpFromDl() /10;
        else return null;
    }
    double _getCpFromDl(){
        if (degree != null) return degree * 2.3659;
        else return null;
    }
    double _getCpFromCl(){
        if (degree != null) return _getCpFromDl() * 10;
        else return null;
    }
    double _getCpFromMl(){
        if (degree != null) return _getCpFromCl() * 10;
        else return null;
    }

    // Units2 ->3
    double _getOzFromL(){
        if (degree != null) return _getOzFromDl() /10;
        else return null;
    }
    double _getOzFromDl(){
        if (degree != null) return _getOzFromCl()/10;
        else return null;
    }
    double _getOzFromCl(){
        if (degree != null) return degree * 2.9574;
        else return null;
    }
    double _getOzFromMl(){
        if (degree != null) return _getOzFromCl() * 10;
        else return null;
    }

    //Units3 ->4
    double _getTbspFromL(){
        if (degree != null) return _getTbspFromDl() /10;
        else return null;
    }
    double _getTbspFromDl(){
        if (degree != null) return _getTbspFromCl()/10;
        else return null;
    }
    double _getTbspFromCl(){
        if (degree != null) return _getTbspFromMl()/10;
        else return null;
    }
    double _getTbspFromMl(){
        if (degree != null) return degree * 14.7868;
        else return null;
    }

        //Units3 ->5
    double _getTspFromL(){
        if (degree != null) return _getTspFromDl() /10;
        else return null;
    }
    double _getTspFromDl(){
        if (degree != null) return _getTspFromCl()/10;
        else return null;
    }
    double _getTspFromCl(){
        if (degree != null) return _getTspFromMl()/10;
        else return null;
    }
    double _getTspFromMl(){
        if (degree != null) return degree * 4.9289;
        else return null;
    }
    
    double _getDesiredValue(double inDegree, bool active)
    {
        double deg;
        if (active) {deg = inDegree;}
        else if (inDegree == null){return null;}
        else {
            if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getLFromGal();
            else if (active1 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getDlFromGal();
            else if (active1 && numActiveTrue[0] == 3 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getClFromGal();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getMlFromGal();

            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 2)
                deg = _getLFromCp();
            else if (active1 && numActiveTrue[0] == 2 && numActiveTrue[1] == 2)
                deg = _getDlFromCp();
            else if (active1 && numActiveTrue[0] == 3 && numActiveTrue[1] == 2)
                deg = _getClFromCp();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 2)
                deg = _getMlFromCp();

            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 3)
                deg = _getLFromOz();
            else if (active1 && numActiveTrue[0] == 2 && numActiveTrue[1] == 3)
                deg = _getDlFromOz();
            else if (active1 && numActiveTrue[0] == 3 && numActiveTrue[1] == 3)
                deg = _getClFromOz();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 3)
                deg = _getMlFromOz();

            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 4)
                deg = _getLFromTbsp();
            else if (active1 && numActiveTrue[0] == 2 && numActiveTrue[1] == 4)
                deg = _getDlFromTbsp();
            else if (active1 && numActiveTrue[0] == 3 && numActiveTrue[1] == 4)
                deg = _getClFromTbsp();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 4)
                deg = _getMlFromTbsp();

            else if (active1 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getLFromTsp();
            else if (active1 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getDlFromTsp();
            else if (active1 && numActiveTrue[0] == 3 && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getClFromTsp();
            else if (active1 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getMlFromTsp();

        

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getGalFromL();
            else if (active2 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getGalFromDl();
            else if (active2 && numActiveTrue[0] == 3 && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getGalFromCl();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && (numActiveTrue[1] == 1 || numActiveTrue[1] == 0))
                deg = _getGalFromMl();

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 2)
                deg = _getCpFromL();
            else if (active2 && numActiveTrue[0] == 2 && numActiveTrue[1] == 2)
                deg = _getCpFromDl();
            else if (active2 && numActiveTrue[0] == 3 && numActiveTrue[1] == 2)
                deg = _getCpFromCl();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 2)
                deg = _getCpFromMl();

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 3)
                deg = _getOzFromL();
            else if (active2 && numActiveTrue[0] == 2 && numActiveTrue[1] == 3)
                deg = _getOzFromDl();
            else if (active2 && numActiveTrue[0] == 3 && numActiveTrue[1] == 3)
                deg = _getOzFromCl();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 3)
                deg = _getOzFromMl();

            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && numActiveTrue[1] == 4)
                deg = _getTbspFromL();
            else if (active2 && numActiveTrue[0] == 2 && numActiveTrue[1] == 4)
                deg = _getTbspFromDl();
            else if (active2 && numActiveTrue[0] == 3 && numActiveTrue[1] == 4)
                deg = _getTbspFromCl();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && numActiveTrue[1] == 4)
                deg = _getTbspFromMl();


            else if (active2 && (numActiveTrue[0] == 1 || numActiveTrue[0] == 0) && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getTspFromL();
            else if (active2 && numActiveTrue[0] == 2 && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getTspFromDl();
            else if (active2 && numActiveTrue[0] == 3 && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getTspFromCl();
            else if (active2 && (numActiveTrue[0] == 4 || numActiveTrue[0] == 5) && (numActiveTrue[1] == 5 || numActiveTrue[1] == 6))
                deg = _getTspFromMl();

        }
        return deg;
    }
    
    bool decimal = false;
    int decimalCounter = 0;
    String _getDegreeString(double inDegree, bool active)
    {
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
                            color: Colors.blue[400],
                            ),
                        ),
                    ),

                    tableLine('1', 'cl', '2.0288', 'tsp'),
                    tableLine('1', 'dl', '3.3814', 'fl oz'),
                    tableLine('1', 'l', '4.2268', 'cp'),
                    tableLine('1', 'l', '0.2642', 'gal'),
                    
                    Text(
                        '\nImperial',
                        style: new TextStyle(fontWeight: FontWeight.bold)
                    ),
                    new SizedBox(
                        height: 4.0,
                        child: new Center(
                            child: new Container(
                            height: 2.0,
                            color: Colors.blue[400],
                            ),
                        ),
                    ),

                    tableLine('1', 'tsp', '4,9289', 'ml'),
                    tableLine('1', 'tbsp', '3', 'tsp'),
                    tableLine('1', 'tbsp', '14,7868', 'ml'),
                    tableLine('1', 'fl oz', '2', 'tbsp'),                    
                    tableLine('1', 'fl oz', '29,5735', 'ml'),    
                    tableLine('1', 'cp', '8', 'fl oz'),
                    tableLine('1', 'cp', '2.3659', 'cl'),
                    tableLine('1', 'gal', '3,7854', 'l'),


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
                                    color: Colors.blue[400],
                                ),
                            ),

                            Expanded(
                                flex:7,
                                child: Text(
                                    "   Volume",  
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
                                    icon:Icon(UnitsIcons.volume),
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
                            color: Colors.blue[400],
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