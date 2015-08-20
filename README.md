# Knockout-Validator
Knockout validation classes

## Example: TextField ##

#### Controller ####

```coffee
{TextField} = Validator

class window.SomeController
  constructor: ->
    this.phone = new TextField('phone|required')
```

#### View ####

```html
<input type="tel" data-bind="value: phone.data, valueUpdate: 'input'">
<!--ko ifnot: phone.valid-->
    <span class="error-message" data-bind="text: phone.error">&nbsp;</span>
<!--/ko-->
```

#### Validator.TextField interface ####

- `valid`: Observable bool property - result is valid?
- `error`: Observable string property - validator error message
- `default`: String property - default text content
- `data`: Observable string property - text content
- `rules`: Object of ValidatorManager
- `check()`: Method - validate `data`
- `reset()`: Method - reset `data` to `default`

#### Validator.TextField constructor ####

```coffee
# With string validator options
some = new Validator.TextField('rule|another:args|another', options);

# With lambda (or closure) validator
some = new Validator.TextField(((content) -> content is 'some' || 'Error message'), options);
```

First argument must be type of `string`, `function(){}` or `Array`.
- `string` - you can use multiple rules splitted by `|` with arguments slitted by `:`
- `function(){}` - single custom rule. Must be return `true` if first argument is valid.
- `Array` - multiple arguments with `string` or `function(){}`

Options:
- `options.content` (string) - Default text of field
- `options.subscribe` (bool) - Automaticly validate `data` after each content update
- `options.update` (bool) - Init validations after creating an object

## Example: Static validation  ##

```coffee
{Validator} = Validator


validator = new Validator('email|required')
result = validator.check('asdasd@asdasd.com')

# result.isValid()
# result.isError()
# result.getErrorMessage()
```

## Validators ##

- `email` - Email pattern
- `number` or `number:[length]` or `number:[length from]:[to]` - Value is number
- `phone` - `7` or `10` or `11` numbers without `(`, `)`, `+`, `-`, `<space>` characters
- `required` - String length must be more then `0`. Whitespaces will be ignored

