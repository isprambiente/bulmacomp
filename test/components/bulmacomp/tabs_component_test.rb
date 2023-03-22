# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class TabsComponentTest < ViewComponent::TestCase
    # empty tabs
    test 'empty tabs' do
      render_inline Bulmacomp::TabsComponent.new
      assert_selector 'div.tabs'
      assert_selector 'div.tabs ul'
    end

    # tabs with element
    test 'tabs with elements' do
      render_inline Bulmacomp::TabsComponent.new(elements: [1, 2, 3])
      assert_selector 'div.tabs ul li', text: '1'
      assert_selector 'div.tabs ul li', text: '2'
      assert_selector 'div.tabs ul li', text: '3'
    end

    # tabs with yield
    test 'tabs with yield' do
      render_inline Bulmacomp::TabsComponent.new.with_content('<li class="active">1</li>'.html_safe)
      assert_selector 'div.tabs ul li.active', text: '1'
    end

    # full tabs
    test 'full tabs' do
      render_inline Bulmacomp::TabsComponent.new(elements: [1, 2],
                                                 id: 'ok').with_content('<li class="active">3</li>'.html_safe)
      assert_selector 'div.tabs ul li', text: '1'
      assert_selector 'div.tabs ul li', text: '2'
      assert_selector 'div.tabs ul li.active', text: '3'
    end
  end
end
