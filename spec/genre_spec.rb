require_relative 'spec_helper'

describe Genre do
  genre = Genre.new('Horror')

  it 'takes one parameter and returns a Genre object' do
    expect(genre).to be_an_instance_of Genre
  end

  it 'returns the genre' do
    expect(genre.genre).to eq 'Horror'
  end

  it 'returns method to add item' do
    expect(genre).to respond_to(:add_item)
  end
end
