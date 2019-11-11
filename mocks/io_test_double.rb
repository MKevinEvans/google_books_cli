class IoTestDouble

    def initialize(inputs)
        @inputs = inputs
    end
    
    def receive_input
        @inputs.shift
    end

    def produce_output(*inputs)
        print inputs.join("")
    end
end