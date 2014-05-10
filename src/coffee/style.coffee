"use strict"

#
#* ProjectName: style.js
#* Name: dhilipsiva
#* Email: dhilipsiva@gmail.com
#* Username: dhilipsiva
#* Site: http://dhilipsiva.com
#* Github: https://github.com/dhilipsiva/style.js
#* Twitter: @dhilipsiva
#

String::capitalize = ->
  # Capitalize first word
  @substr(0, 1).toUpperCase() + @substr(1)


String::toJSProperty = ->
  #
  #* Conver CSS property to JS Property
  #* Ex. `background-color` to `backgroundColor`
  #
  js_prop = @split('-')
  .map((e)-> e.capitalize())
  .join ''
  js_prop.substr(0, 1).toLowerCase() + js_prop.substr(1)


class StyleJS
  element: null
  items: []
  constructor: (@config) ->
    @element = document.createElement "div"

    for item in @config.items
      elements = document.body.querySelectorAll item.selectors

      for property in item.properties
        input = document.createElement 'input'
        input.setAttribute 'type', property.type
        input.setAttribute 'data-property', property.name
        input.value = property.initial

        input.onchange = ->
          for element in elements
            targAttr = @getAttribute "data-property"
            targAttr = targAttr.toJSProperty()
            element.style[targAttr] = @value

        input.onkeyup = input.onchange
        @element.appendChild input

    document.body.appendChild @element

  showIn: (selector)->

  hide: ->
    alert "Not Implemented"

  show: ->
    alert "Not Implemented"

window.StyleJS = StyleJS
