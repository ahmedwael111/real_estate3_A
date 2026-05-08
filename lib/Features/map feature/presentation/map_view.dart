import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRealStateView extends StatefulWidget {
  const MapRealStateView({super.key});

  @override
  State<MapRealStateView> createState() => _MapRealStateViewState();
}

class _MapRealStateViewState extends State<MapRealStateView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  /// البيانات اللي جاية من الـ API مثلا
  final List<Map<String, dynamic>> places = [
    {
      "title": "New Cairo Garden Villa — Type A",
      "latitude": 30.02,
      "longitude": 31.48,
    },
    {
      "title": "Marina North Coast Villa (Summer)",
      "latitude": 30.018,
      "longitude": 31.505,
    },
    {
      "title": "Katameya Heights Golf Villa",
      "latitude": 30.005,
      "longitude": 31.422,
    },
    {
      "title": "Catalog Listing #2104 — Juwanmouth Plaza",
      "latitude": 30.0169899,
      "longitude": 31.2516783,
    },
    {
      "title": "Catalog Listing #2108 — South Ricardo Tower",
      "latitude": 30.1395633,
      "longitude": 31.2063452,
    },
  ];

  late Set<Marker> markers;

  @override
  void initState() {
    super.initState();

    markers = places.map((place) {
      return Marker(
        markerId: MarkerId(place["title"]),
        position: LatLng(place["latitude"], place["longitude"]),
        infoWindow: InfoWindow(title: place["title"]),
      );
    }).toSet();
  }

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(30.057960270643694, 31.38304607580413),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// MAP
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),

          /// TOP UI
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// SEARCH BAR
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search),

                              SizedBox(width: 10),

                              Text(
                                "Search your home",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.tune),
                      ),
                    ],
                  ),

                  const Spacer(),

                  /// BOTTOM CARD
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1568605114967-8130f3a36994",
                            width: 111,
                            height: 83,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SunnysIade House",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                "Beverly Hills, CA",
                                style: TextStyle(color: Colors.grey),
                              ),

                              SizedBox(height: 8),

                              Row(
                                children: [
                                  Icon(
                                    Icons.near_me,
                                    size: 18,
                                    color: Colors.grey,
                                  ),

                                  SizedBox(width: 4),

                                  Text(
                                    "50 miles",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
