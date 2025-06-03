import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MaterialApp(home: MapAnimationExample()));
}

class MapAnimationExample extends StatefulWidget {
  const MapAnimationExample({super.key});

  @override
  State<MapAnimationExample> createState() => _MapAnimationExampleState();
}

class _MapAnimationExampleState extends State<MapAnimationExample> {
  GoogleMapController? _mapController;
  final List<LatLng> _route = [
    LatLng(40.757511, -73.965019),
    LatLng(40.758029, -73.966248),
    LatLng(40.757381, -73.966702),
    LatLng(40.756763, -73.967166),
    LatLng(40.756822, -73.967288),
    LatLng(40.757549, -73.969025),
    LatLng(40.757986, -73.970070),
    LatLng(40.758378, -73.970990),
    LatLng(40.758867, -73.972156),
    LatLng(40.759416, -73.973468),
    LatLng(40.759733, -73.974231),
    LatLng(40.760068, -73.975034),
    LatLng(40.760839, -73.976860),
    LatLng(40.761616, -73.978670),
    LatLng(40.761774, -73.979063),
    LatLng(40.762298, -73.980314),
    LatLng(40.763382, -73.982903),
    LatLng(40.765366, -73.987575),
    LatLng(40.759881, -73.991568),
    LatLng(40.759104, -73.992138),
    LatLng(40.758433, -73.992646),
    LatLng(40.757840, -73.993073),
    LatLng(40.757917, -73.993193),
    LatLng(40.758331, -73.994170),
    LatLng(40.758402, -73.994519),
    LatLng(40.758945, -73.995800),
    LatLng(40.759027, -73.996092),
    LatLng(40.759388, -73.996954),
    LatLng(40.758846, -73.997578),
    LatLng(40.758769, -73.997681),
    LatLng(40.758700, -73.997834),
    LatLng(40.758677, -73.997978),
    LatLng(40.758680, -73.998058),
    LatLng(40.758698, -73.998190),
    LatLng(40.758782, -73.998505),
    LatLng(40.758815, -73.998772),
    LatLng(40.758869, -73.999200),
    LatLng(40.758916, -73.999441),
    LatLng(40.758968, -73.999652),
    LatLng(40.759034, -73.999867),
    LatLng(40.767252, -74.019392),
    LatLng(40.767335, -74.019634),
    LatLng(40.767400, -74.019887),
    LatLng(40.767445, -74.020146),
    LatLng(40.767471, -74.020410),
    LatLng(40.767477, -74.020676),
    LatLng(40.767464, -74.020941),
    LatLng(40.767431, -74.021203),
    LatLng(40.767379, -74.021460),
    LatLng(40.767307, -74.021710),
    LatLng(40.767218, -74.021948),
    LatLng(40.767111, -74.022174),
    LatLng(40.766989, -74.022385),
    LatLng(40.766851, -74.022579),
    LatLng(40.766699, -74.022754),
    LatLng(40.766535, -74.022909),
    LatLng(40.766535, -74.022909),
    LatLng(40.765889, -74.023463),
    LatLng(40.765673, -74.023629),
    LatLng(40.765433, -74.023794),
    LatLng(40.765150, -74.023906),
    LatLng(40.764810, -74.024076),
    LatLng(40.764619, -74.024168),
    LatLng(40.764501, -74.024241),
    LatLng(40.764285, -74.024400),
    LatLng(40.763874, -74.024735),
    LatLng(40.763813, -74.024767),
    LatLng(40.763695, -74.024797),
    LatLng(40.763614, -74.024800),
    LatLng(40.763538, -74.024789),
    LatLng(40.763357, -74.024733),
    LatLng(40.763186, -74.024647),
    LatLng(40.763043, -74.024542),
    LatLng(40.762917, -74.024408),
    LatLng(40.762820, -74.024259),
    LatLng(40.762736, -74.024073),
    LatLng(40.762681, -74.023875),
    LatLng(40.762656, -74.023660),
    LatLng(40.762658, -74.023446),
    LatLng(40.762693, -74.023242),
    LatLng(40.762757, -74.023024),
    LatLng(40.762824, -74.022883),
    LatLng(40.762931, -74.022724),
    LatLng(40.763038, -74.022610),
    LatLng(40.763173, -74.022509),
    LatLng(40.763611, -74.022268),
    LatLng(40.764011, -74.022083),
    LatLng(40.764306, -74.021954),
    LatLng(40.764869, -74.021739),
    LatLng(40.765298, -74.021595),
    LatLng(40.765735, -74.021464),
    LatLng(40.766147, -74.021364),
    LatLng(40.766757, -74.021250),
    LatLng(40.766922, -74.021254),
    LatLng(40.767088, -74.021276),
    LatLng(40.767270, -74.021332),
    LatLng(40.767379, -74.021378),
    LatLng(40.767618, -74.021524),
    LatLng(40.767744, -74.021640),
    LatLng(40.767924, -74.021841),
    LatLng(40.768044, -74.022014),
    LatLng(40.768132, -74.022167),
    LatLng(40.769120, -74.024387),
    LatLng(40.769970, -74.026311),
    LatLng(40.770108, -74.026634),
    LatLng(40.770366, -74.027260),
    LatLng(40.770536, -74.027697),
    LatLng(40.770767, -74.028292),
    LatLng(40.771034, -74.028942),
    LatLng(40.771457, -74.029886),
    LatLng(40.773052, -74.033129),
    LatLng(40.773539, -74.034174),
    LatLng(40.773727, -74.034610),
    LatLng(40.773921, -74.035092),
    LatLng(40.774199, -74.035841),
    LatLng(40.774931, -74.037867),
    LatLng(40.775341, -74.039057),
    LatLng(40.775435, -74.039315),
    LatLng(40.775971, -74.040798),
    LatLng(40.776574, -74.042412),
    LatLng(40.776740, -74.042780),
    LatLng(40.776853, -74.043064),
    LatLng(40.776931, -74.043227),
    LatLng(40.777040, -74.043436),
    LatLng(40.777220, -74.043719),
    LatLng(40.777369, -74.043915),
    LatLng(40.777649, -74.044223),
    LatLng(40.778627, -74.045222),
    LatLng(40.778909, -74.045472),
    LatLng(40.779100, -74.045617),
    LatLng(40.779298, -74.045752),
    LatLng(40.779492, -74.045844),
    LatLng(40.779689, -74.045968),
    LatLng(40.780224, -74.046273),
    LatLng(40.780537, -74.046414),
    LatLng(40.780704, -74.046479),
    LatLng(40.780837, -74.046587),
    LatLng(40.782417, -74.047048),
    LatLng(40.784088, -74.047573),
    LatLng(40.784438, -74.047662),
    LatLng(40.784762, -74.047772),
    LatLng(40.785023, -74.047874),
    LatLng(40.785609, -74.048134),
    LatLng(40.786511, -74.048656),
    LatLng(40.786814, -74.048859),
    LatLng(40.787384, -74.049279),
    LatLng(40.787700, -74.049538),
    LatLng(40.788196, -74.049992),
    LatLng(40.788733, -74.050547),
    LatLng(40.788974, -74.050828),
    LatLng(40.789452, -74.051426),
    LatLng(40.793996, -74.057825),
    LatLng(40.794491, -74.058489),
    LatLng(40.795671, -74.060128),
    LatLng(40.796348, -74.061052),
    LatLng(40.797146, -74.062179),
    LatLng(40.798186, -74.063595),
    LatLng(40.798915, -74.064563),
    LatLng(40.803444, -74.070767),
    LatLng(40.804036, -74.071606),
    LatLng(40.805331, -74.073384),
    LatLng(40.805768, -74.074022),
  ];
  int _currentIndex = 0;
  Timer? _timer;
  Marker? _movingMarker;

  @override
  void initState() {
    super.initState();
    _startAnimation();

  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (_currentIndex >= _route.length) {
        timer.cancel();
        return;
      }

      final position = _route[_currentIndex];
      setState(() {
        _movingMarker = Marker(
          markerId: const MarkerId('moving'),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        );
      });

      _mapController?.moveCamera(
        CameraUpdate.newLatLng(position),
      );

      _currentIndex++;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final polyline = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.blue,
      width: 4,
      points: _route,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('iOS Google Maps Marker Bug')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _currentIndex = 0; // Reset the index to restart the animation
          _startAnimation();
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 15,
        ),
        onMapCreated: (controller) => _mapController = controller,
        markers: {
          if (_movingMarker != null) _movingMarker!,
        },
        polylines: {
          if (_route.isNotEmpty) polyline,
        },
      ),
    );
  }
}