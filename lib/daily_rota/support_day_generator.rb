# frozen_string_literal: true

module DailyRota
  SupportDay = Struct.new(:date, :engineer)

  # Yields a support day for every weekday in a given period
  class SupportDayGenerator
    include Enumerable

    def initialize(start_date:, end_date:, engineers: [])
      @start_date = start_date
      @end_date = end_date
      @engineers = engineers.cycle
    end

    def each(&block)
      (start_date..end_date).each do |date|
        next if date.saturday? || date.sunday?

        block.call(SupportDay.new(date, engineers.next))
      end
    end

    private

    attr_reader :start_date, :end_date, :engineers
  end
end
