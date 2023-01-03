import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _fromDate = TextEditingController();

  DateTime? _dateFrom;

  getFromDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2022),
      firstDate: DateTime(2000),
      lastDate: DateTime(2090),
    );

    setState(() {
      _dateFrom = date;
    });
  }

  DateTime? _dateto;

  gettoDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2022),
      firstDate: DateTime(2000),
      lastDate: DateTime(2090),
    );
    setState(() {
      _dateto = date;
    });
  }

  var moduleName;
  List<String> module = [
    "All",
    "Custom",
    "Bangladesh",
    "India",
  ];
  var departmentName;
  List<String> department = [
    "All",
    "Custom",
    "Bangladesh",
    "India",
  ];
  var statusName;
  List<String> status = [
    "Pending",
    "Active",
    "Approved",
    "Rejected",
  ];

  var personName;
  List<String> person = [
    "Zahidul Islam Yuvraj",
    "Mahmudul Hasan",
    "Rakibul hasan",
    "Begum Khaleda Zia",
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "AP Process",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  height: 180,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Module Name"),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  height: screenHeight * 0.050,
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        module[0].toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    value: moduleName,
                                    icon: Icon(Icons.arrow_downward),
                                    iconSize: 20,
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    onChanged: (chosenValue) {
                                      setState(() {
                                        moduleName = chosenValue.toString();
                                      });
                                    },
                                    items: module.map((quantityValue) {
                                      return DropdownMenuItem(
                                          value: quantityValue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(quantityValue),
                                          ));
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Department"),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  height: screenHeight * 0.050,
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        department[0].toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    value: departmentName,
                                    icon: Icon(Icons.arrow_downward),
                                    iconSize: 20,
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    onChanged: (chosenValue) {
                                      setState(() {
                                        departmentName = chosenValue.toString();
                                      });
                                    },
                                    items: module.map((quantityValue) {
                                      return DropdownMenuItem(
                                          value: quantityValue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(quantityValue),
                                          ));
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Status"),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  height: screenHeight * 0.050,
                                  child: DropdownButton<String>(
                                    hint: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        status[0].toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    value: statusName,
                                    icon: Icon(Icons.arrow_downward),
                                    iconSize: 20,
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    onChanged: (chosenValue) {
                                      setState(() {
                                        statusName = chosenValue.toString();
                                      });
                                    },
                                    items: module.map((quantityValue) {
                                      return DropdownMenuItem(
                                          value: quantityValue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(quantityValue),
                                          ));
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("From Date"),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  height: screenHeight * 0.050,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _dateFrom == null
                                          ? Text("date")
                                          : Text(
                                              "${_dateFrom?.year}-${_dateFrom?.month}-${_dateFrom?.day}",
                                            ),
                                      IconButton(
                                        onPressed: () {
                                          getFromDate();
                                        },
                                        icon: Icon(Icons.calendar_month),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To Date"),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  height: screenHeight * 0.050,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _dateto == null
                                          ? Text("date")
                                          : Text(
                                              "${_dateto?.year}-${_dateto?.month}-${_dateto?.day}",
                                            ),
                                      IconButton(
                                        onPressed: () {
                                          gettoDate();
                                        },
                                        icon: Icon(Icons.calendar_month),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Search",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: screenHeight * 0.050,
                                  color: Color(0xff1F3B7D),
                                  child: Center(
                                      child: Text(
                                    "Search",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("showing 3 results"),
                )),
            Expanded(
              flex: 3,
              child: Container(
                // color: Colors.blueAccent,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Merchandising- Yarn Booking"),
                                SizedBox(
                                  height: screenHeight * 0.008,
                                ),
                                Text(
                                  "Booking Type Sample , Booking No 1233",
                                ),
                                Text(
                                  "Job book : Q-1163738-FB34894",
                                ),
                                Text(
                                  "Buyer Name : ENOSRIA Revice",
                                ),
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),
                                Text(
                                  "Checked by / Account chief",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      color: Color(0xffFF8F8F),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Pending",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.timer),
                                    Text("00.00"),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.comment),
                                    Text("User comment will show here"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("1580"),
                                SizedBox(
                                  height: screenHeight * 0.005,
                                ),
                                Text("Req. Num,"),
                                SizedBox(
                                  height: screenHeight * 0.005,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff7CAC42),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "A",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.005,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                              title: SizedBox(
                                                height: screenHeight * 0.30,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: screenWidth,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      child: DropdownButton<
                                                          String>(
                                                        hint: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            person[0]
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        value: personName,
                                                        icon: Icon(Icons
                                                            .arrow_downward),
                                                        iconSize: 20,
                                                        isExpanded: true,
                                                        underline: SizedBox(),
                                                        onChanged:
                                                            (chosenValue) {
                                                          setState(() {
                                                            personName =
                                                                chosenValue
                                                                    .toString();
                                                          });
                                                        },
                                                        items: person.map(
                                                            (quantityValue) {
                                                          return DropdownMenuItem(
                                                              value:
                                                                  quantityValue,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                    quantityValue),
                                                              ));
                                                        }).toList(),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.010,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Comments",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                    TextField(),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.010,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                      width: 1),
                                                            ),
                                                            height: 40,
                                                            child: Center(
                                                              child: Text(
                                                                "Accept",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xff219653),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                      width: 1),
                                                            ),
                                                            height: 40,
                                                            child: Center(
                                                              child: Text(
                                                                "Reject",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xffEB5757),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                      width: 1),
                                                            ),
                                                            height: 40,
                                                            child: Center(
                                                              child: Text(
                                                                "Review",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0xff2F80ED),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    color: Color(0xff1F3B7D),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Click me",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
