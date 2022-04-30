import 'package:dartz/dartz.dart';

import '../../../../core/exports.dart';
import '../../../../data/repositories/invoice/invoice_repository.dart';
import 'about_service.dart';

class AboutServiceImpl implements AboutService {
  final InvoiceRepository invoiceRepository;

  AboutServiceImpl({required this.invoiceRepository});

  @override
  Either<Failure, void> changeLanguage() => FailureHandler.handleEither<void>(
        () => Right(null),
    "The Scanned QR Code is not compliant with ZATCA standards",
  );

  @override
  Either<Failure, void> changeTheme() => FailureHandler.handleEither<void>(
        () => Right(null),
    "The Scanned QR Code is not compliant with ZATCA standards",
  );

  @override
  Either<Failure, void> loadSettings() => FailureHandler.handleEither<void>(
        () => Right(null),
    "The Scanned QR Code is not compliant with ZATCA standards",
  );
}
