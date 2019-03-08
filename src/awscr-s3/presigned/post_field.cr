module Awscr
  module S3
    module Presigned
      # A field in a `Presigned::Post`
      class PostField
        include Comparable(PostField)

        getter operator

        # The key of the field
        getter key

        # The value of the field
        getter value

        def initialize(@operator : String, @key : String, @value : String)
        end

        def initialize(@key : String, @value : String)
          @operator = "eq"
        end

        # Serialize the key into the format required for a `Presigned::Post`
        def serialize
          case @operator
          when "eq"
            {@key => @value}
          else
            [@operator, @key, @value]
          end
        end

        def <=>(field : PostField)
          if @key == field.key && @value == field.value
            0
          else
            -1
          end
        end
      end
    end
  end
end
