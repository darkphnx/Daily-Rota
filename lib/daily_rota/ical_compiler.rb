# frozen_string_literal: true

require 'icalendar'

module DailyRota
  # Turns an array of support days into an ical feed
  class IcalCompiler
    def initialize(support_days:)
      @support_days = support_days
    end

    def compile
      calendar = Icalendar::Calendar.new

      support_days.each do |support_day|
        event = build_event(support_day)
        calendar.add_event(event)
      end

      calendar.to_ical
    end

    private

    attr_reader :support_days

    def build_event(support_day)
      event = Icalendar::Event.new
      event.dtstart = Icalendar::Values::Date.new(support_day.date)
      event.dtend = Icalendar::Values::Date.new(support_day.date + 1)
      event.summary = "#{support_day.engineer} daily support"
      event
    end
  end
end
