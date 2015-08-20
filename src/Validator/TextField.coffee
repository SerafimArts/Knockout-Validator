namespace Validator:
  class TextField
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
      @rules    = new Validator.Manager(rule)

      # Check validators
      if options.updatable
        do @check
        @data.subscribe => do @check

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
