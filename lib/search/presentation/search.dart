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
          color: colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 40),
            child: TextField(
                cursorWidth: 1.5,
                keyboardType: TextInputType.text,
                onSubmitted: (value) {},
                // controller: ,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF666666)),
                decoration: InputDecoration(
                  hintText: "Search for topics,location",
                  // hintStyle: GoogleFonts.poppins(
                  //   fontSize: 11,
                  //   letterSpacing: 0.3,
                  //   color: Colors.grey,
                  // ),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant,
                  prefixIcon: const Icon(Icons.arrow_back_ios_new_rounded),
                  //   suffixIcon: Icon(Icons.)
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.01),
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none),
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
