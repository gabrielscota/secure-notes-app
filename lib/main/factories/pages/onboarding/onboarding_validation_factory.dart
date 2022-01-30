import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeOnboardingValidation() => ValidationComposite(
      validations: makeOnboardingValidations(),
    );

List<FieldValidation> makeOnboardingValidations() => [...ValidationBuilder.field('name').required().min(3).build()];
