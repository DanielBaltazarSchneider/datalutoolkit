import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InputEngrenagem extends StatelessWidget {
  const InputEngrenagem({Key? key, required this.title, this.values = const [], this.onClickSelect, this.onTapAdd}) : super(key: key);
  final String title;
  final List<int> values;
  final Function(int engrenagem)? onClickSelect;
  final VoidCallback? onTapAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title + (values.isNotEmpty ? " (${values.length})" : ""),
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: values.isNotEmpty ? 10 : 16,
                        ),
                      ),
                      Visibility(
                        visible: values.isNotEmpty,
                        child: Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      for (int engrena in values) ...[
                                        InkWell(
                                          onTap: onClickSelect == null ? null : () => onClickSelect!(engrena),
                                          child: Stack(
                                            children: [
                                              Icon(
                                                MdiIcons.cog,
                                                size: 30,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: Center(
                                                  child: Container(
                                                    width: 15,
                                                    height: 15,
                                                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)),
                                                    child: Center(
                                                      child: Text(
                                                        engrena.toString(),
                                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: onTapAdd,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 1),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
