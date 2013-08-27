window.app
  .factory 'str', ->
    camelize: (input) ->
      pieces = input.split(/[\W_-]/)
      each(pieces, capitalize).join("")
    capitalize: (input) ->
      input.charAt(0).toUpperCase() + input.slice(1)
