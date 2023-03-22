# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class PaginationComponentTest < ViewComponent::TestCase
    # elements array for test
    def elements
      ['<a class="pagination-link" aria-label="Goto page 1">1</a>'.html_safe]
    end

    # pre array for test
    def pre
      ['<a href="#" class="pagination-previous">Previous</a>'.html_safe]
    end

    # yield text fot test
    def yield_text
      '<li><a href="#">test</a></li>'.html_safe
    end

    # empty pagination
    test 'empty' do
      render_inline Bulmacomp::PaginationComponent.new
      assert_selector 'nav.pagination[role="navigation"] ul', text: nil
    end

    # pagination with element
    test 'with elements' do
      render_inline Bulmacomp::PaginationComponent.new(elements: elements)
      assert_selector 'nav.pagination[role="navigation"] ul li a', text: '1'
    end

    # pagination with elements and pre
    test 'with elements and pre' do
      render_inline Bulmacomp::PaginationComponent.new(elements: elements, pre: pre)
      assert_selector 'nav.pagination[role="navigation"] ul li a', text: '1'
      assert_selector 'nav.pagination a.pagination-previous', text: 'Previous'
    end

    # pagination with yield
    test 'with yield' do
      render_inline Bulmacomp::PaginationComponent.new.with_content(yield_text)
      assert_selector 'nav.pagination[role="navigation"] ul li a', text: 'test'
    end

    # full pagination
    test 'full' do
      render_inline Bulmacomp::PaginationComponent.new(elements: elements, pre: pre, id: 'ok').with_content(yield_text)
      assert_selector 'nav.pagination[role="navigation"] ul li a', text: '1'
      assert_selector 'nav.pagination[role="navigation"] ul li a', text: 'test'
      assert_selector 'nav.pagination a.pagination-previous', text: 'Previous'
    end
  end
end
