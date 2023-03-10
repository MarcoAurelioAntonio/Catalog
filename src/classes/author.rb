class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items.push(item)
    item.author = self
  end

  def self.input_author
    print '  Enter Author First Name: '
    first_name = gets.chomp.to_s
    print '  Enter Author Last Name: '
    last_name = gets.chomp.to_s
    Author.new(first_name, last_name)
  end
end
