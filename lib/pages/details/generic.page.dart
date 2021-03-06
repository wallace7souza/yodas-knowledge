import 'package:flutter/material.dart';
import 'package:yodas_knowledge/models/generic.model.dart';
import 'package:yodas_knowledge/pages/details/film.page.dart';
import 'package:yodas_knowledge/pages/details/people.page.dart';

class GenericPage extends StatelessWidget {
  GenericModel _model;
  String _imageUrl = "https://starwars-visualguide.com/assets/img/";
  GenericPage(GenericModel model) {
    this._model = model;
  }

  @override
  Widget build(BuildContext context) {
    var page = generateDetailComponent(this._model);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(this._model.genericTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: SizedBox(
                width: 600,
                height: 400,
                child: Image.network (this._imageUrl),
              )
              ,
            ),
            Container(
              child: page,
            )
          ],
        ),
      ),
    ));
  }

  StatelessWidget generateDetailComponent(GenericModel model) {
    var runtimeType = _model.runtimeType.toString();

    if (runtimeType == "FilmModel") {
      this._imageUrl = this._imageUrl + "films/" + model.id.toString() + ".jpg";
      print(this._imageUrl);
      return FilmPage(model);
    } else if (runtimeType == "PeopleModel") {
      this._imageUrl = this._imageUrl + "characters/" + model.id.toString() + ".jpg";
      return PeoplePage(model);
    } else if (runtimeType == "PlanetModel") {
    } else if (runtimeType == "SpecieModel") {
    } else if (runtimeType == "StarshipModel") {
    } else if (runtimeType == "VehicleModel") {}
  }
}
