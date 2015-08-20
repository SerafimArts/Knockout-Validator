{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class Email extends AbstractRule
    check: (content, args = []) =>
      return (!!content.match(/^.*?@.*?$/)) || 'Не похоже на адрес почты'
