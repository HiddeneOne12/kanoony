 import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

class CommonDropDown extends StatefulWidget {
  final String? selectedValue;
  final Function(String?)? onTextChanged;
  final List<String> list;
  final String hintText;
  const CommonDropDown(
      {super.key, this.selectedValue, this.onTextChanged, required this.list, required this.hintText});

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 14),
        child: DropdownButtonHideUnderline(
          
          child: DropdownButton2<String>(
            isExpanded: true,
            hint:   Row(
              children: [
                Expanded(
                  child: Text(
                    widget.hintText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: allColors.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            isDense: true,
            selectedItemBuilder: (con) {
              return widget.list.map((item) {
                return Text(
                  item,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16,fontWeight: FontWeight.w500),
                );
              }).toList();
            },
            items: widget.list.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: widget.list.indexOf(option) == 0
                              ? Colors.transparent
                              : allColors.greyTextColor.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      option,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              );
            }).toList(),
            value: widget.selectedValue,
            onChanged: widget.onTextChanged,
            buttonStyleData: ButtonStyleData(
              height: 45,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.white,
                ),
                color: allColors.canvasColor,
              ),
              elevation: 0,
            ),
            iconStyleData:   IconStyleData(
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              iconSize: 22,
              iconEnabledColor: allColors.primaryColor,
            ),
            dropdownStyleData: DropdownStyleData(
              elevation: 1,
              maxHeight: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: allColors.canvasColor,
              ),
              
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
