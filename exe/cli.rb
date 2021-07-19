# frozen_string_literal: true

require_relative '../lib/daily_rota'

calendar = DailyRota.generate_ical(start_date: Date.new(2021, 4, 1),
                                   end_date: Date.new(2021, 4, 30),
                                   engineers: %w[Dan Bence Paul])

$stdout.puts calendar
