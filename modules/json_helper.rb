require 'json'
class JsonHelper
  def self.write_to_json(list, file)
    return if list.empty?

    rbyobjs = list.map(&:create_json)
    File.write(file, JSON.pretty_generate(rbyobjs))
  end

  def self.read_from_json(file)
    return [] unless File.exist?(file)

    JSON.parse(File.read(file))
  end
end
