module ApplicationHelper
  def determine_end_time(start, length)
    start + length*60
  end

  def duration_print(minutes)
    "#{minutes/60} hour(s) #{minutes%60} minutes"
  end
end
