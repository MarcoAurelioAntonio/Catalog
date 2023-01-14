require 'json'

module LabelPersistor
  SOURCE = './data/DB/labels.json'.freeze

  def self.read_from_file
    return [] unless File.exist?(SOURCE)

    deserialized_labels = JSON.parse(File.read(SOURCE))
    deserialized_labels.map { |label| json_to_label(label) }
  end

  def self.write_to_file(labels)
    serialized_labels = labels.map { |label| label_to_json(label) }
    File.write(SOURCE, JSON.pretty_generate(serialized_labels))
  end

  def self.label_to_json(label)
    {
      'id' => label.id,
      'title' => label.title,
      'color' => label.color
    }
  end

  def self.json_to_label(json)
    Label.new(json['title'], json['color'])
  end
end
