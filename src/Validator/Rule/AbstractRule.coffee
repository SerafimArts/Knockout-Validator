namespace Validator:Rule:
  class AbstractRule
    error:    "#{@constructor.name} validation error"
    required: false
    trim:     false

    check: (content, args = []) =>
      throw new Error "Can not call abstract method `check` in #{@constructor.name} class."


