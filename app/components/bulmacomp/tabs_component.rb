# frozen_string_literal: true

module Bulmacomp
  # Make an HTML strucrure for a bulma tabs
  #
  # @example
  #   render Bulmacomp::TabsComponent.new()
  #
  #   <div class="tabs">
  #     <ul></ul>
  #   </div>
  #
  # @example tabs with elements
  #   elements = [link_to('one','#'), link_to('two','#')]
  #   render Bulmacomp::TabsComponent.new(elements: elements)
  #
  #   <div class="tabs">
  #     <ul>
  #       <li><a href='#'>one</li>
  #       <li><a href='#'>two</li>
  #     </ul>
  #   </div>
  #
  # @example tabs with yield content
  #   = render Bulmacomp::TabsComponent.new() do
  #     %li some text
  #
  #   <div class="tabs">
  #     <ul>
  #       <li>some text</li>
  #     </ul>
  #   </div>
  #
  # @example tabs with full options
  #   elements = [link_to('one','#'), link_to('two','#')]
  #   = render Bulmacomp::TabsComponent.new(elements: elements, id: 'ok') do
  #     %li some text
  #
  #   <div class="tabs" id="ok">
  #     <ul>
  #       <li><a href='#'>one</li>
  #       <li><a href='#'>two</li>
  #       <li>some text</li>
  #     </ul>
  #   </div>
  class TabsComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @param [Array<String>] elements
    #   array of elements for tabs collection
    # @option opts [String] :*
    #   each other key going as tag option, default is class: 'tabs'
    # @yield [optional] tabs content
    def initialize(elements: [], **opts)
      super
      @elements = elements
      @opts = { class: 'tabs' }.merge(opts)
    end

    # @return [String] html_safe tabs
    def call
      tag.div tag.ul(ul_content), **@opts
    end

    # @return [Text], safe join of elements arguments and proc content
    def ul_content
      safe_join([@elements.map { |e| tag.li(e) }, content])
    end
  end
end
