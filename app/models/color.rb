class Color < ActiveRecord::Base
  belongs_to :light

  def self.changecolor(light_ip, color)
    host = light_ip
    # raise color
    port = 5577
    s = TCPSocket.new(host, port)
    colorstring = '31' + color.to_s + '00F00F'
    colorcode = [colorstring].pack 'H*'
    byteArray = colorcode.bytes

    sumOfValues = 0
    byteArray.each do |x|
      sumOfValues += x
    end

    checksum = sumOfValues % (2**(byteArray.length + 1))
    checksum = checksum.to_s(16)
    colorstring += checksum
    colorcode = [colorstring].pack 'H*'

    s.write [colorstring].pack 'H*'
    s.close
  end
end
