# frozen_string_literal: true

module Bulmacomp
  # Make an html structure for a bulma breadcrumb
  #
  # @example Empty panel:
  #   render Bulmacomp::PanelComponent.new()
  #
  #   <nav class="panel">
  #   </nav>
  #
  # @example panel with option:
  #   = render Bulmacomp::PanelComponent.new(title: 'test title') do
  #     <a class="panel-block is-active">
  #       <span class="panel-icon"><i class="fas fa-book" aria-hidden="true"></i></span>
  #       bulma
  #     </a>
  #
  #   <nav class="panel">
  #     <p class="panel-heading">test title</p>
  #     <a class="panel-block is-active">
  #       <span class="panel-icon"><i class="fas fa-book" aria-hidden="true"></i></span>
  #       bulma
  #     </a>
  #   </nav>
  class PanelComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @option opts [String] :title
    #   panel title
    # @option opts [String] :*
    #   each other key going as tag option, default is class: 'panel'
    # @yield [optional]
    #   panel content
    def initialize(title: nil, **opts)
      super
      @title = title
      @opts = { class: 'panel' }.merge(opts)
    end

    # return [String] html_safe generated bulma panel
    def call
      content_tag :nav, safe_join([title, content]), **@opts
    end

    # return [String] html_safe generated panel title
    def title
      tag.p @title, class: 'panel-heading' if @title
    end
  end
end
