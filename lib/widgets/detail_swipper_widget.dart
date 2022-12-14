import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:event_app/core/models/events_name.dart';
import 'package:event_app/core/router_constants.dart';

class DetailSwipper extends StatelessWidget {
  DetailSwipper({
    Key key,
    @required List<String> events,
    @required List<String> eventsName,
  })  : _events = events,
        super(key: key);
  final List<String> eventsName = EventsName.eventsName;
  final List<String> _events;
  @override
  Widget build(BuildContext context) {
    return _swipper(context);
  }

  Swiper _swipper(BuildContext context) {
    return Swiper(
      onTap: (index) => Navigator.pushNamed(context, detailsPageViewRoute,
          arguments: _events[index]),
      duration: 500,
      itemCount: 4,
      viewportFraction: 0.7,
      scale: 0.5,
      axisDirection: AxisDirection.right,
      itemBuilder: (BuildContext context, int index) {
        return _containerArea(index, context);
      },
    );
  }

  Container _containerArea(int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          _image(index, context),
          _iconPadding(),
          _positioned(index),
        ],
      ),
    );
  }

  Image _image(int index, BuildContext context) {
    return Image.network(
      _events[index],
      fit: BoxFit.fill,
      height: MediaQuery.of(context).size.height * .5,
    );
  }

  Padding _iconPadding() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.favorite,
        color: Colors.white,
      ),
    );
  }

  Positioned _positioned(int index) {
    return Positioned(
      bottom: 15,
      left: 20,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          _dateText(),
          _eventsNameText(index),
        ],
      ),
    );
  }

  Text _eventsNameText(int index) {
    return Text(
      eventsName[index],
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _dateText() {
    return const Text(
      '25-26 June,2022',
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
