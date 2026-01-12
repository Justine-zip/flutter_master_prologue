import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GroupCreate extends StatefulWidget {
  const GroupCreate({super.key});

  @override
  State<GroupCreate> createState() => _GroupCreateState();
}

class _GroupCreateState extends State<GroupCreate> {
  final TextEditingController groupNameCtrl = TextEditingController();
  final TextEditingController amountCtrl = TextEditingController();

  String groupType = 'Free';

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: Colors.white,
      title: const Text('CREATE GROUP'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // GROUP NAME
          TextField(
            controller: groupNameCtrl,
            decoration: InputDecoration(
              hintText: 'Group name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // PAID / FREE DROPDOWN
          DropdownButtonFormField<String>(
            value: groupType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'Free', child: Text('Free')),
              DropdownMenuItem(value: 'Paid', child: Text('Paid')),
            ],
            onChanged: (value) {
              setState(() => groupType = value!);
            },
          ),

          // 👇 CONDITIONAL FIELD
          if (groupType == 'Paid') ...[
            const SizedBox(height: 16),
            TextField(
              controller: amountCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                hintText: 'Amount',
                prefixText: '\$ ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],

          const SizedBox(height: 20),

          // GENERATE BUTTON
          ElevatedButton(
            onPressed: () {
              final groupName = groupNameCtrl.text.trim();
              final amount = amountCtrl.text.trim();

              if (groupName.isEmpty) return;
              if (groupType == 'Paid' && amount.isEmpty) return;

              debugPrint(
                'Group: $groupName | Type: $groupType | Amount: $amount',
              );

              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.fromMap({
                WidgetState.pressed: Colors.grey[800],
                WidgetState.hovered & WidgetState.focused: Colors.grey[700],
                WidgetState.any: Colors.black,
              }),
            ),
            child: const Text(
              'GENERATE',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
