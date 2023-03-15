# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class CardComponentTest < ViewComponent::TestCase
    # test empty card
    test 'empty_card' do
      render_inline Bulmacomp::CardComponent.new
      assert_selector '.card', text: nil
    end

    # test card with title
    test 'card_with_title' do
      render_inline Bulmacomp::CardComponent.new(title: 'title')
      assert_selector '.card .card-header .card-header-title', text: 'title'
    end

    # test card with image
    test 'card_with_image' do
      render_inline Bulmacomp::CardComponent.new(image: 'https://placekitten.com/200/300')
      assert_selector '.card .card-image figure.image img[src="https://placekitten.com/200/300"]'
    end

    # test card with content
    test 'card_with_content' do
      render_inline Bulmacomp::CardComponent.new.with_content('content')
      assert_selector '.card .card-content .content', text: 'content'
    end

    # test card with footer
    test 'card_with_footer' do
      render_inline Bulmacomp::CardComponent.new(footer: 'footer')
      assert_selector '.card .card-footer', text: 'footer'
    end
  end
end
