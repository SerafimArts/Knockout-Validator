namespace Validator:Rule:
  class AbstractRule
    required: false
    trim:     false
    message: 'undefined'

    constructor: ->
      @message = "#{@constructor.name} validation error." if @message is 'undefined'

    check: (content, args = []) =>
      throw new Error "Can not call abstract method `check` in #{@constructor.name} class."
