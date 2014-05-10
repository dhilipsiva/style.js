style.js
===

A layman's tool to style HTML Elements and share CSS values

### Motive behind style.js

I often work with `Non-techie Entrepreneurs`. While they are virtually always happy about the functionality, a lot of time is being wasted on UI iterations. You know, like change color, size, background, alignment, position, etc. I had to make changes, test, commit, push, deploy, client-check and repeat until client is happy. I got sick of it and built this tool. Now, I ll just integrate and configure this stuff. The client can make changes according to the configuration and download (without server interaction) the changes as `json` file and mail it to me. No more back-and-forth circus.

### Get Started

Look at [`demo.html`](http://dhilipsiva.github.io/style.js/demo.html) to see how to use style.js.

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>style.js demo :)</title>
        <link href="css/demo.css" media="all" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="style-js-demo" style="background-color:#0bee92;font-size:12px;">
            <h1>style.js demo :)<h1>
        </div>
        <div id="style-js-demo-2" style="color:#FD4FFC;font-size:15px;">
            <h3>Now, its possible for non-techies to make css changes and send the desired values.</h3>
            <h2>How cool is that?</h2>
        </div>
        <div>
            <h4>Add any css property and its appropriate input-type to the config.</h4>
        </div>
        <table id="style-js-toolbar" style="display:hide;">
        </table>
    </body>
    <script type="text/javascript" charset="utf-8" src="src/js/style.js"></script>
    <script type="text/javascript" charset="utf-8">
        var config;
        config = {
            name: "Demo Page",
            toolbar: "#style-js-toolbar",
            items: [{
                name: "Demo Element",
                selectors: "#style-js-demo",
                properties: [{
                    name: "background-color",
                    initial: "#0bee92",
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
        var style = new StyleJS(config);
        style.show()
    </script>
</html>
```

dhilipsiva
