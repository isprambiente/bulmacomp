# frozen_string_literal: true

class Bulmacomp::PanelComponent < ViewComponent::Base
  def initialize(title: nil, **opts)
    @title = title
    @opts = opts
    @opts[:class] = 'panel' unless @opts[:class]
  end

  # return generated bulma nav object
  def call
    content_tag :nav, safe_join([title, content]), **@opts
  end

  def title
    tag.p @title, class: 'panel-heading' if @title
  end
end
