{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class String extends AbstractRule
    trim: true
    check: (content, args = []) =>
      # ** OR **.**
      matches = content.match(/\w/)

      return 'Не похоже на строку' unless !!matches

