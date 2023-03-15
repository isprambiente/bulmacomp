# frozen_string_literal: true

# Make an html structure for a bulma breadcrumb
#
# @param [List] *list, list of elements to add in the breadcrumb
# @param [Hash] opts to nav tag
# @param [Proc] add code in the breadcrumb
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
# @example Breadcrump with content:
#   render Bulmacomp::BreadcrumbComponent.new() do
#      <li><a href="#">Bulma</a></li>
#   end
#
#   <nav class="breadcrumb" aria-label="breadcrumbs">
#     <ul>
#       <li><a href="#">Bulma</a></li>
#    </ul>
#   </nav>
#
# Options, list and content are mixable.
class Bulmacomp::BreadcrumbComponent < ViewComponent::Base
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
