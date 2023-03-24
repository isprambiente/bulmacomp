# frozen_string_literal: true

module Bulmacomp
  # Make an html structure for a bulma dropdown
  #
  # @example empty dropdown
  #   render Bulmacomp::DropdownComponent.new()
  #
  #   <div class="dropdown">
  #     <div class="dropdown-trigger">
  #       <button class="button" aria-haspopup="true" aria-controls="dropdown-menu">
  #         <span class="icon is-small"><i class="fas fa-angle-down" aria-hidden="true"></i></span>
  #       </button>
  #    </div>
  #    <div class="dropdown-menu" role="menu">
  #      <div class="dropdown-content"></div>
  #     </div>
  #   </div>
  # @example dropdown with title and elements
  #   render Bulmacomp::DropdownComponent.new(title: 'title', elements: [1,2])
  #
  #   <div class="dropdown">
  #     <div class="dropdown-trigger">
  #       <button class="button" aria-haspopup="true" aria-controls="dropdown-menu">
  #         <span>title</span>
  #         <span class="icon is-small"><i class="fas fa-angle-down" aria-hidden="true"></i></span>
  #       </button>
  #    </div>
  #    <div class="dropdown-menu" role="menu">
  #      <div class="dropdown-content">
  #        <div class="dropdown-item">1</div>
  #        <div class="dropdown-item">2</div>
  #      </div>
  #     </div>
  #   </div>
  #
  # @example dropdown with yield, elements and other option
  #   = render Bulmacomp::DropdownComponent.new(title: 'title', elements: [1,2], id: 'menu',
  #                                 button_options: {class: 'button is-success'}, icon: nil) do
  #     some content
  #
  #   <div class="dropdown">
  #     <div class="dropdown-trigger">
  #       <button class="button is-success" aria-haspopup="true" aria-controls="dropdown-menu">
  #         <span>title</span>
  #       </button>
  #    </div>
  #    <div class="dropdown-menu" role="menu">
  #      <div class="dropdown-content">
  #        <div class="dropdown-item">1</div>
  #        <div class="dropdown-item">2</div>
  #        some content
  #      </div>
  #     </div>
  #   </div>
  #
  class DropdownComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @option opts [String] title
    #   Content of button, default empty string
    # @option opts [Array<String>] elements
    #   collection of dropdown-item
    # @option opts [String] icon
    #   icon span class content for button,
    #   default: <i class="fas fa-angle-down" aria-hidden="true"></i>
    # @option opts {Hash} button_options
    #   options for button tag
    # @option opts [String] :*
    #   each key going as content tag option, default is class: 'dropdown'
    # @yield [optional] dropdown content
    def initialize(title: nil, elements: [], icon: default_icon, button_options: {}, **opts)
      super
      @title = tag.span title if title.present?
      @elements = elements
      @icon = tag.span icon, class: 'icon is-small' if icon.present?
      @button_options = default_button_options.merge(button_options)
      @opts = default_opts.merge(opts)
    end

    # @return [String] default content for button icon
    def default_icon
      '<i class="fas fa-angle-down" aria-hidden="true"></i>'.html_safe
    end

    # @return [Hash] default option for content tag
    def default_opts
      { class: 'dropdown' }
    end

    # return [Hash] default option for button tag
    def default_button_options
      { class: 'button', aria: { haspopup: 'true', controls: 'dropdown-menu' } }
    end

    # Generated html string for bulma dropdown
    # @return [String]
    def call
      tag.div safe_join([tag_trigger, tag_content]), **@opts
    end

    # generated html for '.dropdown-trigger' div
    # @return [String]
    def tag_trigger
      tag.div tag.button(safe_join([@title, @icon]), **@button_options), class: 'dropdown-trigger'
    end

    # generated html for '.dropdown-content' div.
    # Map each content of {elements} in a '.dropdown-item' div and add yield content
    # @return [String]
    def tag_content
      tag.div safe_join([@elements.map { |e| tag.div(e, class: 'dropdown-item') }, content]), class: 'dropdown-content'
    end
  end
end
