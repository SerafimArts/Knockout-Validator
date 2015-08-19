{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class Email extends AbstractRule
    message: 'Не похоже на адрес почты'

    check: (content, args = []) =>
      return content.match /^.*?@.*?$/
