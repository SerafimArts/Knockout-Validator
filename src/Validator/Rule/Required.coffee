{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class Required extends AbstractRule
    required: true
    message: 'Не может быть пустым'

    check: (content, args = []) =>
      return content.length > 0
