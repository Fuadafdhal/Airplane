import 'package:airplan/cubit/auth_cubit.dart';
import 'package:airplan/cubit/destination_cubit.dart';
import 'package:airplan/models/destination_model.dart';
import 'package:airplan/shared/theme.dart';
import 'package:airplan/ui/widgets/destination_card.dart';
import 'package:airplan/ui/widgets/destination_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DestinationModel> destinationsData = [
      DestinationModel(
        id: '1',
        name: 'Kale Ciliwung',
        city: 'Tangerang',
        imageUrl: 'assets/image_destination1.png',
        rating: 4.5,
      ),
      DestinationModel(
        id: '2',
        name: 'White House',
        city: 'Spain',
        imageUrl: 'assets/image_destination2.png',
        rating: 4.7,
      ),
      DestinationModel(
        id: '3',
        name: 'Hill Heyo',
        city: 'Monaco',
        imageUrl: 'assets/image_destination3.png',
        rating: 4.8,
      ),
      DestinationModel(
        id: '4',
        name: 'Menarra',
        city: 'Japan',
        imageUrl: 'assets/image_destination4.png',
        rating: 4.6,
      ),
      DestinationModel(
        id: '5',
        name: 'Payung Teduh',
        city: 'Singapore',
        imageUrl: 'assets/image_destination5.png',
        rating: 4.7,
      ),
    ];

    List<DestinationModel> thisYeardData = [
      DestinationModel(
        id: '1',
        name: 'Danau Berantan',
        city: 'Singajara',
        imageUrl: 'assets/image_destination6.png',
        rating: 4.5,
      ),
      DestinationModel(
        id: '2',
        name: 'Sydny Opera',
        city: 'Austalia',
        imageUrl: 'assets/image_destination7.png',
        rating: 4.7,
      ),
      DestinationModel(
        id: '3',
        name: 'Roma',
        city: 'Italy',
        imageUrl: 'assets/image_destination8.png',
        rating: 4.8,
      ),
      DestinationModel(
        id: '4',
        name: 'Payung Teduh',
        city: 'Singapore',
        imageUrl: 'assets/image_destination9.png',
        rating: 4.7,
      ),
      DestinationModel(
        id: '5',
        name: 'Hell Hey',
        city: 'Monaco',
        imageUrl: 'assets/image_destination10.png',
        rating: 4.5,
      ),
    ];

    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_profile.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destination) {
              return DestinationCard(destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: destinations.map((DestinationModel destination) {
                return DestinationTile(destination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestinations(state.destinations),
              newDestinations(state.destinations),
            ],
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
