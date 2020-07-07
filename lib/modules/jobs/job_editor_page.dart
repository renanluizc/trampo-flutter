import 'package:flutter/material.dart';
import 'package:trampo/modules/jobs/job_controller.dart';
import 'package:trampo/shared/dialogs/back_alert_dialog.dart';
import 'package:trampo/shared/dialogs/loading_dialog.dart';
import 'package:trampo/shared/helpers/snackbar_helper.dart';
import 'package:trampo/shared/widgets/number_form_field.dart';
import 'package:trampo/shared/widgets/simple_text_form_field.dart';
import 'package:trampo/shared/widgets/submit_button.dart';

class JobEditorPage extends StatefulWidget {
  @override
  _JobEditorPageState createState() => _JobEditorPageState();
}

class _JobEditorPageState extends State<JobEditorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = JobController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo serviço'),
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SimpleTextFormField(
                  label: 'Nome do serviço',
                  onSaved: _controller.setName,
                ),
                SizedBox(height: 20),
                SimpleTextFormField(
                  label: 'Descrição do serviço',
                  onSaved: _controller.setDescription,
                ),
                SizedBox(height: 20),
                NumberFormField(
                  label: 'Preço',
                  onSaved: (text) => _controller.setPrice(double.parse(text)),
                ),
                SizedBox(height: 40),
                SubmitButton(
                  label: 'Salvar',
                  onTap: _onSave,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _onSave() async {
    final state = _formKey.currentState;
    if (state.validate()) {
      state.save();
      LoadingDialog.show(context);
      await _controller.create().then((value) {
        LoadingDialog.hide();
        Navigator.pop(context, value);
      }).catchError((error) {
        SnackBarHelper.showFailureMessage(
          context,
          title: 'Serviço',
          message: error,
        );
      });
    }
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => BackAlertDialog(
            onConfirm: () {
              Navigator.of(context).pop(true);
            },
          ),
        ) ??
        false;
  }
}
