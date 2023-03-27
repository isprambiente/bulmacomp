# frozen_string_literal: true

module Bulmacomp
  # Make an HTML [turbo Frame](https://turbo.hotwired.dev/handbook/frames) structure.
  #
  # @example empty turbo frame, on default when the compoent is have't yield content, is added a lod icon
  #   = render Layout::TurboFrameComponent.new
  #
  #   <turbo-frame>
  #     <span class="icon"><i class="fas fa-sync fa-spin fa-2x"></i></span>
  #   </turbo-frame>
  #
  # @example with id and src (to load remote content)
  #   = render Layout::TurboFrameComponent.new(id: 'nav1', src: books_path )
  #
  #   <turbo-frame id='nav1' src='/books'>
  #     <span class="icon"><i class="fas fa-sync fa-spin fa-2x"></i></span>
  #   </turbo-frame>
  #
  # @example with no icon
  #   = render Layout::TurboFrameComponent.new(icon: nil, id: 'nav1', src: books_path )
  #
  #   <turbo-frame id='nav1' src='/books'></turbo-frame>
  #
  # @example with yield content
  #   = render Layout::TurboFrameComponent.new do
  #     some text
  #
  #   <turbo-frame>some text</turbo-frame>
  class TurboFrameComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @param [String] icon
    #   text to add whe yield content is empty
    #   default: [default_icon]
    # @option opts [String] :*
    #   each other key going as tag option
    # @yield [optional] turbo frame content
    def initialize(icon: default_icon, **opts)
      super
      @icon = icon
      @opts = opts
    end

    # @return [String] html turbo frame
    def call
      content_tag('turbo-frame', (content || @icon), **@opts)
    end

    # default value for icon
    def default_icon
      tag.span tag.i(class: 'fas fa-sync fa-spin fa-2x'), class: 'icon'
    end
  end
end
