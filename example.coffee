{Text} = Validator

class window.SomeController
  constructor: ->
    this.phone = new Text('phone|required')

# ko.applyBindings(new SomeController);

#
# View:
#
# <input type="tel" data-bind="value: phone.data, valueUpdate: 'input'">
# <!--ko ifnot: phone.valid-->
#     <span class="error-message" data-bind="text: phone.error">&nbsp;</span>
# <!--/ko-->
#
