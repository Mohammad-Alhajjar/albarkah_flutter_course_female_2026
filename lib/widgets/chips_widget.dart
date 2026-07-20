import 'package:flutter/material.dart';

class ChipsWidget extends StatefulWidget {
  const ChipsWidget({super.key});
  @override
  State<ChipsWidget> createState() => _ChipsWidgetState();
}
class _ChipsWidgetState extends State<ChipsWidget> {
  bool isSelected = true;
  int selectedValue = 1;
  bool isMenSelected = false;
  bool isShoesSelected = false;
  bool isWatchesSelected = false;
  bool isPersonSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              label: Text('برمجة ', style: TextStyle(color: Colors.white)),
              avatar: CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.code, size: 14, color: Colors.white),
              ),
              backgroundColor: Colors.pink.shade500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              side: BorderSide(color: Colors.pink.shade100, width: 2),
              elevation: 4.0,
              shadowColor: Colors.pink.withValues(alpha:  0.9),
              deleteIcon: Icon(Icons.cancel, color: Colors.white70),
              deleteIconColor: Colors.red,
              deleteButtonTooltipMessage: 'حذف ؟',
              onDeleted: () {
                print('تم الحذف');
              },
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              labelPadding: EdgeInsets.all(4),
            ),
            SizedBox(height: 20),
            ActionChip(
              label: Text('إرسال '),
              avatar: Icon(Icons.send, size: 16, color: Colors.pink),
              onPressed: () {
                print('تم الارسال');
              },
              //  onPressed: null,
              pressElevation: 4,
              tooltip: 'إرسال إيميل ',
              backgroundColor: Colors.pink.shade50,
              disabledColor: Colors.grey.shade300,
              shape: StadiumBorder(),
            ),
            SizedBox(height: 20),
            FilterChip(
              label: Text('ملابس '),
              selected: isSelected,
              onSelected: (bool value) {
                setState(() {
                  isSelected = value;
                });
              },
              showCheckmark: true,
              checkmarkColor: Colors.white,
              selectedColor: Colors.green,
              backgroundColor: Colors.grey.shade200,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                FilterChip(
                  label: Text('ملابس '),
                  selected: isMenSelected,
                  onSelected: (bool value) {
                    setState(() {
                      isMenSelected = value;
                    });
                  },
                  showCheckmark: true,
                  checkmarkColor: Colors.white,
                  selectedColor: Colors.green,
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: isMenSelected ? Colors.white : Colors.black,
                    fontWeight: isMenSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                FilterChip(
                  label: Text('أحذية رياضية'),
                  selected: isShoesSelected,
                  onSelected: (bool value) {
                    setState(() {
                      isShoesSelected = value;
                    });
                  },
                  showCheckmark: true,
                  checkmarkColor: Colors.white,
                  selectedColor: Colors.green,
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: isShoesSelected ? Colors.white : Colors.black,
                    fontWeight: isShoesSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                FilterChip(
                  label: Text('ساعات '),
                  selected: isWatchesSelected,
                  onSelected: (bool value) {
                    setState(() {
                      isWatchesSelected = value;
                    });
                  },
                  showCheckmark: true,
                  checkmarkColor: Colors.white,
                  selectedColor: Colors.green,
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: isWatchesSelected ? Colors.white : Colors.black,
                    fontWeight: isWatchesSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: Text('الدفع كاش'),
                  selected: selectedValue == 1,
                  onSelected: (bool selected) {
                    if (selected) {
                      selectedValue = 1;
                    }
                    setState(() {});
                  },
                ),
                ChoiceChip(
                  label: Text('بطاقة'),
                  selected: selectedValue == 2,
                  onSelected: (bool selected) {
                    if (selected) {
                      selectedValue = 2;
                    }
                    setState(() {});
                  },
                ),
                ChoiceChip(
                  label: Text('PayPal'),
                  selected: selectedValue == 3,
                  onSelected: (bool selected) {
                    if (selected) {
                      setState(() {
                        selectedValue = 3;
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            InputChip(
              label: Text('أحمد محمد'),
              // selected: isPersonSelected,
              // onSelected: (bool selected) {
              //   setState(() {
              //     isPersonSelected = selected;
              //   });
              // },
              onPressed: () {
                print('تم الضغط   ');
              },
              onDeleted: () {
                print('تم الحذف   ');
              },
              isEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
