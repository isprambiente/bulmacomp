# frozen_string_literal: true

module Bulmacomp
  # Make an html structure for a bulma card
  #
  # @example empty card
  #   render Bulmacomp::BreadcrumbComponent.new()
  #
  #   <div class="card"></div>
  # @example cart with title and yeld content
  #   render Bulmacomp::BreadcrumbComponent.new(title: 'test') do
  #     <p>test content</p>
  #   end
  #
  #   <div class="card">
  #     <div class="card-header">
  #       <div class="cart-header-title">test</div>
  #     </div>
  #     <div class="card-content">
  #       <div class="content"><p>test content</p>
  #     </div>
  #   </div>
  class CardComponent < ViewComponent::Base
    def initialize(title: nil, image: nil, footer: nil, **opts)
      @title = title
      @image = image
      @footer = footer
      @opts = { class: 'card' }.merge(opts)
    end

    # @return [String] html_safe card
    def call
      tag.div safe_join([card_title, card_image, card_content, card_footer]), **@opts
    end

    # @return [String] title section if :title is set
    # @example
    #   Bulmacomp::BreadcrumbComponent.new(title: 'test').title
    #
    #   <div class='card-header'><div class='card-header-title'>test</div></div>
    def card_title
      tag.div(tag.div(@title, class: 'card-header-title'), class: 'card-header') if @title
    end

    # return [String] image section if :image is set
    # @example
    #   Bulmacomp::BreadcrumbComponent.new(title: 'test', image: 'test.jpg').image
    #
    #   <div class='card-image'><img src='test.jpg' alt='test'></div>
    def card_image
      tag.div(tag.figure(image_tag(@image, alt: @title), class: 'image'), class: 'card-image') if @image
    end

    # return [String] content section if yield is present
    # @example
    #   Bulmacomp::BreadcrumbComponent.new().title do
    #     test content
    #   end
    #
    #   <div class="card-content"><div class="content"><p>test content</p></div>
    def card_content
      tag.div(tag.div(content, class: 'content'), class: 'card-content') if content
    end

    # return [String] footer section if a footer is present
    # @example
    #   Bulmacomp::BreadcrumbComponent.new(footer: 'test').footer
    #
    #   <div class='card-footer'>test</div>
    def card_footer
      tag.div @footer, class: 'card-footer' if @footer
    end
  end
end
