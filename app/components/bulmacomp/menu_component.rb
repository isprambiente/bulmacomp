# frozen_string_literal: true

module Bulmacomp
  # Make the html strucrure for a bulma menu
  #
  # @example Empty menu
  #   = render Bulmacomp::MenuComponent.new
  #
  #   <aside class='menu'></aside>
  #
  # @example menu with title and elements
  #   title = 'Menu title'
  #   elements  = [link_to('first entry', '#'), link_to('second entry', '#')
  #   render Bulmacomp::MenuComponent.new(elements: elements, title: title)
  #
  #   <aside class='menu'>
  #     <p class='menu-label'>Menu title</p>
  #     <ul>
  #       <li><a href='#'>first entry</li>
  #       <li><a href='#'>second entry<li>
  #     </ul>
  #   </aside>
  #
  # @example menu with title and annidate elements
  #   elements = ['Uno',['Due',['Tre','Quattro']]]
  #   = render Bulmacomp::MenuComponent.new(elements: elements)
  #
  #   <aside class='menu'>
  #     <p class='menu-label'>Uno</p>
  #     <ul>
  #       <li>Due</li>
  #       <li>
  #         Tre
  #         <ul>
  #           <li>Quattro</li>
  #         </ul>
  #       <li>
  #     </ul>
  #   </aside>
  #
  # @example with conetent
  #   = render Bulmacomp::MenuComponent.new do
  #     %p some content
  #
  #   <aside class='menu'>
  #     <p>some content</p>
  #   </aside>
  #
  # @example with mixed conetent (arguments before)
  #   elements = ['argument content',['argoument menu']]
  #   = render Bulmacomp::MenuComponent.new(elements: elements) do
  #     %p yield content
  #
  #   <aside class='menu'>
  #     <p class='menu-label'>argoument content</p>
  #     <ul>
  #       <li>argoument menu</li>
  #     </ul>
  #     <p>yield content</p>
  #   </aside>
  #
  class MenuComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @option opts [Array<String>] elements
    #   each entry is used to generate menu elements throug {first_level} method
    # @option opts [String] :*
    #   each key going as tag option, default is class: 'menu'
    def initialize(elements: [], **opts)
      super
      @elements = elements
      @opts = { class: 'menu' }.merge(opts)
    end

    # Generate an html safe string with full bulma menu.
    # @return [String] html string menu
    def call
      tag.aside first_level(@elements) + content, **@opts
    end

    # Generate a string with all bulma menu element from `values` param.
    #
    # Each element in `values` is mapped:
    # * as `p.menu-title` tag if is not an Array
    # * as {map_menu} if is an Array
    # @return [String]
    # @param [Array] values menu elements
    # @example
    #   Bulmacomp::MenuComponent.new().first_level(['Uno',['Due','Tre']])
    #
    #   <p class='menu-label'>Uno</p><ul><li>Due</li><li>Tre<li></ul>
    def first_level(values = [])
      safe_join(
        values.map { |e| e.is_a?(Array) ? map_menu(e) : tag.p(e, class: 'menu-label') }
      )
    end

    # Generate a string with the "real" menu elements (no title)
    # from 'values' param. The menu elements are incapsulated in a ul tag
    #
    # Each element in 'values' is mapped:
    # * as li tag if is not an Array
    # * as {sub_menu} if is an Array
    # @return [String]
    # @param [Array] values menu elements
    # @example
    #   Bulmacomp::MenuComponent.new().map_menu(['Uno',['Due','Tre']])
    #
    #   <ul><li>Uno</li><li>Due<ul><li>Tre</li></ul></li></ul>
    def map_menu(values = [])
      tag.ul safe_join(values.map { |e| e.is_a?(Array) ? sub_menu(e) : tag.li(e) })
    end

    # Generate a string with sub-menu content from values params.
    # The first array element is used as ancescor, other element
    # are used to make the sub menu with {map_menu} method.
    # @return [String]
    # @param [Array] values sub-menu elements
    # @example
    #   Bulmacomp::MenuComponent.new().sub_menu(['Uno',['Due','Tre']])
    #
    #   <li>Uno<ul><li>Due</li><li>Tre</li></ul></li>
    def sub_menu(values = [])
      tag.li safe_join([values.shift, map_menu(values)])
    end
  end
end
