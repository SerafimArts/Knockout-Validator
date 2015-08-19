# Knockout-Validator
Knockout validation classes

### Example ###

#### Controller ####

```coffee
{Text} = Validator

class window.SomeController
  constructor: ->
    this.phone = new Text('phone|required')
```

#### View ####

```html
<input type="tel" data-bind="value: phone.data, valueUpdate: 'input'">
<!--ko ifnot: phone.valid-->
    <span class="error-message" data-bind="text: phone.error">&nbsp;</span>
<!--/ko-->
```

### Validator.Text interface ###

- `valid`: Observable bool property - result is valid?
- `error`: Observable string property - validator error message
- `default`: String property - default text content
- `data`: Observable string property - text content
- `rules`: Object of ValidatorManager
- `check()`: Method - validate `data`
- `reset()`: Method - reset `data` to `default`

### Validator.Text constructor ###

```
some = new Validator.Text('rule|another:args|another', options);

some = new Validator.Text(((content) -> content is 'some'), options);
```

First argument must be type of `string`, `function(){}` or `Array`.
- `string` - you can use multiple rules splitted by `|` with arguments slitted by `:`
- `function(){}` - single custom rule. Must be return `true` if first argument is valid.
- `Array` - multiple arguments with `string` or `function(){}`

Options:
- `options.content` (string) - Default text of field
- `options.updatable` (bool) - Automaticly validate `data` after each content update

