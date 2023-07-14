import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_builder/controllers/invoice_ctrl.dart';
import 'package:invoice_builder/env/auto_dimens.dart';
import 'package:invoice_builder/shared/colors.dart';
import 'package:invoice_builder/shared/strings.dart';
import 'package:invoice_builder/shared/style.dart';
import 'package:invoice_builder/shared/widgets/button.dart';
import 'package:invoice_builder/shared/widgets/invoice_b_appbar.dart';
import 'package:invoice_builder/shared/widgets/snackbar.dart';
import 'package:invoice_builder/shared/widgets/text.dart';
import 'package:invoice_builder/shared/widgets/text_field.dart';

class PaymentInstructionsScreen extends GetView<InvoiceController> {
  PaymentInstructionsScreen({Key? key}) : super(key: key);
  final TextEditingController _paymentInstInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: invoiceBuildAppBar(
        title: 'Write Instructions',
        actions: [],
        showBackButton: true,
      ),
      backgroundColor: AppColors.cWhite,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (scroll) {
          scroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: AutoDimensions.calcH(5),
                horizontal: AutoDimensions.calcW(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Instruction Payment',
                    style: AppTextStyle.textStyle1(),
                  ),
                  AppText(
                    text:
                        'At the bottom invoice panel, you customer see instruction payement. So this sections has important.',
                    style: AppTextStyle.textStyle4(),
                    maxline: 3,
                    align: TextAlign.left,
                  ),
                  const SizedBox(height: 25),
                  Form(
                    child: Column(
                      children: [
                        AppTextFormField(
                          controller: _paymentInstInputController,
                          label: AppStrings.textTitleDialogPaymentComposite,
                          height: AutoDimensions.calcH(100),
                          isRequired: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.center,
                    child: AppBtn(
                      label: AppStrings.textSaveBtn,
                      action: () {
                        if (_paymentInstInputController.text.isEmpty ||
                            _paymentInstInputController.text.length < 5) {
                          messageWithSnackbar(
                              context: context, message: AppStrings.paymentErrorScreenText);
                        } else {
                          controller.setPaymentInstructions(_paymentInstInputController.text);
                          Get.close(1);
                        }
                      },
                      color: AppColors.cPrimary,
                      textColor: AppColors.cWhite,
                      width: AutoDimensions.calcW(150),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
