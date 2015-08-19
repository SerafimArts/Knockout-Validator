{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class Phone extends AbstractRule
    message: 'Не похоже на номер телефона'

    check: (content, args = []) =>
      result = content
        .replace(/[\s\-\(\)\+]*/gi, '')
        .match(/^(?:[0-9]{10,11}|[0-9]{7})$/)

      return !!result
