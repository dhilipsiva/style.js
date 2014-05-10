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


class ChangeManager
  constructor: (@name)->
    @obj = {}
    @obj['name'] = @name

  change: (selectors, property, value)->
    if !@obj[selectors]
      @obj[selectors] = {}
    @obj[selectors][property] = value

  data: ->
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
  toolbar: null
  downloadButton: null

  constructor: (@config) ->

    @toolbar = document.querySelector @config.toolbar
    @downloadButton = document.createElement "a"
    @downloadButton.download = "stylejs.json"
    @downloadButton.innerHTML = "Download Changes"
    @downloadButton.href = "#"
    @downloadButton.className = "style-js-download"

    @changeManager = new ChangeManager
    self = @

    for item in @config.items
      elements = document.body.querySelectorAll item.selectors
      item_header = document.createElement "th"
      item_header.innerHTML = "<h4>#{item.name}</h4>"
      @toolbar.appendChild item_header

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

          self.changeManager.change targSelectors, targAttr, value
          self.downloadButton.href = self.changeManager.data()

          targAttrJS = targAttr.toJSProperty()

          for element in document.body.querySelectorAll targSelectors
            element.style[targAttrJS] = @value

        input.onkeyup = input.onchange

        div = document.createElement "tr"
        div.className = "style-js-input-wrapper"

        label = document.createElement "td"
        label.className = "style-js-input-label"
        label.innerText = property.name

        input_tr = document.createElement "td"
        input_tr.className = "style-js-input"
        input_tr.appendChild input


        div.appendChild label
        div.appendChild input_tr

        @toolbar.appendChild div

    dld_header = document.createElement "th"
    dld_header.appendChild @downloadButton
    @toolbar.appendChild dld_header

  hide: ->
    @toolbar.style.display = "none"

  show: ->
    @toolbar.style.display = "block"


window.StyleJS = StyleJS
