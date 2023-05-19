import 'package:flutter/material.dart';
import 'package:dokter_kita/styles/colors.dart';
import 'package:dokter_kita/styles/styles.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

enum FilterStatus { Berlangsung, Selesai, Dibatalkan }

List<Map> schedules = [
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Yosef David',
    'doctorTitle': 'Spesialis Gigi dan Mulut',
    'reservedDate': 'Senin, 22 Mei',
    'reservedTime': '11:00 - 12:10',
    'status': FilterStatus.Berlangsung
  },
  {
    'img': 'assets/doctor04.jpeg',
    'doctorName': 'Dr. Yolanda Tamara',
    'doctorTitle': 'Spesialis Anak',
    'reservedDate': 'Senin, Sep 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Berlangsung
  },
  {
    'img': 'assets/doctor05.png',
    'doctorName': 'Dr. Arya Purnama',
    'doctorTitle': 'General Specialist',
    'reservedDate': 'Senin, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Berlangsung
  },
  {
    'img': 'assets/doctor04.jpeg',
    'doctorName': 'Dr. Yolanda Tamara',
    'doctorTitle': 'Spesialis Anak',
    'reservedDate': 'Selasa, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Selesai
  },
  {
    'img': 'assets/doctor01.jpeg',
    'doctorName': 'Dr. Yusuf Raharja',
    'doctorTitle': 'Spesialis Bedah',
    'reservedDate': 'Rabu, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Dibatalkan
  },
  {
    'img': 'assets/doctor07.png',
    'doctorName': 'Dr. Christopher Surya',
    'doctorTitle': 'Dokter Umum',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': 'Jumat - 12:00',
    'status': FilterStatus.Dibatalkan
  },
];

class _ScheduleTabState extends State<ScheduleTab> {
  FilterStatus status = FilterStatus.Berlangsung;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Jadwal Periksa',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(MyColors.bg),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Berlangsung) {
                                  status = FilterStatus.Berlangsung;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Selesai) {
                                  status = FilterStatus.Selesai;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Dibatalkan) {
                                  status = FilterStatus.Dibatalkan;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: kFilterStyle,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(MyColors.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    margin: !isLastElement
                        ? EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(_schedule['img']),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule['doctorName'],
                                    style: TextStyle(
                                      color: Color(MyColors.header01),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['doctorTitle'],
                                    style: TextStyle(
                                      color: Color(MyColors.grey02),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DateTimeCard(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  child: Text('Batalkan'),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  child: Text('Ubah Jadwal'),
                                  onPressed: () => {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg03),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(MyColors.primary),
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Senin, 22 Mei',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Color(MyColors.primary),
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '11:00 ~ 12:10',
                style: TextStyle(
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
