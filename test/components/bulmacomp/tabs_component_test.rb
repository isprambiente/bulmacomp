# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class TabsComponentTest < ViewComponent::TestCase
    # @return [Array] example elements array
    def elements
      [1, 2, 3]
    end

    # @return [String] example yield content
    def yield_text
      '<li class="active">4</li>'.html_safe
    end

    # empty tabs
    test 'empty tabs' do
      render_inline Bulmacomp::TabsComponent.new
      assert_selector 'div.tabs'
      assert_selector 'div.tabs ul'
    end

    # tabs with element
    test 'tabs with elements' do
      render_inline Bulmacomp::TabsComponent.new(elements: elements)
      assert_selector 'div.tabs ul li', text: '1'
      assert_selector 'div.tabs ul li', text: '2'
      assert_selector 'div.tabs ul li', text: '3'
    end

    # tabs with yield
    test 'tabs with yield' do
      render_inline Bulmacomp::TabsComponent.new.with_content(yield_text)
      assert_selector 'div.tabs ul li.active', text: '4'
    end

    # full tabs
    test 'full tabs' do
      render_inline Bulmacomp::TabsComponent.new(elements: elements, id: 'ok').with_content(yield_text)
      assert_selector 'div.tabs ul li', text: '1'
      assert_selector 'div.tabs ul li', text: '2'
      assert_selector 'div.tabs ul li', text: '3'
      assert_selector 'div.tabs ul li.active', text: '4'
    end
  end
end
