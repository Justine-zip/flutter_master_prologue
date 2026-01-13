import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrewCreate extends StatefulWidget {
  const CrewCreate({super.key});

  @override
  State<CrewCreate> createState() => _CrewCreateState();
}

class _CrewCreateState extends State<CrewCreate> {
  final TextEditingController crewNameCtrl = TextEditingController();
  final TextEditingController amountCtrl = TextEditingController();

  String crewType = 'Free';

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: Colors.white,
      title: const Text('CREATE CREW'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // CREW NAME
          TextField(
            controller: crewNameCtrl,
            decoration: InputDecoration(
              hintText: 'Crew name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // PAID / FREE DROPDOWN
          DropdownButtonFormField<String>(
            value: crewType,
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
              setState(() => crewType = value!);
            },
          ),

          // 👇 CONDITIONAL FIELD
          if (crewType == 'Paid') ...[
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
              final crewName = crewNameCtrl.text.trim();
              final amount = amountCtrl.text.trim();

              if (crewName.isEmpty) return;
              if (crewType == 'Paid' && amount.isEmpty) return;

              debugPrint('crew: $crewName | Type: $crewType | Amount: $amount');

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
