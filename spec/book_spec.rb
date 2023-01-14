require_relative 'spec_helper'

describe Book do
	
	# use publisher, cover_state, date, genre, author, label
  book = Book.new('Stephen King', 'good', '2020-01-01', 'Horror', 'Stephen King', 'Horror')

  it 'takes two parameters and returns a Book object' do
    expect(book).to be_an_instance_of Book
  end

	it 'returns the publisher' do
		expect(book.publisher).to eq 'Stephen King'
	end

	it 'returns the cover state' do
		expect(book.cover_state).to eq 'good'
	end

	it 'returns the publish date' do
		expect(book.publish_date) == '2020-01-01'
	end

	it 'returns the genre' do
		expect(book.genre) == 'Horror'
	end
end
