import 'package:datalutoolkit/extension/widget/text.dart';
import 'package:flutter/material.dart';

class InputItem extends StatelessWidget {
  const InputItem({Key? key, required this.title, this.value, this.onClickSelect, this.onClickDelete, this.subValue}) : super(key: key);
  final String title;
  final String? value;
  final String? subValue;
  final VoidCallback? onClickSelect;
  final VoidCallback? onClickDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        InkWell(
          onTap: onClickSelect,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: value != null ? 12 : 16,
                          ),
                        ).toFormulaQuimica(),
                        Visibility(
                          visible: value != null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value ?? "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ).toFormulaQuimica(),
                              if (subValue != null)
                                Text(
                                  subValue ?? "",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ).toFormulaQuimica(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: onClickDelete != null && value != null,
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: onClickDelete,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: onClickSelect != null,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: onClickSelect,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, top: 2),
                        child: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 25),
                      ),
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
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
