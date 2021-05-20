import 'package:flutter/material.dart';
import 'package:memri_example/src/config/color_config.dart';

class PostDetailTags extends StatelessWidget {
  const PostDetailTags({Key? key, required this.tags}) : super(key: key);

  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: tags
                  ?.map<Widget>(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: Styleguide.colorAccentsOrange_1,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          child: Center(
                            child: Text(
                              e,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Styleguide.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList() ??
              [],
        ),
      ],
    );
  }
}
