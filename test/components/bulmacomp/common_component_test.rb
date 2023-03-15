# frozen_string_literal: true

require 'test_helper'
# test common method in CommonComponent
class CommonComponentTest < ViewComponent::TestCase
  # test icon method
  test 'test_icon' do
    render_inline CommonComponent.new
    assert_selector('#icon span.icon i.fas.fa-home')
    assert_selector('#icon-has-text-info span.icon.has-text-info i.fas.fa-home')
  end

  # test icon-text method
  test 'test_text_icon' do
    render_inline CommonComponent.new
    assert_selector('#icon-text span.icon-text span.icon i.fas.fa-home')
    assert_selector('#icon-text span.icon-text span', text: 'testo')
    assert_selector('#icon-text-has-text-info span.icon-text.has-text-info span.icon i.fas.fa-home')
    assert_selector('#icon-text-has-text-info span.icon-text.has-text-info span', text: 'testo')
    assert_selector('#icon-text-has-icon-text-info span.icon-text span.icon.has-text-info i.fas.fa-home')
    assert_selector('#icon-text-has-icon-text-info span.icon-text span', text: 'testo')
  end
end
