require './src/classes/book/book'

describe Book do
  let(:book) { Book.new('publisher', 'cover_state', 'publish_date', 'genre', 'author', 'label') }

  it 'should have publisher' do
    expect(book.publisher).to eq('publisher')
  end

  it 'should have cover_state' do
    expect(book.cover_state).to eq('cover_state')
  end

  it 'should have publish_date' do
    expect(book.publish_date).to eq('publish_date')
  end

  it 'should have genre' do
    expect(book.genre).to eq('genre')
  end

  it 'should have author' do
    expect(book.author).to eq('author')
  end

  it 'should have label' do
    expect(book.label).to eq('label')
  end

  it 'should have can_be_archived?' do
    expect(book.can_be_archived?).to eq(false)
  end

  it 'should have add_book' do
    expect(book.add_book).to eq(nil)
  end

  it 'should have validate_label' do
    expect(book.validate_label).to eq(nil)
  end
end
