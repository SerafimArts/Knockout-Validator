{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class Required extends AbstractRule
    required: true

    check: (content, args = []) =>
      return (content.toString().trim().length > 0) || 'Не может быть пустым'
