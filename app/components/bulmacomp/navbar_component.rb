# frozen_string_literal: true

module Bulmacomp
  # Make an html structure for a bulma navbar
  # @example Empty navbar:
  #   = render Bulmacomp::NavbarComponent.new()
  #
  #   <nav class="navbar" role="navigation" aria-label="main navigation">
  #     <div class="navbar-brand">
  #       <a class="navbar-item" href="/"></a>
  #
  #       <a role="button" class="navbar-burger" aria-label="menu"
  #         aria-expanded="false" data-target="navbarBasicExample" data_action="page#toggleMenu">
  #         <span aria-hidden="true"></span>
  #         <span aria-hidden="true"></span>
  #         <span aria-hidden="true"></span>
  #       </a>
  #     </div>
  #     <div class="navbar-menu"></div>
  #   </nav>
  # @example full navbar:
  #   = render Bulmacomp::NavbarComponent.new(brand: 'Title') do
  #     <div class="navbar-start"><a href="/" class="navbar-item">Home</a>
  #
  #   <nav class="navbar" role="navigation" aria-label="main navigation">
  #     <div class="navbar-brand">
  #       <a class="navbar-item" href="/">Title</a>
  #
  #       <a role="button" class="navbar-burger" aria-label="menu"
  #       aria-expanded="false" data-target="navbarBasicExample" data_action="page#toggleMenu">
  #         <span aria-hidden="true"></span>
  #         <span aria-hidden="true"></span>
  #         <span aria-hidden="true"></span>
  #       </a>
  #     </div>
  #     <div class="navbar-menu"><div class="navbar-start"><a href="/" class="navbar-item">Home</a></div>
  #   </nav>
  class NavbarComponent < ViewComponent::Base
    # @param [Hash] opts
    #   to generate content
    # @option opts [String] :brand
    #   navbar brand content
    # @option opts [String] :navbar_start
    #   optionally navbar-start content
    # @option opts [String] :navbar_end
    #   optionally navbar-end content
    # @option opts [String] :*
    #   each other key going as tag option, default is
    #   class: 'navbar', aria_label: 'main navigation', aria_role: 'navigation'
    # @yield [optional] navbar content
    def initialize(brand: nil, navbar_start: nil, navbar_end: nil, **opts)
      super
      @brand = brand
      @navbar_start = tag.div navbar_start, class: 'navbar-start' if navbar_start.present?
      @navbar_end = tag.div navbar_end, class: 'navbar-end' if navbar_end.present?
      @opts = { class: 'navbar', aria: { role: 'navigation', label: 'main navigation' } }.merge(opts)
    end

    # @return [String] html_safe navbar
    def call
      tag.nav safe_join([navbar_brand, navbar_menu]), **@opts
    end

    # @return [String] html_safe navbar-brand tag
    def navbar_brand
      return if @brand.blank?

      tag.div safe_join([link_to(@brand, root_path, data_turbo_frame: 'yield', class: 'navbar-item'), navbar_burger]),
              class: 'navbar-brand'
    end

    # @return [String] html_safe navbar-menu tag
    def navbar_menu
      tag.div(safe_join([@navbar_start, content, @navbar_end]), class: 'navbar-menu', data: { page_target: 'menu' })
    end

    # @return [String] html_safe navbar-burger link
    def navbar_burger
      aria = {expanded: 'false', label: 'menu'}
      data = {action: 'click->page#toggleMenu'}
      role = 'button'
      tag.a tag.span(aria_hidden: true) * 3, class: 'navbar-burger', aria:, data:, role:
    end
  end
end
