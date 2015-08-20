{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class Number extends AbstractRule
    check: (content, args = []) =>
      # ** OR **.**
      matches = content.match(/^[0-9]+(?:\.[0-9]{0,2})?$/)

      return 'Не похоже на число' unless !!matches

      if args.length is 1
        return (content.length <= args[0]) || "Значение должно быть длиннее #{args[0]}"

      else if args.length > 1
        return (
          content.length >= args[0] &&
          content.length <= args[1]
        ) || "Значение должно быть от #{args[0]} до #{args[1]} символов"

      return true
