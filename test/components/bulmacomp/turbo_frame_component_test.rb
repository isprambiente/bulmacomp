# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class TurboFrameComponentTest < ViewComponent::TestCase
    # empty turbo frame
    test 'empty' do
      render_inline Bulmacomp::TurboFrameComponent.new
      assert_selector 'turbo-frame', text: nil
      assert_selector 'turbo-frame span.icon i.fas.fa-sync.fa-spin.fa-2x', text: nil
    end

    # turbo frame with id and src
    test 'with id and src' do
      render_inline Bulmacomp::TurboFrameComponent.new(id: 'nav1', src: '/books')
      assert_selector 'turbo-frame#nav1[src="/books"]', text: nil
      assert_selector 'turbo-frame span.icon i.fas.fa-sync.fa-spin.fa-2x', text: nil
    end

    # turbo frame without icon
    test 'no icon' do 
      render_inline Bulmacomp::TurboFrameComponent.new(icon: nil)
      assert_selector 'turbo-frame:empty', text: nil
    end

    # turbo frame with yield content
    test 'with content' do
      render_inline Bulmacomp::TurboFrameComponent.new.with_content('some text')
      assert_selector 'turbo-frame', text: 'some text'
      assert_selector 'turbo-frame:not(:has(> *))'
    end
  end
end
