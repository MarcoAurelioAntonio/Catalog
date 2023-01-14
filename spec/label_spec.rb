require_relative 'spec_helper'

describe Label do
  label = Label.new('Bad Horror', 'red')

  it 'takes two parameters and returns a Label object' do
    expect(label).to be_an_instance_of Label
  end

  it 'returns the title' do
    expect(label.title).to eq 'Bad Horror'
  end

  it 'returns the color' do
    expect(label.color).to eq 'red'
  end

  it 'should have a method to add an item' do
    expect(label).to respond_to(:add_item)
  end
end
