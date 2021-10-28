abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

// for display loading view
class FormSubmitting extends FormSubmissionStatus {}

class FormSubmissionSuccess extends FormSubmissionStatus{}

class FormSubmissionFailed extends FormSubmissionStatus {
  final Exception exception;

  FormSubmissionFailed(this.exception);
}
