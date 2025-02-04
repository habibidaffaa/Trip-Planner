import 'package:flutter/material.dart';
import 'package:iterasi1/resource/custom_colors.dart';

import '../../model/activity.dart';

class AddActivities extends StatefulWidget {
  final Activity? initialActivity;
  final Function(Activity) onSubmit;

  AddActivities({
    this.initialActivity,
    required this.onSubmit,
    super.key
  });

  @override
  _AddActivitiesState createState() => _AddActivitiesState();
}

class _AddActivitiesState extends State<AddActivities> {
  TimeOfDay _selectedStartTime = TimeOfDay.now();
  TimeOfDay _selectedEndTime = TimeOfDay.now();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();


  @override
  void initState() {
    super.initState();
    if (widget.initialActivity != null){
      titleController.text = widget.initialActivity!.activityName;
      keteranganController.text = widget.initialActivity!.keterangan;
      _selectedStartTime = widget.initialActivity!.startTimeOfDay;
      _selectedEndTime = widget.initialActivity!.endTimeOfDay;
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedStartTime,
    );
    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedStartTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedEndTime,
    );
    if (picked != null && picked != _selectedEndTime) {
      setState(() {
        _selectedEndTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.surface,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  const Padding(
                    padding : EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Text(
                      "Tambah Aktivitas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'poppins_bold',
                        fontSize: 30,
                        color: CustomColor.buttonColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Judul",
                        style: TextStyle(
                          fontFamily: 'poppins_bold',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 10),
                      // text field
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF305A5A),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mulai',
                              style: TextStyle(
                                fontFamily: 'poppins_bold',
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Container(
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () => _selectStartTime(context),
                                child: Container(
                                  width: 145,
                                  height: 60,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: CustomColor.borderColor,
                                      width: 1
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "${_selectedStartTime.format(context)}",
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.access_time,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selesai',
                              style: TextStyle(
                                fontFamily: 'poppins_bold',
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () => _selectEndTime(context),
                                child: Container(
                                  width: 145,
                                  height: 60,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: CustomColor.borderColor,
                                        width: 1
                                    )
                                ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "${_selectedEndTime.format(context)}",
                                            style: const TextStyle(
                                              fontFamily: 'Popins',
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.access_time,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Keterangan',
                        style: TextStyle(
                          fontFamily: 'Popins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: keteranganController,
                        keyboardType: TextInputType.multiline,
                        minLines: 4,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ), //  agar kotak tidak memiliki margin
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15 , vertical : 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: CustomColor.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(100, 60),
                    ),
                    onPressed: (){
                      widget.onSubmit(
                          Activity(
                              activityName: titleController.text,
                              startActivityTime: _selectedStartTime.format(context),
                              endActivityTime: _selectedEndTime.format(context),
                              keterangan: keteranganController.text
                          )
                      );
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: const Text(
                        'Simpan Aktivitas',
                        style: TextStyle(
                          fontFamily: 'poppins_bold',
                          fontSize: 20,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
