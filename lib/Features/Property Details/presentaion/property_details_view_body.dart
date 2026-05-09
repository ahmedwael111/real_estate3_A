import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/cubit/similar_property_details_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/view_360_view.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/widgets/review_details_section.dart';
import 'package:real_estate3_a/features/map%20feature/presentation/map_view.dart';
import 'package:real_estate3_a/core/constant/cached_image_widget.dart';

import 'package:real_estate3_a/core/constant/custom_button.dart';
import 'package:real_estate3_a/core/constants/app_assets.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/property/property.details.entity.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/similar/similar.property.entity.dart';

class ProperyDetailsViewBody extends StatefulWidget {
  const ProperyDetailsViewBody({
    super.key,
    required this.propertyDetailsEntity,
    required this.propertyId,
  });
  final PropertyDetailsEntity propertyDetailsEntity;
  final int propertyId;
  @override
  State<ProperyDetailsViewBody> createState() => _ProperyDetailsViewBodyState();
}

class _ProperyDetailsViewBodyState extends State<ProperyDetailsViewBody> {
  late ScrollController _scrollController;
  bool _showAppBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Show app bar when scrolled past 400 pixels (image height threshold)
    bool shouldShowAppBar = _scrollController.offset > 400;
    if (shouldShowAppBar != _showAppBar) {
      setState(() {
        _showAppBar = shouldShowAppBar;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar
          ? AppBar(
              toolbarHeight: 94,
              backgroundColor: Colors.transparent,
              elevation: 1,
              shadowColor: Colors.black,
              flexibleSpace: Container(
                height: 134,
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _circleIcon(Icon(Icons.arrow_back, size: 24)),
                      const Text(
                        "Property Details",
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapRealStateView(),
                            ),
                          );
                        },
                        child: _circleIcon(
                          Image.asset(Assets.assetsShareIcon, scale: 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeaderSection(
                    propertyDetailsEntity: widget.propertyDetailsEntity,
                  ),
                  InfoSection(
                    propertyDetailsEntity: widget.propertyDetailsEntity,
                  ),
                  AgentSection(
                    propertyDetailsEntity: widget.propertyDetailsEntity,
                  ),
                  MapSection(
                    propertyDetailsEntity: widget.propertyDetailsEntity,
                  ),
                  ReviewDetailsSection(
                    propertyDetailsEntity: widget.propertyDetailsEntity,
                    propertyId: widget.propertyId,
                  ),
                  SimilarsProperityDetails(propertyId: widget.propertyId),
                ],
              ),
            ),
          ),
          BottomButtons(propertyDetailsEntity: widget.propertyDetailsEntity),
        ],
      ),
    );
  }
}

class SimilarsProperityDetails extends StatelessWidget {
  const SimilarsProperityDetails({super.key, required this.propertyId});
  final int propertyId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      SimilarPropertyDetailsCubit,
      SimilarPropertyDetailsState
    >(
      builder: (context, state) {
        if (state is SimilarPropertyDetailsLoaded) {
          return RecommendedSection(properties: state.similarProperties);
        } else if (state is SimilarPropertyDetailsFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//////////////////// HEADER ////////////////////

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.propertyDetailsEntity});
  final PropertyDetailsEntity propertyDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: CachedImageWidget(
            imageUrl: propertyDetailsEntity.images?.first.url ?? "",
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: Colors.white.withValues(alpha: 0.24),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0xFFF8F8F8)),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: Colors.white.withValues(alpha: 0.24),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0xFFF8F8F8)),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Image.asset(Assets.assetsShereIconWhite, scale: 2),
          ),
        ),
        Positioned(
          top: 50,
          right: MediaQuery.of(context).size.width / 2 - 60,
          child: Text(
            'Property Detail',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFF8F8F8),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                propertyDetailsEntity.title ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    propertyDetailsEntity.address ?? "",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    propertyDetailsEntity.rate.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//////////////////// INFO ////////////////////

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.propertyDetailsEntity});
  final PropertyDetailsEntity propertyDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Text(
                propertyDetailsEntity.price.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.sell, size: 16, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(propertyDetailsEntity.status ?? ""),
                  ],
                ),
              ),
              Expanded(child: SizedBox(width: 30)),
              const Icon(Icons.star_border, size: 24, color: Colors.grey),
            ],
          ),

          SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FeatureItem(" ${propertyDetailsEntity.bedrooms} Bedrooms"),
              FeatureItem(" ${propertyDetailsEntity.bathrooms} Bathrooms"),
              FeatureItem(" ${propertyDetailsEntity.kitchens} Kitchen"),
              FeatureItem(" 0 Garages"),
              FeatureItem(" ${propertyDetailsEntity.bedrooms} Living Room"),
              FeatureItem(" ${propertyDetailsEntity.distanceKm} Backyard"),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 6),
          Text(
            propertyDetailsEntity.description ?? "",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle_outline, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

//////////////////// AGENT ////////////////////

class AgentSection extends StatelessWidget {
  const AgentSection({super.key, required this.propertyDetailsEntity});
  final PropertyDetailsEntity propertyDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Listing Agent',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.assetsPersonPlacholder),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      propertyDetailsEntity.agent?.user?.name ??
                          "Unknown Agent",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      propertyDetailsEntity.agent?.user?.role ??
                          " Unknown Agent Role",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xFFBFF8FF),
                child: const Icon(
                  Icons.call_outlined,
                  color: Color(0xFF1597A8),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Color(0xFFBFF8FF),
                child: const Icon(
                  Icons.message_outlined,
                  color: Color(0xFF1597A8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//////////////////// MAP ////////////////////

class MapSection extends StatelessWidget {
  const MapSection({super.key, required this.propertyDetailsEntity});
  final PropertyDetailsEntity propertyDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location Address',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  propertyDetailsEntity.latitude ?? 30.057960270643694,
                  propertyDetailsEntity.longitude ?? 31.38304607580413,
                ),
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('property_location'),
                  position: LatLng(
                    propertyDetailsEntity.latitude ?? 30.057960270643694,
                    propertyDetailsEntity.longitude ?? 31.38304607580413,
                  ),
                  infoWindow: InfoWindow(
                    title: propertyDetailsEntity.title ?? "Property Location",
                  ),
                ),
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              // onMapCreated: (GoogleMapController controller) {
              //   _controller.complete(controller);
              // },
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////// REVIEWS ////////////////////

//////////////////// you must also like section ////////////////////
class RecommendedSection extends StatelessWidget {
  final List<SimilarPropertyEntity> properties;

  const RecommendedSection({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "You Must Also Like",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            itemCount: properties.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PropertyCard(property: properties[index]);
            },
          ),
        ],
      ),
    );
  }
}
//////////////////// property card ////////////////////

class PropertyCard extends StatelessWidget {
  final SimilarPropertyEntity property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE + TAG
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.circular(20),
                ),
                child: CachedImageWidget(
                  imageUrl: property.images?.first.url ?? "",

                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.sell, size: 16, color: Colors.blue),
                      SizedBox(width: 5),
                      Text(property.status ?? ""),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// CONTENT
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE + FAVORITE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        property.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.star_border),
                  ],
                ),

                const SizedBox(height: 8),

                /// LOCATION
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        property.address ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.navigation, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text("${property.distance} miles"),
                  ],
                ),

                const SizedBox(height: 12),

                /// features
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    FeatureItem(" ${property.bedrooms} Bedrooms"),
                    FeatureItem(" ${property.bathrooms} Bathrooms"),
                    FeatureItem(" ${property.kitchens} Kitchen"),
                    FeatureItem(" 0 Garages"),
                    FeatureItem(" ${property.bedrooms} Living Room"),
                    FeatureItem(" ${property.distanceKm} Backyard"),
                  ],
                ),

                const SizedBox(height: 12),

                /// PRICE + RATING
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${property.price ?? 0.0.toString()}/month",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(property.rate ?? 0.0.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////// property model ////////////////////
class Property {
  final String title;
  final String location;
  final double distance;
  final int bedrooms;
  final int bathrooms;
  final bool hasKitchen;
  final bool hasLivingRoom;
  final bool hasBackyard;
  final bool hasFamilyRoom;
  final double price;
  final double rating;
  final String image;

  Property({
    required this.title,
    required this.location,
    required this.distance,
    required this.bedrooms,
    required this.bathrooms,
    required this.hasKitchen,
    required this.hasLivingRoom,
    required this.hasBackyard,
    required this.hasFamilyRoom,
    required this.price,
    required this.rating,
    required this.image,
  });
}

//////////////////// BOTTOM ////////////////////

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, required this.propertyDetailsEntity});

  final PropertyDetailsEntity propertyDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 12,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => View360Screen(
                            imageUrls: propertyDetailsEntity.images!
                                .map((e) => e.url ?? "")
                                .toList(),
                          ),
                        ),
                      );
                    },
                    data: "Explore in 360°",
                    color: Color(0xFFBFF8FF),
                    txtcolor: Color(0xFF1597A8),
                    fontSize: 14,
                    bordercolor: Color(0xFFBFF8FF),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => const PropertyDetailstext(),
                      //   ),
                      // );
                    },
                    data: "Book a Call",
                    color: Color(0xFF1597A8),
                    txtcolor: Color(0xFFF8F8F8),
                    fontSize: 14,
                    bordercolor: Color(0xFF1597A8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _circleIcon(Widget widget) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black),
    ),
    child: widget,
  );
}
