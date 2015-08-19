{Text} = Validator

class window.SomeController
  constructor: ->
    this.phone = new Text('phone|required')

# ko.applyBindings(new SomeController);

#
# View:
#
# <input type="tel" data-bind="value: number.data, valueUpdate: 'input'">
# <!--ko ifnot: number.valid-->
#     <span class="error-message" data-bind="text: number.error">&nbsp;</span>
# <!--/ko-->
#
