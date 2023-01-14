class Author
  def initialize(first_name, last_name)
    @id = Random.rand(10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items.push(item)
    item.author = self
  end

  def self.save_author(author)
    File.open('author.json', 'a+') do |file|
      author1 = { author: author }
      file.write(JSON.generate(author1))
    end
  end
end
