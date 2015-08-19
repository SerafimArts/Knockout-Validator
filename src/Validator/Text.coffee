{ValidatorManager} = Validator

namespace Validator:
  class Text
    ###
     # options.content    - Default content
     # options.updatable  - Automatic validation
    ###
    constructor: (rule, options = {}) ->
      options = @args(options, {
        content:   ''
        updatable: true
      })

      @default  = options.content
      @data     = ko.observable @default
      @valid    = ko.observable true
      @error    = ko.observable ''
      @rules    = new ValidatorManager(rule)

      do @check

      # Check validators
      if options.updatable
        @data.subscribe (value) => do @check

    ###
      Merge options with default
    ###
    args: (options = {}, defaultArgs = {}) =>
      result = {}
      for key of defaultArgs
        result[key] = if options[key]?
          options[key]
        else
          defaultArgs[key]
      return result

    ###
      Validate field
    ###
    check: =>
      valid = @rules.match(@data())
      @valid(valid)
      @error(if valid then '' else @rules.lastErrorMessage)
      @

    ###
      Reset to defaults
    ###
    reset: =>
      @data @default
      @
