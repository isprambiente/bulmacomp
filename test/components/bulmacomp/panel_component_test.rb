# frozen_string_literal: true

require 'test_helper'

class Bulmacomp::PanelComponentTest < ViewComponent::TestCase
  # test empty panel
  test 'empty_panel' do
    render_inline Bulmacomp::PanelComponent.new
    assert_selector 'nav.panel'
  end

  # test panel with title
  test 'panel_with_title' do
    render_inline Bulmacomp::PanelComponent.new title: 'test'
    assert_selector 'nav.panel p.panel-heading', text: 'test'
  end

  # test panel with title and block
  test 'panel_with_title_and_block' do
    render_inline Bulmacomp::PanelComponent.new(title: 'title')
      .with_content('<div class="panel-block">body</div>'.html_safe) 
    assert_selector 'nav.panel p.panel-heading', text: 'title'
    assert_selector 'nav.panel .panel-block'
  end
end
