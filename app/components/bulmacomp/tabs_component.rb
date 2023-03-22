# frozen_string_literal: true

module Bulmacomp
  # Make an HTML strucrure for a bulma tabs
  #
  # @example Empty tabs
  #   render Bulmacomp::TabsComponent.new()
  #
  #   <div class="tabs">
  #     <ul></ul>
  #   </div>
  #
  # @example Tabs with elements
  #   entries = [link_to('one','#'), link_to('two','#')]
  #   render Bulmacomp::TabsComponent.new(entries: entries)
  #
  #   <div class="tabs">
  #     <ul>
  #       <li><a href='#'>one</li>
  #       <li><a href='#'>two</li>
  #     </ul>
  #   </div>
  #
  # @example yield
  #   = render Bulmacomp::TabsComponent.new() do
  #     <li class="active"><a href='#'>one</a></li>
  #
  #   <div class="tabs">
  #     <ul>
  #       <li class="active"><a href='#'>one</a></li>
  #     </ul>
  #   </div>
  #
  # @example Full tabs
  #   entries = [link_to('one','#'), link_to('two','#')]
  #   = render Bulmacomp::TabsComponent.new(entries: entries, id: 'ok') do
  #     <li class="active"><a href='#'>three</a></li>
  #
  #   <div class="tabs" id="ok">
  #     <ul>
  #       <li><a href='#'>one</li>
  #       <li><a href='#'>two</li>
  #       <li class="active"><a href='#'>three</a></li>
  #     </ul>
  #   </div>
  class TabsComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @option opts [Array<String>] element
    #   elements list for build tabs
    # @option opts [String] :*
    #   each key going as tag option, default is class: 'tabs'
    # @yield [optional] modal content
    def initialize(elements: [], **opts)
      super
      @elements = elements
      @opts = { class: 'tabs' }.merge opts
    end

    # Generate safe string with full bulma tabs
    # @return [String] html_safe generated bulma tabs
    def call
      tag.div ulify, **@opts
    end

    # generate a ul tag with map_elements and content
    # @return [String]
    def ulify
      tag.ul safe_join([map_elements, content])
    end

    # Map elements in a li tag
    # @return [String]
    # @example
    #   Bulmacomp::TabsComponent.new(elements).map_elements
    #
    #   <li>1</li><li>2</li><li>3</li>
    def map_elements
      safe_join(@elements.map { |e| tag.li e })
    end
  end
end
