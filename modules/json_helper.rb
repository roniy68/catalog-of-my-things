require 'json'
class JsonHelper
  def self.write_to_json(list, file)
    return if list.empty?
    rbyobjs = list.map { |obj| obj.create_json }
    File.open(file, 'w') { |f| f.write(JSON.pretty_generate(rbyobjs)) }
  end

  def self.read_from_json(file)
    return [] unless File.exist?(file)
    hash = JSON.parse(File.read(file))
    hash
  end
end
