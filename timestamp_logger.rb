class TimestampLogger
    def initialize(io, label, logger)
        @io = io
        @label = label
        @logger = logger
    end

    def log(grid)
        time_before = Time.now
        result = @logger.log(grid)
        time_after = Time.now
        time_taken = time_after - time_before
        @io.puts "The grid took #{time_taken}s for outputting to #{@label}"
        result
    end
end