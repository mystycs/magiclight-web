require 'socket'

class Light < ActiveRecord::Base
  #  validate :ipaddress?

  validates_presence_of :ip_address
  validates_uniqueness_of :ip_address

  # def ipaddress?
  #   IPAddress.valid? "#{:ipaddress}"
  # end

  validates :ip_address, format: {
    with: Regexp.union(Resolv::IPv4::Regex)
  }

  def turnon(ip)
    host = ip
    port = 5577
    s = TCPSocket.new(host, port)
    s.write [0x71, 0x23, 0x0f, 0xa3].pack('C*')
    s.close
  end

  def turnoff(ip)
    host = ip
    port = 5577
    s = TCPSocket.new(host, port)
    s.write [0x71, 0x24, 0x0f, 0xa4].pack('C*')
    s.close
  end

end
