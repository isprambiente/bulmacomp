# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class DropdownComponentTest < ViewComponent::TestCase
    # example element content
    def elements
      [1, 2, 3]
    end

    # example icon content
    def icon
      '<i class="test"></i>'.html_safe
    end

    # empty dropdown
    test 'empty' do
      render_inline Bulmacomp::DropdownComponent.new
      assert_selector '.dropdown .dropdown-trigger button.button span.icon.is-small i.fas.fa-angle-down', text: nil
      assert_selector '.dropdown .dropdown-content:empty', text: nil
    end

    # empty with tag options
    test 'with tag options' do
      render_inline Bulmacomp::DropdownComponent.new(id: 'ok')
      assert_selector '#ok.dropdown'
    end

    # empty dropdown without icon
    test 'empty no icon' do
      render_inline Bulmacomp::DropdownComponent.new(icon: false)
      assert_selector '.dropdown .dropdown-trigger button.button:empty', text: nil
      assert_selector '.dropdown .dropdown-content:empty', text: nil
    end

    # with title and default icon
    test 'with title' do
      render_inline Bulmacomp::DropdownComponent.new(title: 'test')
      assert_selector '.dropdown .dropdown-trigger button.button span', text: 'test'
      assert_selector '.dropdown .dropdown-trigger button.button span.icon.is-small i.fas.fa-angle-down', text: nil
      assert_selector '.dropdown .dropdown-content:empty', text: nil
    end

    # with title and new icon an button_options
    test 'with title icon and options' do
      render_inline Bulmacomp::DropdownComponent.new(title: 'test', icon: icon,
                                                     button_options: { class: 'button is-active' })
      assert_selector '.dropdown .dropdown-trigger button.button.is-active span', text: 'test'
      assert_selector '.dropdown .dropdown-trigger button.button.is-active span.icon.is-small i.test', text: nil
      assert_selector '.dropdown .dropdown-content:empty', text: nil
    end

    # with elements conllection
    test 'with elements' do
      render_inline Bulmacomp::DropdownComponent.new(elements: elements)
      assert_selector '.dropdown .dropdown-content .dropdown-item', text: 1
      assert_selector '.dropdown .dropdown-content .dropdown-item', text: 2
      assert_selector '.dropdown .dropdown-content .dropdown-item', text: 3
    end

    # with yield content
    test 'yield content' do
      render_inline Bulmacomp::DropdownComponent.new.with_content('<p>ok</p>'.html_safe)
      assert_selector '.dropdown .dropdown-content p', text: 'ok'
    end

    # with elements and yield content
    test 'elements and yield content' do
      render_inline Bulmacomp::DropdownComponent.new(elements: elements).with_content('<p>ok</p>'.html_safe)
      assert_selector '.dropdown .dropdown-content p', text: 'ok'
      assert_selector '.dropdown .dropdown-content .dropdown-item', text: 1
      assert_selector '.dropdown .dropdown-content .dropdown-item', text: 2
      assert_selector '.dropdown .dropdown-content .dropdown-item', text: 3
    end
  end
end
