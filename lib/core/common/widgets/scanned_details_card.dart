import 'package:e_invoice_qrcode_reader/core/helpers/common_helper.dart';
import 'package:flutter/material.dart';

import '../../fixtures/tlv_model_keys.dart';
import '../models/invoice_model.dart';

class ScannedDetailsCardWidget extends StatelessWidget {
  final InvoiceModel info;

  const ScannedDetailsCardWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InvoiceDataRow(title: TlvModelKeys.sellerName, value: info.sellerName),
        const Divider(),
        _InvoiceDataRow(
            title: TlvModelKeys.sellerTaxNumber, value: info.sellerTaxNumber),
        const Divider(),
        _InvoiceDataRow(
            title: TlvModelKeys.invoiceDate, value: info.invoiceDate),
        const Divider(),
        _InvoiceDataRow(
            title: TlvModelKeys.invoiceTotal, value: info.invoiceTotal),
        const Divider(),
        _InvoiceDataRow(
          title: TlvModelKeys.taxTotal,
          value: info.taxTotal,
          date: CommonHelper.formatDate(date: info.scannedDate, timeOnly: true),
        ),
      ],
    );
  }
}

class _InvoiceDataRow extends StatelessWidget {
  const _InvoiceDataRow({
    Key? key,
    required this.title,
    required this.value,
    this.date,
  }) : super(key: key);
  final String title;
  final String value;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        if (date != null)
          Text(
            date!,
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
      ],
    );
  }
}
