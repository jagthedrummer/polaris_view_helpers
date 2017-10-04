# PolarisViewHelpers

## Intallation

Add this to your `Gemfile`

```
gem 'polaris_view_helpers'
```

## Using the Polaris CSS

Add this to your `layouts/application.html.erb` and/or
`layouts/embedded_app.html.erb`.

```
<%= polaris_css =%>
```

If you need to specify a particular version of the CSS you can do so:

```
<%= polaris_css '1.0.3' =%>
```

## Setting up your page

In `layouts/application.html.erb` and/or
`layouts/embedded_app.html.erb` you'll want to replace the conent
between the `<body>` tags with something like this:

```
  
```




This project rocks and uses MIT-LICENSE.
