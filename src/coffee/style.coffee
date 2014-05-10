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


class Objectify
  constructor: (@name)->
    @obj = {}
    @obj['name'] = @name

  add: (selectors, property, value)->
    if !@obj[selectors]
      @obj[selectors] = {}
    @obj[selectors][property] = value

  href: ->
    "data:text/json;charset=utf-8,#{encodeURIComponent(JSON.stringify(@obj, undefined, 4))}"


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
  downloadButton: null

  constructor: (@config) ->

    @element = document.createElement "div"
    @element.className = "style-js-root"
    @downloadButton = document.createElement "a"
    @downloadButton.download = "stylejs.json"
    @downloadButton.innerHTML = "download"
    @objectify = new Objectify
    self = @

    for item in @config.items
      elements = document.body.querySelectorAll item.selectors

      for property in item.properties
        input = document.createElement 'input'
        input.setAttribute 'type', property.type
        input.setAttribute 'data-property', property.name
        input.setAttribute 'data-selectors', item.selectors
        input.value = property.initial
        input.className = "style-js-input"

        input.onchange = ->
          targAttr = @getAttribute "data-property"
          value = @value
          targSelectors = @getAttribute "data-selectors"

          self.objectify.add targSelectors, targAttr, value
          self.downloadButton.href = self.objectify.href()

          targAttrJS = targAttr.toJSProperty()

          for element in elements
            element.style[targAttrJS] = @value

        input.onkeyup = input.onchange
        @element.appendChild input

    @element.appendChild @downloadButton
    document.body.appendChild @element

  showIn: (selector)->
    alert "Not Implemented"

  hide: ->
    alert "Not Implemented"

  show: ->
    alert "Not Implemented"


window.StyleJS = StyleJS
