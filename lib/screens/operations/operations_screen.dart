import 'package:base_project/components/drawer_nav.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/screens/operations/components/body_operations.dart';
import 'package:base_project/screens/operations/components/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OperationScreen extends StatefulWidget {
  @override
  _OperationScreenState createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    print("Loading data is completed.");
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        // * for transparent appbar
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: kPrimaryColor),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(
          refreshingText: 'กำลังโหลดข้อมูล',
          completeText: 'โหลดข้อมูลสำเร็จ',
          idleText: 'รีเฟรชข้อมูล',
          failedText: 'โหลดข้อมูลไม่สำเร็จ',
          releaseText: 'ปล่อยเพื่อรีเฟรชข้อมูล',
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("ดันขึ้นเพื่อรีเฟรชข้อมูล");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("โหลดข้อมูลไม่สำเร็จ");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("ดันขึ้นอีกครั้งเพื่อรีเฟรชข้อมูล");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView(
          children: [
            BodyOperations(),
          ],
        ),
      ),
      drawer: DrawerNavigator(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
