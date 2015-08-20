namespace Validator:
  class TextField
    ###
     # options.content    - Default content
     # options.subscribe  - Automatic validation
     # options.update     - Init validations after creating an object
    ###
    constructor: (rule, options = {}) ->
      options = @args(options, {
        content:   ''
        update:    true
        subscribe: true
      })

      @default  = options.content
      @data     = ko.observable @default
      @valid    = ko.observable true
      @error    = ko.observable ''
      @rules    = new Validator.Manager(rule)

      # Check for update
      if options.update then do @check

      # Check for subscribe
      if options.updatable
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
