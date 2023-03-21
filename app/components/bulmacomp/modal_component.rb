# frozen_string_literal: true

module Bulmacomp
  # Make an html structure for a bulma breadcrumb
  #
  # @example Empty modal:
  #   = render Bulmacomp::PanelComponent.new()
  #
  #   <div class="modal">
  #     <div class="modal-background"></div>
  #     <div class="modal-content"></div>
  #     <button class="modal-close is-large" aria-label="close"></button>
  #   </div>
  #
  # @example Modal with content:
  #   = render Bulmacomp::PanelComponent.new() do
  #     %p some content
  #
  #   <div class="modal">
  #     <div class="modal-background"></div>
  #     <div class="modal-content"><p>Some content</p></div>
  #     <button class="modal-close is-large" aria-label="close"></button>
  #   </div>
  class ModalComponent < ViewComponent::Base
    # @param [Hash] opts options to generate content
    # @option opts [String] :* each key going as tag option, default is class: 'modal'
    # @yield [optional] modal content
    def initialize(**opts)
      super
      @opts = { class: 'modal' }.merge opts
    end

    # return [String] html_safe generated bulma modal
    def call
      content_tag :div, safe_join([
                                    tag.div(class: 'modal-background'),
                                    tag.div(content, class: 'modal-content'),
                                    tag.button(class: 'modal-close is-large', aria_label: 'close')
                                  ]), **@opts
    end
  end
end
