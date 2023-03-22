# frozen_string_literal: true

module Bulmacomp
  # Make an HTML strucrure for a bulma pagination
  #
  # @example Empty pagination
  #   render Bulmacomp::TabsComponent.new()
  #
  #  <nav class="pagination" role="navigation" aria-label="pagination"></nav>
  #
  # @example pagination with elements
  #   elements = ['<a class="pagination-link" aria-label="Goto page 1">1</a>']
  #   render Bulmacomp::TabsComponent.new(elements: elements)
  #
  #   <nav class="pagination" role="navigation" aria-label="pagination">
  #     <ul class='pagination-list'>
  #       <li><a class="pagination-link" aria-label="Goto page 1">1</a></li>
  #     </ul>
  #   </nav>
  #
  # @example with elements and pre
  #   pre = [
  #     link_to('Previus', '#', class: 'pagination-previous'),
  #     link_to('Next', '#', class: 'pagination-next')
  #     ]
  #   elements = ['<a class="pagination-link" aria-label="Goto page 1">1</a>']
  #   render Bulmacomp::TabsComponent.new(elements: elements, pre: pre)
  #
  #   <nav class="pagination" role="navigation" aria-label="pagination">
  #    <a href="#" class="pagination-previous">Previous</a>
  #    <a href="#" class="pagination-next">Next</a>
  #     <ul class='pagination-list'>
  #       <li><a class="pagination-link" aria-label="Goto page 1">1</a></li>
  #     </ul>
  #   </nav>
  #
  # @example with yield
  #   = render Bulmacomp::TabsComponent.new() do
  #     %li= link_to 'test', '#'
  #
  #   <nav class="pagination" role="navigation" aria-label="pagination">
  #      <ul class='pagination-list'>
  #        <li><a href='#'>test</a></li>
  #      </ul>
  #   </nav>
  #
  # @example full pagination
  #   pre = [
  #     link_to('Previus', '#', class: 'pagination-previous'),
  #     link_to('Next', '#', class: 'pagination-next')
  #     ]
  #   elements = ['<a class="pagination-link" aria-label="Goto page 1">1</a>']
  #
  #   = render Bulmacomp::TabsComponent.new(elements: elements, pre: pre, id: 'ok') do
  #     %li= link_to 'test', '#'
  #
  #   <nav class="pagination" role="navigation" aria-label="pagination" id="ok">
  #    <a href="#" class="pagination-previous">Previous</a>
  #    <a href="#" class="pagination-next">Next</a>
  #     <ul class='pagination-list'>
  #       <li><a class="pagination-link" aria-label="Goto page 1">1</a></li>
  #       <li><a href='#'>test</a></li>
  #     </ul>
  #   </nav>
  class PaginationComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @option opts [Array<String>] elements
    #   elements list for build tabs
    # @option opts [Array<String>] pre
    #   element not in pagination list
    # @option opts [String] :*
    #   each key going as tag option, default:
    #   * class: "pagination"
    #   * role: "navigation"
    #   * aria_label: "pagination"
    # @yield [optional] modal content
    def initialize(elements: [], pre: [], **opts)
      super
      @elements = elements
      @pre = pre
      @opts = { class: 'pagination', role: 'navigation', aria_label: 'pagination' }.merge opts
    end

    # Generate safe string with bulma pagination
    # @return [String] html_safe generated bulma pagination
    def call
      tag.nav safe_join([@pre, ulify]), **@opts
    end

    # generate a ul tag with map_elements and content
    # @return [String]
    def ulify
      tag.ul safe_join([map_elements, content])
    end

    # Map elements in a li tag
    # @return [String]
    # @example
    #   Bulmacomp::TabsComponent.new(elements: [1,2,3]).map_elements
    #
    #   <li>1</li><li>2</li><li>3</li>
    def map_elements
      safe_join(@elements.map { |e| tag.li e })
    end
  end
end
