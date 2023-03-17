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
  # @example Empty breadcrumb with option:
  #   render Bulmacomp::BreadcrumbComponent.new(class: 'breadcrumb one', data: {entity: 'one'})
  #
  #   <nav class="breadcrumb one" aria-label="breadcrumbs" data-entity='one'>
  #     <ul>
  #     </ul>
  #   </nav>
  #
  # @example Breadcrumb with list element:
  #   render Bulmacomp::BreadcrumbComponent.new(link_to('one','#'), link_to('two','#'))
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
    # @param [Array<String>] list Any number of Objects to push into this collection
    # @param [Hash] opts options to generate content
    # @option opts [String] :* each other key going as tag option, default is class: 'breadcrumb', aria_label: 'breadcrumbs'
    # @yield [optional] card content
    def initialize(*list, **opts)
      @list = list
      @opts = { class: 'breadcrumb', aria: { label: 'breadcrumbs' } }.merge(opts)
    end

    # @return [String] html_safe breadcrumb
    def call
      tag.nav tag.ul(ul_content), **@opts
    end

    # @return [Text], safe join of list arguments and proc content
    def ul_content
      safe_join(@list.map { |e| tag.li(e) }.<<(content))
    end
  end
end
