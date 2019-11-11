class Io
    def receive_input
        gets
    end

    def produce_output(*inputs)
        print inputs.join("")
    end
end
