require 'socket'

class Light < ActiveRecord::Base
  has_one :light

  validates_presence_of :ip_address
  validates_uniqueness_of :ip_address

  validates :ip_address, format: {
    with: Regexp.union(Resolv::IPv4::Regex)
  }

  def turnon(ip)
    host = ip
    port = 5577
    s = TCPSocket.new(host, port)
    s.write ["71230fa3"].pack('H*')
    s.close
  end

  def turnoff(ip)
    host = ip
    port = 5577
    s = TCPSocket.new(host, port)
    s.write ["71240fa4"].pack('H*')
    s.close
  end
end
