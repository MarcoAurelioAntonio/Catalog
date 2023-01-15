require_relative 'spec_helper'

describe Author do
  author = Author.new('Stephen', 'King')

  it 'takes two parameters and returns an Author object' do
    expect(author).to be_an_instance_of Author
  end

  it 'returns the first name' do
    expect(author.first_name).to eq 'Stephen'
  end

  it 'returns the last name' do
    expect(author.last_name).to eq 'King'
  end

  it 'should have a method to add a book' do
    expect(author).to respond_to(:add_item)
  end
end
