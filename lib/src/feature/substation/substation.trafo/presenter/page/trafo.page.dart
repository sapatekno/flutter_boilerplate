import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/feature/app/presenter/widget/dialog.widget.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/entity/request/substation_detail.req.e.dart';
import 'package:surveyami/src/router/go.router.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../app/presenter/widget/empty.widget.dart';

class TrafoPage extends StatefulWidget {
  final List<SubStationDetailReqE>? data;

  const TrafoPage(this.data, {Key? key}) : super(key: key);

  @override
  State<TrafoPage> createState() => _TrafoPageState();
}

class _TrafoPageState extends State<TrafoPage> {
  List<SubStationDetailReqE> listTrafoData = [];

  @override
  void initState() {
    super.initState();
    if (widget.data != null) listTrafoData.addAll(widget.data!);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop(listTrafoData);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.trafoData.toTitleCase()),
          actions: [
            IconButton(
                onPressed: () async {
                  final SubStationDetailReqE? result = await context.push(pathTrafoForm);

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (result != null) {
                      setState(() {
                        listTrafoData.add(result);
                        listTrafoData.sort((a, b) => (a.nomorTrafo ?? 'a').compareTo((b.nomorTrafo ?? 'b')));
                      });
                    }
                  });
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: listTrafoData.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: listTrafoData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.1.h),
                    child: Card(
                      child: ListTile(
                        leading: SizedBox(
                          height: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text((index + 1).toString(), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold))],
                            ),
                          ),
                        ),
                        title: Text(listTrafoData[index].nomorTrafo ?? '-'),
                        subtitle: Text((listTrafoData[index].jumlahSaluran ?? 0).toString()),
                        trailing: SizedBox(
                          height: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () async {
                                    final SubStationDetailReqE? result = await context.push(pathTrafoForm, extra: listTrafoData[index]);

                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      if (result != null) {
                                        setState(() {
                                          listTrafoData[index] = result;
                                          listTrafoData.sort((a, b) => (a.nomorTrafo ?? 'a').compareTo((b.nomorTrafo ?? 'b')));
                                        });
                                      }
                                    });
                                  }),
                              IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    showConfirmDialog(
                                      context: context,
                                      description: AppLocalizations.of(context)!.deleteConfirmation,
                                      confirmBtnTxt: AppLocalizations.of(context)!.yes,
                                      cancelBtnTxt: AppLocalizations.of(context)!.no,
                                      onConfirmClicked: () {
                                        setState(() {
                                          listTrafoData.removeAt(index);
                                          listTrafoData.sort((a, b) => (a.nomorTrafo ?? 'a').compareTo((b.nomorTrafo ?? 'b')));
                                        });
                                      },
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const EmptyWidget(),
      ),
    );
  }
}
