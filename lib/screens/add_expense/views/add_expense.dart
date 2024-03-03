import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  List<String> myCategoriesIcons = [
    'entertainment',
    "food",
    "home",
    "pet",
    "shopping",
    "tech",
    "travel"
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Thêm chi phí",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TextFormField(
                controller: expenseController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Số tiền",
                  prefixIcon: const Icon(
                    FontAwesomeIcons.dollarSign,
                    size: 16,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  suffixText: "VND",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: categoryController,
              textAlignVertical: TextAlignVertical.center,
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  FontAwesomeIcons.list,
                  size: 16,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    size: 16,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        bool isExpended = false;
                        String iconSelected = '';
                        Color categoryColor = Colors.white;

                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                              title: const Text(
                                "Tạo loại chi phí",
                              ),
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      onTap: () {},
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Tên chi phí",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      onTap: () {
                                        setState(() {
                                          isExpended = !isExpended;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Icon",
                                        suffixIcon: const Icon(
                                          FontAwesomeIcons.chevronDown,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: isExpended
                                                ? const BorderRadius.vertical(
                                                    top: Radius.circular(12))
                                                : BorderRadius.circular(12),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                    isExpended
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                bottom: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          mainAxisSpacing: 5,
                                                          crossAxisSpacing: 5),
                                                  itemCount:
                                                      myCategoriesIcons.length,
                                                  itemBuilder:
                                                      (context, int i) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          iconSelected =
                                                              myCategoriesIcons[
                                                                  i];
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: iconSelected ==
                                                                      myCategoriesIcons[
                                                                          i]
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                'assets/${myCategoriesIcons[i]}.png'),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          )
                                        : Container(),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx2) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ColorPicker(
                                                    pickerColor: Colors.blue,
                                                    onColorChanged: (value) {
                                                      setState(() {
                                                        categoryColor = value;
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    height: 50,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(ctx2);
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor: Colors
                                                            .blue.shade700,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        "Lưu",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: categoryColor,
                                        hintText: "Màu sắc",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: kToolbarHeight,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue.shade700,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: const Text(
                                          "Lưu",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        });
                      },
                    );
                  },
                ),
                hintText: "Loại chi phí",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              readOnly: true,
              controller: dateController,
              textAlignVertical: TextAlignVertical.center,
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: selectDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                );
                if (newDate != null) {
                  setState(() {
                    dateController.text =
                        DateFormat('dd/MM/yyyy').format(newDate);
                  });
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  FontAwesomeIcons.clock,
                  size: 16,
                  color: Colors.grey,
                ),
                hintText: "Ngày",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: kToolbarHeight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Lưu",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
