import 'package:dartz/dartz.dart';

import '../../../../core/exports.dart';
import '../../../../data/repositories/invoice/invoice_repository.dart';
import 'actions_service.dart';

class ActionsServiceImpl implements ActionsService {
  final InvoiceRepository invoiceRepository;

  ActionsServiceImpl({required this.invoiceRepository});

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
