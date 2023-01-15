require_relative 'spec_helper'

describe MusicAlbum do
  # use on_spotify, date, genre, author, label
  music_album = MusicAlbum.new(true, '2020-01-01', 'Horror', 'Stephen King', 'Bad Horror')

  it 'takes parameters and returns a MusicAlbum object' do
    expect(music_album).to be_an_instance_of MusicAlbum
  end

  it 'returns the on spotify' do
    expect(music_album.on_spotify).to eq true
  end

  it 'returns the publish date' do
    expect(music_album.publish_date) == '2020-01-01'
  end

  it 'returns the genre' do
    expect(music_album.genre) == 'Horror'
  end

  it 'returns the author' do
    expect(music_album.author) == 'Stephen King'
  end

  it 'returns the label' do
    expect(music_album.label) == 'Bad Horror'
  end

  it 'shuld have a method to check if it can be archived' do
    expect(music_album).to respond_to(:can_be_archived?)
  end
end
