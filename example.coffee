{Text} = Validator

class window.SomeController
  constructor: ->
    this.phone = new Text('phone|required')

# ko.applyBindings(new SomeController);
