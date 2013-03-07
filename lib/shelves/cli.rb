require 'choice'
require 'erb'
require 'sass'

Choice.options do
  banner <<-BANNER
Shelves - The only responsive, fluid CSS grid with infinitely nestable columns.

Example Usage:
    shelves --width 1140px --columns 16 > grid.css
BANNER

  separator 'Base Options:'

  option 'width' do
    short '-w'
    long '--width WIDTH'
    desc 'The max width.'
    desc '(default: 1040px)'
  end

  option 'columns' do
    short '-c'
    long '--columns COLUMNS'
    desc 'The number of columns.'
    desc '(default: 12)'
    cast Integer
  end

  option 'margin' do
    short '-m'
    long '--margin MARGIN'
    desc 'The outer margin.'
    desc '(default: 20px)'
  end

  option 'gutter' do
    short '-g'
    long '--gutter GUTTER'
    desc 'The column gutter.'
    desc 'Will be converted to a percentage value.'
    desc '(default: 20px)'
  end

  option 'skip-nested' do
    short '-N'
    long '--skip-nested'
    desc 'Do not include nested columns.'
  end

  option 'skip-tablet' do
    short '-T'
    long '--skip-tablet'
    desc 'Do not include tablet columns.'
  end

  option 'skip-mobile' do
    short '-M'
    long '--skip-mobile'
    desc 'Do not include mobile columns.'
  end

  option 'version' do
    short '-v'
    long '--version'
    desc 'Show version.'
    action do
      puts Shelves::VERSION
      exit
    end
  end

  option 'help' do
    short '-h'
    long '--help'
    desc 'Show this message.'
  end

  separator ''
  separator 'Tablet Options:'

  option 'tablet-breakpoint' do
    long '--tablet-breakpoint BREAKPOINT'
    desc 'The breakpoint for tablets.'
    desc '(default: 800px)'
  end

  option 'tablet-columns' do
    long '--tablet-columns COLUMNS'
    desc 'The number of columns for tablets.'
    desc '(default: 6)'
    cast Integer
  end

  option 'tablet-margin' do
    long '--tablet-margin MARGIN'
    desc 'The outer margin for tablets.'
    desc '(default: 75% of margin)'
  end

  option 'tablet-gutter' do
    long '--tablet-gutter GUTTER'
    desc 'The column gutter for tablets.'
    desc '(default: 150% of gutter)'
  end

  separator ''
  separator 'Mobile Options:'

  option 'mobile-breakpoint' do
    long '--mobile-breakpoint BREAKPOINT'
    desc 'The breakpoint for mobile.'
    desc '(default: 480px)'
  end

  option 'mobile-columns' do
    long '--mobile-columns COLUMNS'
    desc 'The number of columns for mobile.'
    desc '(default: 4)'
    cast Integer
  end

  option 'mobile-margin' do
    long '--mobile-margin MARGIN'
    desc 'The outer margin for mobile.'
    desc '(default: 50% of margin)'
  end

  option 'mobile-gutter' do
    long '--mobile-gutter GUTTER'
    desc 'The column gutter for mobile.'
    desc '(default: 238% of gutter)'
  end

  separator ''
  separator 'Advanced Options:'

  option 'breakout' do
    long '--breakout'
    desc 'Include breakout columns.'
  end

  option 'centered' do
    long '--centered'
    desc 'Include centered column helpers.'
  end

  option 'skip-visibility' do
    long '--skip-visibility'
    desc 'Do not include visibility helpers.'
  end

  option 'skip-ie7-support' do
    long '--skip-ie7-support'
    desc 'Skip legacy support for IE7.'
  end

  option 'skip-prefixes' do
    long '--skip-prefixes'
    desc 'Do not include prefix classes.'
  end

  option 'skip-suffixes' do
    long '--skip-suffix'
    desc 'Do not include suffix classes.'
  end

  option 'skip-pushes' do
    long '--skip-push'
    desc 'Do not include push classes.'
  end

  option 'skip-pulls' do
    long '--skip-pull'
    desc 'Do not include pull classes.'
  end

  option 'nested-prefixes' do
    long '--nested-prefixes'
    desc 'Include prefix classes for nested columns.'
  end

  option 'nested-suffixes' do
    long '--nested-suffixes'
    desc 'Include suffix classes for nested columns.'
  end

  option 'nested-pushes' do
    long '--nested-pushes'
    desc 'Include push classes for nested columns.'
  end

  option 'nested-pulls' do
    long '--nested-pulls'
    desc 'Include pull classes for nested columns.'
  end

  option 'tablet-prefixes' do
    long '--tablet-prefixes'
    desc 'Include prefix classes for tablet columns.'
  end

  option 'tablet-suffixes' do
    long '--tablet-suffixes'
    desc 'Include suffix classes for tablet columns.'
  end

  option 'tablet-pushes' do
    long '--tablet-pushes'
    desc 'Include push classes for tablet columns.'
  end

  option 'tablet-pulls' do
    long '--tablet-pulls'
    desc 'Include pull classes for tablet columns.'
  end

  option 'mobile-prefixes' do
    long '--mobile-prefixes'
    desc 'Include prefix classes for mobile columns.'
  end

  option 'mobile-suffixes' do
    long '--mobile-suffixes'
    desc 'Include suffix classes for mobile columns.'
  end

  option 'mobile-pushes' do
    long '--mobile-pushes'
    desc 'Include push classes for mobile columns.'
  end

  option 'mobile-pulls' do
    long '--mobile-pulls'
    desc 'Include pull classes for mobile columns.'
  end
end

module Shelves
  module CLI extend self
    def run
      settings = normalize_settings(Choice.choices)
      sass_template = render_sass_template(settings)
      sass_engine = Sass::Engine.new(sass_template,
        :syntax => :scss,
        :load_paths => [Shelves.stylesheets_path],
        :style => :compact,
        :line_comments => false
      )

      puts sass_engine.render
    end

    private

      def render_sass_template(settings)
        template = ERB.new <<-TEMPLATE
<% settings.each do |setting, value| %>
$shelves-<%= setting %>: <%= value %>;
<% end %>
@import "shelves-grid";
TEMPLATE
        template.result(binding)
      end

      def normalize_settings(settings)
        normalized_settings = {}
        settings.each do |setting, value|
          if setting =~ /^skip-(\w*)$/
            setting = $1
            value = false
          end
          normalized_settings[setting] = value
        end

        normalized_settings
      end
  end
end
