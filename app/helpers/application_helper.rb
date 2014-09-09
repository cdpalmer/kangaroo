module ApplicationHelper
  def determine_end_time(start, length)
    start + length*60
  end
end
