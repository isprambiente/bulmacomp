# Bulmacomp
[![Maintainability](https://api.codeclimate.com/v1/badges/b44e91b4f303eb7962b3/maintainability)](https://codeclimate.com/github/isprambiente/bulmacomp/maintainability)
[![Rails Test](https://github.com/isprambiente/bulmacomp/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/isprambiente/bulmacomp/actions/workflows/rubyonrails.yml)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](https://www.rubydoc.info/github/isprambiente/bulmacomp)


Bulmacomp is a [ViewComponent](https://viewcomponent.org/) collection for [Bulma](https://bulma.io/) css framework.

Bulmacomp provide a "view component" for each bulma component:

* [Breadcrumb](https://bulma.io/documentation/components/breadcrumb/) - Bulmacomp::BreadcrumbComponent
* [Card](https://bulma.io/documentation/components/card/) - Bulmacomp::CardComponent
* [Dropdown](https://bulma.io/documentation/components/dropdown/) - Bulmacomp::DropdownComponent
* [Menu](https://bulma.io/documentation/components/menu/) - Bulmacomp::MenuComponent
* [Message](https://bulma.io/documentation/components/message/) - Bulmacomp::MessageComponent
* [Modal](https://bulma.io/documentation/components/modal/) - Bulmacomp::ModalCompoent
* [Navbar](https://bulma.io/documentation/components/navbar/) - Bulmacomp::NavbarCompoent
* [Pagination](https://bulma.io/documentation/components/pagination/) - Bulmacomp::PaginationComponent
* [Panel](https://bulma.io/documentation/components/panel/) - Bulmacomp::PanelComponent
* [Tabs](https://bulma.io/documentation/components/tabs/) - Bulmacomp::TabsComponent

## Installation
Add this line to your application's Gemfile:

```ruby
gem "bulmacomp"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bulmacomp
```

## Usage
Bulmacomp provide standard view components. You can simply render of a new instance of the components with your parameters:
```ruby
render Bulmacomp::MessageComponent.new(title: 'example', close: true) do
  Some content
end
```
returns
```html
<article class="message">
  <div class="message-header">
    <p>Example</p>
    <button id="close" class="delete" aria-label="delete"></button>
  </div>
  <div class="message-body">Some content</div>
</article>
```
You can get more details from [View Component site](https://viewcomponent.org/) and [Bulmacom documentation](https://rubydoc.info/github/isprambiente/bulmacomp/main)

## Contributing
Issues, forks and pull requests are welcomed

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
