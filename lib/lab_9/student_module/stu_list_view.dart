import '../../import_export.dart';

class StuListView extends StatelessWidget {
  StuListView({super.key});

  final StuController stuController = Get.put(StuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_USER_LIST_VIEW),
        actions: [
          Obx(() => IconButton(
            icon: Icon(
              stuController.isSortAscending.value
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
            ),
            tooltip: 'Toggle Sort Order',
            onPressed: () {
              stuController.isSortAscending.toggle();
              stuController.getStuList();
            },
          ))
          ,
          IconButton(
            onPressed: () {
              Get.toNamed(NAV_STU_ADD_EDIT_PAGE);
            },
            icon: Icon(Icons.add),
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            TextField(
              onChanged: (value) => stuController.searchText.value = value,
              decoration: InputDecoration(
                hintText: 'Search By Name, Email, Branch..!!',
                prefixIcon: Icon(Icons.search_outlined),
                filled: true,
                fillColor: Colors.blueGrey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

          ),
        ),
      ),
      body: GetX<StuController>(
        builder: (controller) {
          final studentList = controller.filteredStuList;
          return controller.stuList.isNotEmpty
              ? ListView.builder(
                itemCount: studentList.length,
                itemBuilder: (context, index) {
                  final student = studentList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue.shade100,
                          child: Text(
                            student.stuName?[0].toUpperCase() ?? "?",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          student.stuName ?? 'No Name',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          "Enrollment No: ${student.enrollmentNo ?? '-'}",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoRow(
                                  Icons.school,
                                  "Branch: ${student.branch ?? '-'}",
                                ),
                                _buildInfoRow(
                                  Icons.email,
                                  "Email: ${student.email ?? '-'}",
                                ),
                                _buildInfoRow(
                                  Icons.phone,
                                  "Phone: ${student.phoneNumber ?? '-'}",
                                ),
                                _buildInfoRow(
                                  Icons.credit_score,
                                  "CGPA: ${student.cgpa?.toStringAsFixed(2) ?? '-'}",
                                ),
                                _buildInfoRow(
                                  Icons.grade,
                                  "12th Grade: ${student.grade12 ?? '-'}",
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                                Get.to(() => StuAddEditPage(), arguments: student);
                                              // Navigate to edit page
                                              // Example: Get.toNamed(NAV_USER_ADD_EDIT_PAGE, arguments: student);
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                            label: Text("Edit"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.indigo,
                                              foregroundColor: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 14,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              elevation: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              controller.deleteStuFromList(
                                                student.stuId!,
                                              );
                                            },
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color: Colors.white,
                                            ),
                                            label: Text("Delete"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent,
                                              foregroundColor: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 14,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              elevation: 4,
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
                        ],
                      ),
                    ),
                  );
                },
              )
              : Center(
                child: Text(
                  CMN_NO_DATA_FOUND,
                  style: TextStyle(color: Colors.grey),
                ),
              );
        },
      ),
    );
  }
}

Widget _buildInfoRow(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
