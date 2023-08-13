import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/controller/provider/admin/revenue_prov/revenue_prov.dart';
import 'package:sizer/sizer.dart';

class AdminRevenueScreen extends StatelessWidget {
  const AdminRevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<AdminRevenueProvider>(
          builder: (context, modelRevPro, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.yellowAccent,
                  )),
              title: const Text(
                'Revenue',
                style: TextStyle(color: Colors.yellowAccent),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.7300000190734863),
                  Colors.black,
                  Colors.black.withOpacity(0.7300000190734863),
                ])),
              ),
            ),
            body: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 90.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Stack(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.all(30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.attach_money_outlined,
                                      color: Color.fromARGB(255, 0, 255, 8),
                                      size: 45,
                                    ),
                                    Text(
                                      '380000',
                                      style: TextStyle(
                                        color: Colors.yellowAccent,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 25.w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextFormField(
                                          controller: modelRevPro
                                              .fromdateInputController,
                                          decoration: const InputDecoration(
                                            hintText: 'Date',
                                            border: InputBorder.none,
                                          ),
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(2101),
                                            );

                                            modelRevPro
                                                .fromRevenueUpdateSelectedDate(
                                                    pickedDate!);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text('To'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 25.w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextFormField(
                                          controller:
                                              modelRevPro.todateInputController,
                                          decoration: const InputDecoration(
                                              hintText: 'Date',
                                              border: InputBorder.none),
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(2101),
                                            );

                                            modelRevPro
                                                .toRevenueUpdateSelectedDate(
                                                    pickedDate!);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {}, child: Text('show'))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Card(
                          shadowColor: Colors.grey,
                          child: ListTile(
                            leading: Icon(
                              Icons.attach_money_sharp,
                              color: Colors.green,
                            ),
                            title: Text('User Name'),
                            trailing: Column(
                              children: [
                                Flexible(
                                    child: Text(
                                  '+4000',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 34, 235, 41)),
                                )),
                                Flexible(
                                    child: Text(
                                  '14/05/2023',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                )),
                              ],
                            ),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
