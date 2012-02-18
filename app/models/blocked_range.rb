class BlockedRange < ActiveRecord::Base
  after_initialize :convert_attr_from_string_to_int

  attr_accessor :start_ip_s, :end_ip_s

  def convert_attr_from_string_to_int
    start_ip_to_i(start_ip_s) if start_ip_s
    end_ip_to_i(end_ip_s) if end_ip_s
  end

  def self.ip_to_i(string)
    quads = string.split('.').map{|x| x.to_i}
    (quads[0] << 24) + (quads[1] << 16) + (quads[2] << 8) + quads[3]
  end

  def start_ip_to_i(string)
    self.start_ip = BlockedRange.ip_to_i(string)
  end

  def end_ip_to_i(string)
    self.end_ip = BlockedRange.ip_to_i(string)
  end

  def self.ip_to_s(integer)
    quads = [(integer)>>24, (integer&((1<<24) - 1))>>16, (integer&((1<<16) - 1))>>8, integer&255]
    quads.join('.')
  end

  def start_ip_to_s
    BlockedRange.ip_to_s(start_ip)
  end

  def end_ip_to_s
    BlockedRange.ip_to_s(end_ip)
  end

  def self.get_ip_to_i(string)
    BlockedRange.ip_to_i(string)
  end
end
