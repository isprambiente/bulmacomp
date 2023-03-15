# frozen_string_literal: true

# Make an html structure for a bulma/awesome text-icon
#
# @param [Hash] opts to generate content
# @option opts [String] :title card title content
# @option opts [String] :image card image content
# @option opts [String] :footer card footer content
# @option opts [String] :* each other key going as tag option
# @param [Proc] content cat content
class Bulmacomp::NavbarComponent < ViewComponent::Base
  def initialize(brand: nil, **opts)
    @brand = brand
    @opts = opts
    @opts[:class] = ['navbar', opts[:class]]
    @opts[:role] = ['navigation', opts[:role]]
    @opts[:aria_label] = ['main navigation', opts[:aria_label]]
  end

  # @return [String] html_safe card
  def call
    tag.div safe_join([navbar_brand, navbar_menu]), **@opts
  end

  def navbar_brand
    tag.div safe_join([link_to(@brand, root_path, data_turbo_frame: 'yield', class: 'navbar-item'), navbar_burger]),
            class: 'navbar-brand'
  end

  def navbar_menu
    tag.div(content, class: 'navbar-menu')
  end

  # return [String] content section if a content is present
  def navbar_burger
    tag.a burger_row * 3, class: 'navbar-burger', aria_label: 'menu', aria_expanded: 'false',
                          data_action: 'page#toggleMenu'
  end

  # return [String] footer section if a footer is present
  def burger_row
    tag.span aria_hidden: true
  end
end
