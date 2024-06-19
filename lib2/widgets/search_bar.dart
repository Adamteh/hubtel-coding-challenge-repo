import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE6EAED),
          contentPadding: const EdgeInsets.all(8),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFE6EAED), width: 2.0),
            borderRadius: BorderRadius.circular(6.0),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE6EAED)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE6EAED)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          labelText: "Search",
          labelStyle: const TextStyle(
            color: Color(0xFF9CABB8),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset("assets/search.svg"),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 12,
            minHeight: 10,
          ),
        ),
      ),
    );
  }
}
