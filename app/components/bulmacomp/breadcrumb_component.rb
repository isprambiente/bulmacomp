# frozen_string_literal: true

module Bulmacomp
  # Make an html structure for a bulma breadcrumb
  #
  # @example Empty breadcrumb:
  #   render Bulmacomp::BreadcrumbComponent.new()
  #
  #   <nav class="breadcrumb" aria-label="breadcrumbs">
  #     <ul>
  #     </ul>
  #   </nav>
  #
  # @example Breadcrumb with elements:
  #   elements = [link_to('one','#'), link_to('two','#')]
  #   render Bulmacomp::BreadcrumbComponent.new(elements: elements)
  #   <nav class="breadcrumb" aria-label="breadcrumbs">
  #     <ul>
  #       <li><a href="#">one</a></li>
  #       <li><a href="#">two</a></li>
  #     </ul>
  #   </nav>
  #
  # @example Breadcrump with yield:
  #   render Bulmacomp::BreadcrumbComponent.new() do
  #      <li><a href="#">Bulma</a></li>
  #   end
  #
  #   <nav class="breadcrumb" aria-label="breadcrumbs">
  #     <ul>
  #       <li><a href="#">Bulma</a></li>
  #    </ul>
  #   </nav>
  class BreadcrumbComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @param [Array<String>] elements
    #   Objects to push into this breadcrumbs collection
    # @option opts [String] :*
    #   each other key going as tag option, default is class: 'breadcrumb', aria_label: 'breadcrumbs'
    # @yield [optional] card content
    def initialize(elements: [], **opts)
      super
      @elements = elements
      @opts = { class: 'breadcrumb', aria: { label: 'breadcrumbs' } }.merge(opts)
    end

    # @return [String] html_safe breadcrumb
    def call
      tag.nav tag.ul(ul_content), **@opts
    end

    # @return [Text], safe join of elements arguments and proc content
    def ul_content
      safe_join(@elements.map { |e| tag.li(e) }.<<(content))
    end
  end
end
