# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

require_relative 'daily_rota/support_day_generator'
require_relative 'daily_rota/ical_compiler'

# Tools to assist in building a daily support rota
module DailyRota

  def self.generate_ical(start_date:, end_date:, engineers:)
    support_days = DailyRota::SupportDayGenerator.new(start_date: start_date, end_date: end_date, engineers: engineers)

    DailyRota::IcalCompiler.new(support_days: support_days).compile
  end

end
