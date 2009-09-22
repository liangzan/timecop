#--
# 1. Extensions to the Time, Date, and DateTime objects
# 2. Allows us to "freeze" time in our Ruby applications.
# 3. This is very useful when your app's functionality is dependent on time (e.g.
# anything that might expire).  This will allow us to alter the return value of
# Date.today, Time.now, and DateTime.now, such that our application code _never_ has to change.

class Time #:nodoc:
  class << self
    # Time we might be behaving as
    #attr_reader :mock_time

    TIME_CACHE_PATH = File.expand_path('~/.timecop-cache.time.cache')
    OFFSET_CACHE_PATH = File.expand_path('~/.timecop-cache.offset.cache')

    def mock_time_cache
      if File.exist?(TIME_CACHE_PATH)
        File.open(TIME_CACHE_PATH,'r') do |f|
          Marshal.load(f)
        end
      else
        nil
      end
    end

    def set_mock_time_cache(new_now)
      File.open(TIME_CACHE_PATH,'w') do |f|
        Marshal.dump(new_now, f)
      end
    end

    def clear_mock_time_cache
      File.delete(TIME_CACHE_PATH) if File.exist?(TIME_CACHE_PATH)
    end

    def mock_offset_cache
      if File.exist?(OFFSET_CACHE_PATH)
        File.open(OFFSET_CACHE_PATH,'r') do |f|
          Marshal.load(f)
        end
      else
        nil
      end
    end

    def set_mock_offset_cache(new_offset)
      File.open(OFFSET_CACHE_PATH,'w') do |f|
        Marshal.dump(new_offset, f)
      end
    end

    def clear_mock_offset_cache
      File.delete(OFFSET_CACHE_PATH) if File.exist?(OFFSET_CACHE_PATH)
    end

    def mock_time
      unless mock_offset_cache.nil?
        now_without_mock_time - mock_offset_cache
      else
        mock_time_cache
      end
    end

    # Set new time to pretend we are.
    def freeze_time(new_now)
      set_mock_time_cache(new_now)
      clear_mock_offset_cache
    end

    def move_time(new_now)
      mock_offset = new_now.nil? ? nil : (now_without_mock_time - new_now)
      set_mock_offset_cache(mock_offset)
      clear_mock_time_cache
    end

    # Restores Time to system clock
    def unmock!
      move_time(nil)
    end

    # Alias the original now
    alias_method :now_without_mock_time, :now

    # Define now_with_mock_time
    def now_with_mock_time
      mock_time || now_without_mock_time
    end

    # Alias now to now_with_mock_time
    alias_method :now, :now_with_mock_time
  end
end

if Object.const_defined?(:Date)
  class Date #:nodoc:
    class << self
      def mock_date
        now = Time.mock_time
        return nil if now.nil?
        Date.new(now.year, now.month, now.day)
      end

      # Alias the original today
      alias_method :today_without_mock_date, :today

      # Define today_with_mock_date
      def today_with_mock_date
        mock_date || today_without_mock_date
      end

      # Alias today to today_with_mock_date
      alias_method :today, :today_with_mock_date
    end
  end
end

if Object.const_defined?(:DateTime)
  class DateTime #:nodoc:
    class << self
      def mock_time
        t_now = Time.mock_time
        return nil if t_now.nil?
        DateTime.new(t_now.year, t_now.month, t_now.day, t_now.hour, t_now.min, t_now.sec)
      end

      # Alias the original now
      alias_method :now_without_mock_time, :now

      # Define now_with_mock_time
      def now_with_mock_time
        mock_time || now_without_mock_time
      end

      # Alias now to now_with_mock_time
      alias_method :now, :now_with_mock_time
    end
  end
end
