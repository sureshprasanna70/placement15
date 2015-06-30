class Company < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar
end
