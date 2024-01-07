import 'package:flutter/material.dart';
import 'package:news/constant/constant.dart';

class SeachScreen extends StatelessWidget {
  const SeachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.deviceHeight() * .2),
        child: ColoredBox(
          color: colorScheme.surfaceVariant,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 5, top: 40),
            child: TextField(
                cursorWidth: 1.5,
                keyboardType: TextInputType.text,
                // onSubmitted: (value) {},
                // controller: ,

                decoration: InputDecoration(
                  hintText: "Search for topics,location",
                  // hintStyle: GoogleFonts.poppins(
                  //   fontSize: 11,
                  //   letterSpacing: 0.3,
                  //   color: Colors.grey,
                  // ),

                  prefixIcon: Icon(Icons.arrow_back_ios_new_rounded),
                  //   suffixIcon: Icon(Icons.)
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: InputBorder.none,

                  // errorBorder: const OutlineInputBorder(
                  //     borderRadius: BorderRadius.zero,
                  //     borderSide: BorderSide.none),
                  enabledBorder: InputBorder.none,
                  //  disabledBorder: const OutlineInputBorder(
                  //     borderRadius: BorderRadius.zero,
                  //     borderSide: BorderSide.none),
                  focusedBorder: InputBorder.none,
                )),
          ),
        ),
        // const ChooseSearchTag(),
      ),
      body: const Column(
        children: [
          // HEADER
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'What are you looking for ?',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
