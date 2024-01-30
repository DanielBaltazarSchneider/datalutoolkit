import 'package:datalutoolkit/extension/context/context.dart';
import 'package:datalutoolkit/extension/widget/text.dart';
import 'package:flutter/material.dart';

import 'modal_select_one_item.dart';

Future<List<ItemModal<T>>?> modalSelectMultiItem<T>(BuildContext context,
    {required String title, required List<ItemModal<T>> itens, bool isList = true, List<ItemModal<T>> initialValues = const [], Function? funInsert}) async {
  List<ItemModal<T>> selecteds = initialValues;
  final controller = _ControllerModal();

  bool isSelected(ItemModal<T> item) {
    return selecteds.where((element) => element.id == item.id).isNotEmpty;
  }

  void addItem(ItemModal<T> item) {
    if (isSelected(item)) {
      selecteds.remove(item);
    } else {
      selecteds.add(item);
    }
  }

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (c, w) {
                    return Scaffold(
                      appBar: AppBar(
                        title: controller.isSearch
                            ? TextField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                autofocus: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                cursorColor: Colors.white,
                                onChanged: (txt) => controller.setTextSearch(txt),
                              )
                            : Text(
                                title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(height: 1),
                              ),
                        centerTitle: false,
                        actions: [
                          if (!controller.isSearch)
                            InkWell(
                              onTap: () => controller.setSearch(true),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(Icons.search, color: Colors.white),
                              ),
                            ),
                          if (controller.isSearch)
                            InkWell(
                              onTap: () => controller.setSearch(false),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(Icons.close, color: Colors.white),
                              ),
                            )
                        ],
                      ),
                      floatingActionButton: funInsert == null
                          ? null
                          : FloatingActionButton(
                              child: const Icon(Icons.add),
                              onPressed: () => funInsert(),
                            ),
                      body: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            if (itens.isEmpty) ...[
                              SizedBox(height: context.screenHeight * 0.25),
                              Center(
                                child: Text(
                                  'Nenhum "$title" cadastrado!',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Realize o cadastro para selecionar!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                            if (itens.isNotEmpty)
                              Expanded(
                                child: ListView.builder(
                                    itemCount: itens.length,
                                    itemBuilder: (c, i) {
                                      ItemModal item = itens[i];
                                      if (controller.isSearch) {
                                        if (!item.title.toLowerCase().contains(controller.textSearch ?? "") &&
                                            !(item.subTitle ?? "").toLowerCase().contains(controller.textSearch ?? "")) {
                                          return const SizedBox.shrink();
                                        }
                                      }
                                      return InkWell(
                                        onTap: () {
                                          addItem(itens[i]);
                                          controller.notifyListeners();
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                if (isList)
                                                  Icon(
                                                    isSelected(itens[i]) ? Icons.check_box : Icons.check_box_outline_blank,
                                                    color: Colors.black,
                                                  ),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        itens[i].title,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.black,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ).toFormulaQuimica(),
                                                      if (itens[i].subTitle != null)
                                                        Text(
                                                          itens[i].subTitle ?? "",
                                                          style: const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.black,
                                                          ),
                                                        ).toFormulaQuimica(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            const Divider(),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            if (selecteds.isNotEmpty)
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Confirmar"),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  if (selecteds.isNotEmpty) {
    return selecteds;
  }
  return null;
}

class _ControllerModal extends ChangeNotifier {
  bool isSearch = false;
  String? textSearch;

  void setSearch(bool stat) {
    isSearch = stat;
    textSearch = null;
    notifyListeners();
  }

  void setTextSearch(String txt) {
    textSearch = txt.toLowerCase();
    notifyListeners();
  }
}
