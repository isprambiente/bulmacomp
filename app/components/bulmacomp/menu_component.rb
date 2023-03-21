# frozen_string_literal: true

module Bulmacomp
  # Make the html strucrure for a bulma menu
  #
  # @example Empty menu
  #   = render Bulmacomp::MenuComponent.new
  #
  #   <aside class='menu'></aside>
  #
  # @example menu with title and entries
  #   title = 'Menu title'
  #   menu  = [link_to('first entry', '#'), link_to('second entry', '#')
  #   render Bulmacomp::MenuComponent.new(title,menu)
  #
  #   <aside class='menu'>
  #     <p class='menu-label'>Menu title</p>
  #     <ul>
  #       <li><a href='#'>first entry</li>
  #       <li><a href='#'>second entry<li>
  #     </ul>
  #   </aside>
  #
  # @example menu with title and annidate entries
  #   = render Bulmacomp::MenuComponent.new('Uno',['Due',['Tre','Quattro']])
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
  #   = render Bulmacomp::MenuComponent.new('argument content',['argoument menu']) do
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
    # @param [Array<String,Array>] list
    #   each entry is used to generate menu entries throug {first_level} method
    # @param [Hash] opts
    #   options to generate content
    # @option opts [String] :*
    #   each key going as tag option, default is class: 'menu'
    def initialize(*list, **opts)
      super
      @list = list
      @opts = { class: 'menu' }.merge(opts)
    end

    # Generate an html safe string with full bulma menu.
    # @return [String] html string menu
    def call
      tag.aside first_level(@list) + content, **@opts
    end

    # Generate a string with all bulma menu element from `values` param.
    #
    # Each element in `values` is mapped:
    # * as `p.menu-title` tag if is not an Array
    # * as {map_menu} if is an Array
    # @return [String]
    # @param [Array] values menu entries
    # @example
    #   Bulmacomp::MenuComponent.new().first_level(['Uno',['Due','Tre']])
    #
    #   <p class='menu-label'>Uno</p><ul><li>Due</li><li>Tre<li></ul>
    def first_level(values = [])
      safe_join(
        values.map { |e| e.is_a?(Array) ? map_menu(e) : tag.p(e, class: 'menu-label') }
      )
    end

    # Generate a string with the "real" menu entries (no title)
    # from 'values' param. The menu entries are incapsulated in a ul tag
    #
    # Each element in 'values' is mapped:
    # * as li tag if is not an Array
    # * as {sub_menu} if is an Array
    # @return [String]
    # @param [Array] values menu entries
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
    # @param [Array] values sub-menu entries
    # @example
    #   Bulmacomp::MenuComponent.new().sub_menu(['Uno',['Due','Tre']])
    #
    #   <li>Uno<ul><li>Due</li><li>Tre</li></ul></li>
    def sub_menu(values = [])
      tag.li safe_join([values.shift, map_menu(values)])
    end
  end
end
