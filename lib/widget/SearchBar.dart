import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class OmorfiasSearchBar extends StatefulWidget {
  @override
  _OmorfiasSearchBarState createState() => _OmorfiasSearchBarState();
}

class _OmorfiasSearchBarState extends State<OmorfiasSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: DesignSystem.spacingMargin),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(DesignSystem.rounded),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(204, 204, 204, 1),
                offset: Offset.fromDirection(1, 3),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ]),
        child: TextFormField(
          obscureText: false,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 60, right: 10),
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
            ),
            hintText: 'Pesquisar por serviço',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(DesignSystem.rounded),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
