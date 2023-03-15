# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class BreadcrumbComponentTest < ViewComponent::TestCase
    # test empty breadcrumb
    test 'empty breadcrumb' do
      render_inline Bulmacomp::BreadcrumbComponent.new
      assert_selector 'nav.breadcrumb ul:empty'
    end

    # test breadcrumb with element list
    test 'test breadcrumb with elements' do
      render_inline Bulmacomp::BreadcrumbComponent.new('uno', 'due')
      assert_selector 'nav.breadcrumb ul li', text: 'uno'
      assert_selector 'nav.breadcrumb ul li', text: 'due'
    end

    # test breadcrumb with content
    test 'test breadcrumb with content' do
      render_inline Bulmacomp::BreadcrumbComponent.new.with_content('<li>uno</li><li>due</li>'.html_safe)
      assert_selector 'nav.breadcrumb ul li', text: 'uno'
      assert_selector 'nav.breadcrumb ul li', text: 'due'
    end

    # test breadcrumb full optioned
    test 'test breadcrumb full optioned' do
      render_inline Bulmacomp::BreadcrumbComponent.new('uno', id: 'ok').with_content('<li>due</li>'.html_safe)
      assert_selector 'nav#ok.breadcrumb ul li', text: 'uno'
      assert_selector 'nav#ok.breadcrumb ul li', text: 'due'
    end
  end
end
