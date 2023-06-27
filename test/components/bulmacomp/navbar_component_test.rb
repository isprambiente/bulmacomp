# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class NavbarComponentTest < ViewComponent::TestCase
    test 'empty navbar' do
      render_inline Bulmacomp::NavbarComponent.new
      assert_selector 'nav.navbar', text: nil
      assert_selector 'nav.navbar .navbar-menu', text: nil
      assert_selector 'nav.navbar .navbar-brand', count: 0
    end

    test 'navbar brand' do
      # render_inline Bulmacomp::NavbarComponent.new(brand: 'test')
      # assert_selector 'nav.navbar .navbar-brand a.navbar-item', count: 1, text: 'test'
      # todo: how to test a path without the site?
    end

    test 'navbar-content' do
      render_inline Bulmacomp::NavbarComponent.new.with_content('test')
      assert_selector 'nav.navbar .navbar-menu', text: 'test'
    end
  end
end
