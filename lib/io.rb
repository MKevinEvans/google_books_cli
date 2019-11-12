class Io
    def receive_input
        gets.strip
    end

    def produce_output(*inputs)
        print inputs.join("")
    end
end
