import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class FlatSearchBar extends StatefulWidget {
  @override
  _FlatSearchBarState createState() => _FlatSearchBarState();
}

class _FlatSearchBarState extends State<FlatSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(DesignSystem.rounded),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.75,
        height: 60,
        child: TextFormField(
          obscureText: false,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            filled: true,
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
