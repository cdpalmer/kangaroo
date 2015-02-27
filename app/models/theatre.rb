class Theatre < ActiveRecord::Base
  has_many :movies, through: :showtimes
  has_many :showtimes

  def marathons
    @hop_window = 15
    @showtimes = showtimes.sort { |a,b| a.start_time <=> b.start_time }
    @marathons = []
    @showtimes.each_with_index do |showtime, index|
      marathon = [showtime]

      if showtime != @showtimes.last
        next_showtime = find_next_showtime(@showtimes.from(@showtimes.index(showtime)), showtime)
        while next_showtime
          marathon << next_showtime
          @marathons << marathon.dup
          next_showtime = find_next_showtime(@showtimes.from(@showtimes.index(next_showtime)), next_showtime)
        end
      end
    end

    @marathons
  end

  def find_next_showtime(showtimes, showtime)
    current_endtime = showtime.start_time + (showtime.movie.duration * 60)
    showtimes.each do |st|
      if st.start_time.between?(current_endtime - @hop_window, current_endtime + @hop_window)
        return st
      end
    end

    return nil
  end
end
