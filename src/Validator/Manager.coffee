{Closure} = Validator.Rule

namespace Validator:
  class Manager
    # Validator list
    validators =
      email:    new Validator.Rule.Email
      phone:    new Validator.Rule.Phone
      required: new Validator.Rule.Required
      number:   new Validator.Rule.Number
      string:   new Validator.Rule.String

    # Aliases
    aliases = Object.keys(validators)


    constructor: (rules) ->
      @lastErrorMessage = ''

      @list = []

      if rule instanceof Array
        @parse(rule) for rule in rules
      else
        @parse(rules)


    match: (content) =>
      for item in @list
        # If content is empty and validator not required full content
        continue if !item.validator.required && content is ""

        # If need trim data
        content = content.trim() if item.validator.trim

        # return false if validator not complete
        unless (result = item.validator.check(content, item.args)) is true
          @lastErrorMessage = result if typeof(result) is "string"
          @lastErrorMessage = item.validator.error if typeof(result) isnt "string"

          return false

      return true


    add: (validator, args = []) =>
      @list.push {
        validator: validator
        args: args
      }
      @


    parse: (rule) =>
      # is Closure
      if rule instanceof Function && rule.name is ""
        @addClosure(rule)

      else if typeof(rule) is "string"
        for ruleAttr in rule.split '|'
          @addString(ruleAttr)


    addClosure: (rule) =>
      @add(new Closure(rule), [])
      @


    addString: (rule) =>
      [name, args...] = rule.split ':'
      if validators[name]?
        @add(validators[name], args)


