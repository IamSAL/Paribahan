import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TagsInput extends StatefulWidget {
  const TagsInput({Key? key}) : super(key: key);

  @override
  State<TagsInput> createState() => _TagsInputState();
}

class _TagsInputState extends State<TagsInput> {
  late double _distanceToField;
  late TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  void dispose() {
    super.dispose();
    if (!mounted) {
      _controller.dispose();
    }
  }

  final List<String> _pickLanguage = <String>[
    'Uradhura',
    'Murir tin',
    'Less stoppage',
    'Cheap',
    'Child friendly',
    'Music',
    'Cooperative',
    'GTA driver',
  ];
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dynamic option = options.elementAt(index);
                    return TextButton(
                      onPressed: () {
                        onSelected(option);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            '#$option',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Color(0xFF14628D),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _pickLanguage.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selectedTag) {
        _controller.addTag = selectedTag;
      },
      fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
        return TextFieldTags(
          textEditingController: ttec,
          focusNode: tfn,
          textfieldTagsController: _controller,
          initialTags: const [
            'Murir tin',
            'Ura dhura',
          ],
          textSeparators: const [' ', ','],
          letterCase: LetterCase.normal,
          validator: (String tag) {
            if (_controller.getTags!.contains(tag)) {
              return 'you already entered that';
            }
            return null;
          },
          inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
            return ((context, sc, tags, onTagDelete) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tags",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.75), fontSize: 12)),
                  SizedBox(
                    height: 10,
                  ),
                  DottedBorder(
                    borderType: BorderType.Rect,
                    radius: Radius.circular(5),
                    color: Colors.white.withOpacity(0.75),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextField(
                          controller: tec,
                          focusNode: fn,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: _controller.hasTags
                                ? 'Type here'
                                : "Type to get suggestions...",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                            errorText: error,
                            prefixIconConstraints: BoxConstraints(
                                maxWidth: _distanceToField * 0.74),
                            prefixIcon: tags.isNotEmpty
                                ? SingleChildScrollView(
                                    controller: sc,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: tags.map((String tag) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                          color: Color(0xFF3FCB9C),
                                        ),
                                        margin:
                                            const EdgeInsets.only(right: 10.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              child: Text(
                                                '#$tag',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                              onTap: () {
                                                //print("$tag selected");
                                              },
                                            ),
                                            const SizedBox(width: 4.0),
                                            InkWell(
                                              child: const Icon(
                                                Icons.cancel,
                                                size: 14.0,
                                                color: Color.fromARGB(
                                                    255, 233, 233, 233),
                                              ),
                                              onTap: () {
                                                onTagDelete(tag);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList()),
                                  )
                                : null,
                          ),
                          onChanged: onChanged,
                          onSubmitted: onSubmitted,
                        ),
                      ),
                    ),
                  )
                ],
              );
            });
          },
        );
      },
    );
  }
}
