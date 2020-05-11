
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:provider/provider.dart';
//import 'package:uber_clone/states/app_state.dart';
import '../utils/core.dart';
class MyHomePage extends StatefulWidget
{
    MyHomePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
                   body: Map()
               );
    }
}

class Map extends StatefulWidget
{
    @override
    _MapState createState() => _MapState();
}

class _MapState extends State<Map>
{
    GoogleMapController mapController;
    static const _initialPosition=LatLng(12.92,77.02);
    LatLng _lastPosition = _initialPosition;
    final Set<Marker> _markers= {};

    @override
    Widget build(BuildContext context)
    {
        return  Stack(
                    children:<Widget>[
                        GoogleMap(
                            initialCameraPosition:CameraPosition(target:_initialPosition,
                                    zoom:10.0),
                            onMapCreated: onCreated,
                            myLocationButtonEnabled: true,
                            mapType: MapType.satellite,
                            compassEnabled: true,
                            markers: _markers,
                            onCameraMove: _onCameraMove,
                        ),
                        Positioned(
                            top: 40,
                            right: 10,
                            child: FloatingActionButton(onPressed: _onAddMarkerPressed,
                                    tooltip:"aadd marker",
                                    backgroundColor: black,
                                    child: Icon(Icons.add_location, color: white,),),
                        ),
                    ],
                );
    }

    void onCreated(GoogleMapController controller)
    {
        setState(()
        {
            mapController=controller;
        });
    }
}  
    void _onCameraMove(CameraPosition position)
    {
        setState(()
        {
            // _lastPosition =position.target;
            _lastPosition = position.target;


        });
    }

    void _onAddMarkerPressed()
    {
        setState(()
        {
            _markers.add(Marker(markerId: MarkerId(_lastPosition.toString()),
                                position: _lastPosition,
                                infoWindow: InfoWindow(
                                    title: "remember here",
                                    snippet: "good place"
                                ),
                                icon: BitmapDescriptor.defaultMarker
                               ));
        });

    }
}
