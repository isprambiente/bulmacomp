# frozen_string_literal: true

# Make an html structure for a bulma/awesome text-icon
#
# @param [Hash] opts to generate content
# @option opts [String] :title card title content
# @option opts [String] :image card image content
# @option opts [String] :footer card footer content
# @option opts [String] :* each other key going as tag option
# @param [Proc] content cat content
module Bulmacomp
  class CardComponent < ViewComponent::Base
    def initialize(title: nil, image: nil, footer: nil, **opts)
      @title = title
      @image = image
      @footer = footer
      @opts = opts
      @opts[:class] = ['card', opts[:class]]
    end

    # @return [String] html_safe card
    def call
      tag.div safe_join([card_title, card_image, card_content, card_footer]), **@opts
    end

    # return [String] title section if :title is set
    def card_title
      tag.div(tag.div(@title, class: 'card-header-title'), class: 'card-header') if @title
    end

    # return [String] image section if :image is set
    def card_image
      tag.div(tag.figure(image_tag(@image, alt: @title), class: 'image'), class: 'card-image') if @image
    end

    # return [String] content section if a content is present
    def card_content
      tag.div(tag.div(content, class: 'content'), class: 'card-content') if content
    end

    # return [String] footer section if a footer is present
    def card_footer
      tag.div @footer, class: 'card-footer' if @footer
    end
  end
end
