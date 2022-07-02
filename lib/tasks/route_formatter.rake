# frozen_string_literal: true

# Run using

# rails route_formatter:csv

# Or run task and copy to clipboard, and you can paste to csv file

# rails route_formatter:csv | pbcopy

namespace :route_formatter do
  desc 'get route as csv format'

  task csv: :environment do |_t|
    class CSVFormatter
      def initialize
        @buffer = []
      end

      def result
        @buffer.join("\n")
      end

      def section_title(title); end

      def section(routes)
        routes.each do |r|
          @buffer << [r[:name], r[:verb], r[:path], r[:reqs]].join(',')
        end
      end

      def header(_routes)
        @buffer << %w[Prefix Verb URI_Pattern Controller#Action].join(',')
      end

      def no_routes
        @buffer << ''
      end
    end

    require 'action_dispatch/routing/inspector'

    all_routes = Rails.application.routes.routes

    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)

    puts inspector.format(CSVFormatter.new)
  end
end
