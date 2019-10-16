class Image
  attr_accessor :data

  def initialize(data)
    @data = data
    @coordinates = []
  end

  def blur 
    find_indexes
    @coordinates.each do |coordinate|
      data[coordinate[1]][coordinate[0]] = 1
    end
    data
  end

  def find_indexes
    data.each_with_index do |row, y|
      row.each_with_index do |value, x|
        if value == 1
          @coordinates.push([x - 1, y])
          @coordinates.push([x + 1, y])
          @coordinates.push([x, y + 1])
          @coordinates.push([x, y - 1])
        end
      end
    end
  end
end