import 'package:flutter/material.dart';
import 'package:ipu_record/Helpers/Constants.dart';
import 'package:ipu_record/Helpers/CustomWidgets.dart';
import 'package:ipu_record/Model/User.dart';
import 'package:ipu_record/Screens/ExportSumaryIpuUsage.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  IPUREPRORTVIEW ipureprortview = IPUREPRORTVIEW.NOTHING;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.CustomAppBar("IPU Insight"),
      body: Column(children: [
        Container(
          height: 15,
        ),
        CustomWidgets.UserTile("User Name", "Siddhant"),
        CustomWidgets.UserTile("Org ID", "afadgfdaf54548fdfas"),
        CustomWidgets.UserTile(
            "Registered Email", "sidjaiswal@informatica.com"),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.orangeAccent,
                  backgroundColor: Colors.blueGrey),
              onPressed: () {

                ipureprortview = IPUREPRORTVIEW.EXPORT_SUMMARY_IPU_USAGE;
                print("CLICKED EXPORT SUMMARY USAGE");
                setState(() {



                });
              },
              child: Text("Export Summary IPU Usage"),
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.orangeAccent,
                  backgroundColor: Colors.blueGrey),
              onPressed: () {
                ipureprortview = IPUREPRORTVIEW.EXPORT_JOB_LEVEL_IPU_USAGE_FOR_PARTICULAR_SERVICE;
                setState(() {

                });

              },
              child:
              Text("Export Job Level IPU Usage for a Particular Service"),
            ),
            Spacer(),



          ],
        ),
        ipureprortview ==  IPUREPRORTVIEW.EXPORT_JOB_LEVEL_IPU_USAGE_FOR_PARTICULAR_SERVICE ? Container():
        ipureprortview == IPUREPRORTVIEW.EXPORT_SUMMARY_IPU_USAGE ? ExportSummaryIPUUsage():Container()

      ]),
    );
  }



}
