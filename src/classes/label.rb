require_relative './item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def self.input_label
    print '  Enter label title:'
    title = gets.chomp.to_s
    print '  Enter label color:'
    color = gets.chomp.to_s
    Label.new(title, color)
  end
end
