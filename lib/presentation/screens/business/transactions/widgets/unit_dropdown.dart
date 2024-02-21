import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../domain/invoice/models/item_units_with_quantity/units_with_quantity_of_item_model.dart';

class UnitSelectionDropdown extends StatelessWidget {
  UnitSelectionDropdown({super.key, required this.onChange, this.unitsList});
  dynamic Function(String) onChange;
  List<UnitAndQuantityList>? unitsList;
  @override
  Widget build(BuildContext context) {
    return CoolDropdown(
        defaultItem: CoolDropdownItem(
          label: "Unit",
          value: "unit",
        ),
        dropdownItemOptions: const DropdownItemOptions(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 30),
        ),
        resultOptions: const ResultOptions(),
        dropdownOptions: DropdownOptions(
          width: 150.w,
        ),
        dropdownList: unitsList != null
            ? unitsList!
                .map((e) => CoolDropdownItem(
                    label: e.unit,
                    value: e.unit,
                    icon: Text("(${e.availableQuantity})")))
                .toList()
            : itemUnitConstantsList
                .map((e) => CoolDropdownItem(label: e, value: e))
                .toList(),
        controller: DropdownController(),
        onChange: onChange);
  }
}
