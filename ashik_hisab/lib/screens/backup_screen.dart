import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tag_share.dart';
import 'package:share_plus/share_plus.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  Future<void> _exportData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final calc = prefs.getString('calc_history') ?? '[]';
    final khata = prefs.getString('customers_list') ?? '[]';
    final notes = prefs.getString('notes_list') ?? '[]';

    String backupData = '--- ASHIK HISAB BACKUP ---\nCALC:$calc\nKHATA:$khata\nNOTES:$notes';
    Share.share(backupData, subject: 'Ashik Hisab Backup Data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ডাটা ব্যাকআপ ও রিকভারি'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Google Drive ও এক্সপোর্ট ব্যাকআপ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('আপনার সমস্ত ক্যালকুলেটর হিস্ট্রি, বাকির খাতা এবং নোটপ্যাডের ডাটা নিরাপদে ব্যাকআপ বা শেয়ার করে রাখতে পারেন।'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white, padding: const EdgeInsets.all(16)),
              onPressed: () => _exportData(context),
              icon: const Icon(Icons.upload),
              label: const Text('ডাটা ব্যাকআপ বা এক্সপোর্ট করুন', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
