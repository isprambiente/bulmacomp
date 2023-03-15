# frozen_string_literal: true

class Bulmacomp::BreadcrumbComponent < ViewComponent::Base
  def initialize(*list, **opts)
    @list = list
    @opts = {class: "breadcrumb", aria: {label: "breadcrumbs"}}.merge(opts)
  end

  # @return [String] html_safe breadcrumb
  def call
    tag.nav tag.ul(ul_content), **@opts 
  end

  def ul_content
    safe_join(@list.map{|e| tag.li(e)}.<<(content))
  end
end
