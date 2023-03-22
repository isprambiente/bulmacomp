# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class MessageComponentTest < ViewComponent::TestCase
    # empty message
    test 'empty message' do
      render_inline Bulmacomp::MessageComponent.new
      assert_selector 'article.message', text: nil
    end

    # message with title
    test 'with title' do
      render_inline Bulmacomp::MessageComponent.new(title: 'test title')
      assert_selector 'article.message .message-header p', text: 'test title'
    end

    # message with close button and close tag options
    test 'close button' do
      render_inline Bulmacomp::MessageComponent.new(close: true, close_option: { id: 'close_ok' })
      assert_selector 'article.message .message-header', text: nil
      assert_selector 'article.message .message-header button#close_ok.delete[aria-label="delete"]', text: nil
    end

    # message with yield
    test 'with yield' do
      render_inline Bulmacomp::MessageComponent.new.with_content('ok')
      assert_selector 'article.message .message-body', text: 'ok'
    end
  end
end
