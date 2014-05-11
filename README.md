style.js
===

DEMO URL: (http://dhilipsiva.com/style.js/)[http://dhilipsiva.com/style.js/]
GitHub URL: (https://github.com/dhilipsiva/style.js)[https://github.com/dhilipsiva/style.js]
BLOG URL: (http://dhilipsiva.com/2014/05/11/style-js.html)[http://dhilipsiva.com/2014/05/11/style-js.html]

A layman's tool to style HTML Elements and share CSS values

### Motive behind style.js

I often work with `Non-techie Entrepreneurs`. While they are virtually always happy about the functionality, a lot of time is being wasted on UI iterations. You know, like change color, size, background, alignment, position, etc. I had to make changes, test, commit, push, deploy, client-check and repeat until client is happy. I got sick of it and built this tool. Now, I ll just integrate and configure this stuff. The client can make changes according to the configuration and download (without server interaction) the changes as `json` file and mail it to me. No more back-and-forth circus.

### Get Started

Avoid the back-and-forth circus with 3 Steps.

1. Add and configure `style.js`
2. Ask your non-techie client / boss to make changes using the configured GUI.
3. After they make change, ask them to download the JSON file and send it to you.

#### Add and configure `style.js`

Have a look at [index.html](https://github.com/dhilipsiva/style.js/blob/master/index.html) to see how to fix add and configure `style.js`

#### Ask your non-techie client / boss to make changes using the configured GUI

![Make Changes](https://raw.githubusercontent.com/dhilipsiva/style.js/master/images/make-changes.png "Make Changes")

#### After they make change, ask them to download the JSON file and send it to you.

![Download](https://raw.githubusercontent.com/dhilipsiva/style.js/master/images/download.png "Download")

![JSON](https://raw.githubusercontent.com/dhilipsiva/style.js/master/images/json.png "JSON")

### Sample configuration

```javascript
var config;
config = {
    name: "Demo Page",
    toolbar: "#style-js-toolbar",
    // `items`: Collection of tweakable sets
    items: [{
        // `name`: Human-Friendly name for this item
        name: "Demo Element",
        // `selectors`: Selectors that these tweaks apply to.
        // `selectors` any string that is accceptable by `querySelectorAll` javascript API
        selectors: "#style-js-demo",
        // `properties`: collection of `css` properties
        properties: [{
            // `name`: name of the css properties. All CSS properties are supported.
            name: "background-color",
            // `initial`: initial value for this property(optional)
            initial: "#0bee92",
            // `type`: `type` attribute of the `<input>` tag
            // `type`: can be any value that is supported by the `<input>`s `type` attribute
            type: "color"
        }, {
            name: "font-size",
            initial: "12px",
            type: "text"
        }]
    },{
        name: "Second line",
        selectors: "#style-js-demo-2",
        properties: [{
            name: "color",
            initial: "#FD4FFC",
            type: "color"
        },{
            name: "font-size",
            initial: "15px",
            type: "text"
        }]
    }]
};
```

### Browser Support

Works well with chrome. I didn't test it with any other browsers, but I am guessing it should work OK. Chrome is all that matters. Because if the Client you are building the product for is not ready to use latest Chrome for testing, maybe you should not build a product for him. This is something that is to be used only during the development. So I believe Chrome is good Enough. Pull requests are always welcomed.


