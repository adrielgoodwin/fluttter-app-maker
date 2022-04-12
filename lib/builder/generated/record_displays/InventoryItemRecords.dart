import 'package:flutter/material.dart';
import '../providers/main_provider.dart';
import 'package:provider/provider.dart';
import '../../models/nameValueType.dart';
import '../data-classes/InventoryItem.dart';
import '../forms/InventoryItemForm.dart';
import '../io_app/widgets/recordDisplays.dart';

class InventoryItemRecords extends StatefulWidget {
  const InventoryItemRecords({Key? key}) : super(key: key);

  @override
  State<InventoryItemRecords> createState() => _InventoryItemRecordsState();
}

class _InventoryItemRecordsState extends State<InventoryItemRecords> {

  @override
  Widget build(BuildContext context) {
    var s = Provider.of<MainProvider>(context);
    /// this
    var x = s.getInventoryItems;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          records(x),
        ],
      ),
    );
  }
  Widget records(List<InventoryItem> x) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: 
                  x.isNotEmpty ? x.map((e) => recordCard(e.fieldsAndValues)).toList() : [Center(child: Text('Nothin here. LongPress to open form', style: TextStyle(fontSize: 33),),)]
                 ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget recordCard(List<NameValueType> nvt) {
  /// implement type later for different displays
  /// more metadata for more display differences,
  /// eg. a row with two small values together /// or not, just do it with the widget builder?
  return Card(
    shadowColor: Colors.amber,
    child: SizedBox(
      width: double.infinity,
      child: Column(
        /// todo show type
        children: [
          ...nvt
              .map(
                (e) {
                  if (e.isAList) {
                    return isAListDisplay(e);
                  } else {
                    return isNotAListDisplay(e);
                  }
                }
              )
              .toList()
        ],
      ),
    ),
  );
}
