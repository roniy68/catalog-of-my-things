require 'json'
class JsonHelper
  def self.write_to_json(list, file)
    return if list.empty?

    File.open(file, 'w') do |f|
      list.each { |obj| f.write("#{obj.create_json}\n") }
    end
  end

  def self.read_from_json(file)
    return [] unless File.exist?(file)

    hash = []
    File.foreach(file) { |line| hash << JSON.parse(line) }
    hash
  end
end
