namespace Validator:
  class Validator
    class ValidatorResult
      constructor: (valid, errorMessage) ->
        @valid = !!valid
        @error = errorMessage

      isValid: => @valid
      isError: => !@valid
      getErrorMessage: => @error

    constructor: (rule) ->
      @rules = new Validator.Manager(rule)

    ###
      Validate field
    ###
    check: (content) =>
      if content instanceof Array
        result = []
        for data in content
          valid = @rules.match(data)
          result.push(
            new ValidatorResult(valid, if valid then '' else @rules.lastErrorMessage)
          )
        return result
      else
        valid = @rules.match(content)
        return new ValidatorResult(valid, if valid then '' else @rules.lastErrorMessage)

