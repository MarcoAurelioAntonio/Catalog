require_relative 'spec_helper'

describe Item do
  # with date, genre, author, label
  item = Item.new('2020-01-01', 'Horror', 'Stephen King', 'Bad Horror')

  it 'takes parameters and returns a Item object' do
    expect(item).to be_an_instance_of Item
  end

  it 'returns the publish date' do
    expect(item.publish_date) == '2020-01-01'
  end

  it 'returns the genre' do
    expect(item.genre).to eq 'Horror'
  end

  it 'returns the author' do
    expect(item.author).to eq 'Stephen King'
  end

  it 'returns the label' do
    expect(item.label).to eq 'Bad Horror'
  end

  it 'shuld have a method to move to archive' do
    expect(item).to respond_to(:move_to_archive)
  end

  it 'shuld have a method to move to archive' do
    expect(item).to respond_to(:can_be_archived?)
  end
end
