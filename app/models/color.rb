class Color < ActiveRecord::Base
  belongs_to :light

  def self.changecolor(light_ip, color)
    host = light_ip
    port = 5577
    colorstring = '31' + color.to_s[1..-1] + '00F00F'
    byteArray = [colorstring].pack 'H*'

    sumOfValues = 0
    byteArray.bytes.each do |x|
      sumOfValues += x
    end

    colorstring += (sumOfValues % (2**(byteArray.length + 1))).to_s(16)

    s = TCPSocket.new(host, port)
    s.write [colorstring].pack 'H*'
    s.close
  end
end
