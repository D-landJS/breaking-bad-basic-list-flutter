import 'dart:convert';

import 'package:breaking_bad_character_list_app/data/character_api.dart';
import 'package:breaking_bad_character_list_app/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  List<Character> characterList = <Character>[];
  bool isLoading = false;

  void getCharactersFromApi() async {
    setState(() {
      isLoading = true;
    });
    CharacterApi.getCharacters().then((res) {
      setState(() {
        Iterable list = json.decode(res.body);
        characterList = list.map((model) => Character.fromJson(model)).toList();
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharactersFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Breaking Bad Characters",
              style: GoogleFonts.amaranth(fontSize: 22)),
          backgroundColor: const Color(0xFF08491C),
        ),
        body: Column(
          children: [
            Expanded(
              child: isLoading == true
                  ? const Center(
                      child: SizedBox(
                        child: SpinKitCircle(
                          color: Color(0x9E02521A),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: characterList.length,
                      itemBuilder: (ctx, i) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0xFF069932)))),
                          child: ListTile(
                            title: Text(characterList[i].name as String,
                                style: GoogleFonts.amaranth(fontSize: 22)),
                            subtitle: Text(characterList[i].nickname as String,
                                style: GoogleFonts.amaranth(fontSize: 14)),
                            leading: CircleAvatar(
                                backgroundColor: const Color(0xC9033512),
                                radius: 22,
                                backgroundImage: NetworkImage(
                                    characterList[i].img as String)),
                          ),
                        );
                      }),
            ),
          ],
        ));
  }
}
