{AbstractRule} = Validator.Rule

namespace Validator:Rule:
  class Closure extends AbstractRule
    constructor: (@closure = (->)) ->

    check: (content) =>
      return @closure(content)
