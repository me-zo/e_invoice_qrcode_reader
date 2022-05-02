import '../../../../data/repositories/invoice/invoice_repository.dart';
import 'about_service.dart';

class AboutServiceImpl implements AboutService {
  final InvoiceRepository invoiceRepository;

  AboutServiceImpl({required this.invoiceRepository});
}
