import 'package:dartz/dartz.dart';

import '../../../../core/exports.dart';
import '../../../../data/repositories/invoice/invoice_repository.dart';
import 'about_service.dart';

class AboutServiceImpl implements AboutService {
  final InvoiceRepository invoiceRepository;

  AboutServiceImpl({required this.invoiceRepository});

  @override
  Either<Failure, void> changeLanguage() => FailureHandler.handleFunction<void>(
        () => invoiceRepository.getAll(),
    "The Scanned QR Code is not compliant with ZATCA standards",
  ).fold(
        (l) => Left(l),
        (r) {
      invoiceRepository.deleteAll();
      return const Right(null);
    },
  );

  @override
  Either<Failure, void> changeTheme() => FailureHandler.handleFunction<void>(
        () => invoiceRepository.getAll(),
    "The Scanned QR Code is not compliant with ZATCA standards",
  ).fold(
        (l) => Left(l),
        (r) {
      invoiceRepository.deleteAll();
      return const Right(null);
    },
  );

  @override
  Either<Failure, void> loadSettings() => FailureHandler.handleFunction<void>(
        () => invoiceRepository.getAll(),
    "The Scanned QR Code is not compliant with ZATCA standards",
  ).fold(
        (l) => Left(l),
        (r) {
      invoiceRepository.deleteAll();
      return const Right(null);
    },
  );
}
