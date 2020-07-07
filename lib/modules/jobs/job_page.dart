import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trampo/modules/home/home_page.dart';
import 'package:trampo/modules/jobs/job_card.dart';
import 'package:trampo/modules/jobs/job_controller.dart';
import 'package:trampo/modules/jobs/job_editor_page.dart';
import 'package:trampo/shared/drawer/custom_drawer.dart';
import 'package:trampo/shared/helpers/navigator_helper.dart';
import 'package:trampo/shared/widgets/busy_list_container.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final _controller = JobController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  Future _initialize() async {
    if (mounted) _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
      ),
      drawer: CustomDrawer(3),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await NavigatorHelper.push(context, JobEditorPage());
          if (result != null) {
            _controller.addJobModel(result);
          }
        },
      ),
      body: WillPopScope(
        onWillPop: () => NavigatorHelper.pushReplacement(context, HomePage()),
        child: Observer(
          builder: (context) {
            return BusyListContainer(
              busy: _controller.busy,
              items: _controller.list,
              itemBuilder: (context, index) {
                return JobCard(model: _controller.list[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
