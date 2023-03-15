# frozen_string_literal: true

# Common component
class CommonComponent < ViewComponent::Base
  include ApplicationHelper
  include Pagy::Frontend

  # Make an html structure for a bulma/awesome icon
  #
  # Example:
  # icon('fas fa-home')
  # `<span class="icon"><i class="fas fa-home"></i></span>`
  #
  # @return [String] bulma / awesome icon structure
  # @param [String] fa class for icon, example: "fas fa-home"
  # @param [Hash] opts to generate content
  # @option opts [String] :class style other "span.icon" class
  def icon(fa, **opts)
    content_tag :span, tag.i(class: fa), class: ['icon', opts[:class]]
  end

  # Make an html structure for a bulma/awesome text-icon
  #
  # Example:
  # icon('fas fa-home', 'text')
  # `<span class="text-icon"><span class="icon"><i class="fas fa-home"></i></span><span>text</span></span>`
  #
  # @return [String] bulma / awesome text-icon structure
  # @param [String] fa class for icon, example: "fas fa-home"
  # @param [String] text for the icon
  # @param [Hash] opts to generate content
  # @option opts [String] :class style other "span.icon-text" class
  # @option opts [String] :icon_class style other "span.icon" class
  def icon_text(fa, text, **opts)
    content_tag(
      :span,
      icon(fa, class: opts[:icon_class]) + content_tag(:span, text),
      class: ['icon-text', opts[:class]]
    )
  end

  def pagy(data)
    tag.div pagy_bulma_combo_nav_js(data).html_safe, data: { controller: 'pagy-initializer' }
  end
end
