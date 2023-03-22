# frozen_string_literal: true

module Bulmacomp
  # Make an html structure for a bulma message
  #
  # @example Empty message
  #   render Bulmacomp::MessageComponent.new()
  #
  #   <article class="message"></article>
  #
  # @example Message with title
  #   render Bulmacomp::MessageComponent.new(title: 'test')
  #
  #   <article class="message">
  #     <div class="message-header"><p>test</p></div>
  #   </article>
  #
  # @example Message with close button and option
  #   render Bulmacomp::MessageComponent.new(close: true, close_option: {id: 'close'})
  #
  #   <article class="message">
  #     <div class="message-header"><button id="close" class="delete" aria-label="delete"></button></div>
  #   </article>
  #
  # @example Message with yield content
  #
  #   <article class="message">
  #     <div class="message-body">test</div>
  #   </article>
  class MessageComponent < ViewComponent::Base
    # @param [Hash] opts
    #   options to generate content
    # @option opts [String] title
    #   Title test, is added in 'article .message-header p' tag if present
    # @option opts [Boolean] close
    #   if TRUE add close button in title
    # @option opts [Hash] close_option
    #   parameters to close button tag
    # @option opts [String] :* 
    #   each key going as article tag option, default is class: 'message'
    # @yield [optional] message content
    def initialize(title: nil, close: false, close_option: {}, **opts)
      @title = title
      @close = close
      @close_option = close_option
      @opts = {class: 'message'}.merge opts
    end

    # return [String] generated bulma message
    def call
      tag.article safe_join([header, tag.div(content, class: 'message-body')]), **@opts
    end

    # return [String] div.message-header if @title or @close is present
    def header
      ret = []
      ret << tag.p(@title) if @title.present?
      ret << tag.button(**{class: 'delete', aria: {label: 'delete'}}.merge(@close_option)) if @close
      tag.div safe_join(ret), class: 'message-header' if ret.present?
    end
  end
end
