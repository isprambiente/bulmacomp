# frozen_string_literal: true

require 'test_helper'

module Bulmacomp
  class ModalComponentTest < ViewComponent::TestCase
    # test empty modal
    test 'empty modal' do
      render_inline Bulmacomp::ModalComponent.new
      assert_selector '.modal', text: nil
      assert_selector '.modal .modal-background', text: nil
      assert_selector '.modal .modal-content', text: nil
      assert_selector '.modal button.modal-close', text: nil
    end

    # test modal with content
    test 'modal with content' do
      render_inline Bulmacomp::ModalComponent.new.with_content('test')
      assert_selector '.modal .modal-content', text: 'test'
    end
  end
end
