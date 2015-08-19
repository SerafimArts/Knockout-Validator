###
  Namespace
###
unless window.namespace?
  class namespace
    constructor: (@name) ->

  window.namespace = ->
    [args, target, ns] = [arguments[0], window, []]
    loop
      for subpackage, obj of args
        ns.push(subpackage)
        target = target[subpackage] or= new namespace(ns.join(':'))
        args = obj
      break unless typeof args is 'object'

    Class  = args
    target = window if arguments[0].hasOwnProperty 'global'

    name = Class.name || args.toString().match(/^function\s(\w+)\(/)[1]

    [proto, target[name]] = [
      (target[name] or undefined),
      Class
    ]

    if proto?
      target[name][i] = proto[i] for i of proto

