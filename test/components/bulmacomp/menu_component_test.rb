# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class MenuComponentTest < ViewComponent::TestCase
    test 'empty modal' do
      render_inline Bulmacomp::MenuComponent.new
      assert_selector 'aside.menu', text: nil
    end

    test 'menu with title' do
      elements = ['test']
      render_inline Bulmacomp::MenuComponent.new(elements: elements)
      assert_selector 'aside.menu p.menu-label', text: 'test'
    end

    test 'menu with elements' do
      elements = ['test', ['uno']]
      render_inline Bulmacomp::MenuComponent.new(elements: elements)
      assert_selector 'aside.menu ul li', text: 'uno'
    end

    test 'menu with sub menu' do
      elements = [['test', %w[uno due]]]
      render_inline Bulmacomp::MenuComponent.new(elements: elements)
      assert_selector 'aside.menu ul li', text: 'test'
      assert_selector 'aside.menu ul li', text: 'uno'
      assert_selector 'aside.menu ul li ul li', text: 'due'
    end

    test 'menu with sub sub menu' do
      elements = ['test', [['uno', %w[due tre]]]]
      render_inline Bulmacomp::MenuComponent.new(elements: elements)
      assert_selector 'aside.menu ul li', text: 'uno'
      assert_selector 'aside.menu ul li ul li', text: 'due'
      assert_selector 'aside.menu ul li ul li ul li', text: 'tre'
    end

    test 'menu with content' do
      render_inline Bulmacomp::MenuComponent.new.with_content('test')
      assert_selector 'aside.menu', text: 'test'
    end

    test 'mixed content' do
      text = '<p id="yield">test</p>'.html_safe
      elements = ['test', ['uno']]
      render_inline Bulmacomp::MenuComponent.new(elements: elements).with_content(text)
      assert_selector 'aside.menu', text: 'test'
      assert_selector 'aside.menu ul li', text: 'uno'
      assert_selector 'aside.menu p#yield', text: 'test'
    end
  end
end
