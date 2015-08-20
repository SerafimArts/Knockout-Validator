{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class String extends AbstractRule
    trim: true
    check: (content, args = []) =>
      return typeof(content) is 'string' || 'Не похоже на строку'

