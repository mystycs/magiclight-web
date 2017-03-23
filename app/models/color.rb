require 'socket'

class Color < ActiveRecord::Base
  belongs_to :light

  validates_format_of :color, with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i
  #validates_presence_of :color

  def self.changecolor(light_ip, color)
    host = light_ip
    port = 5577
    if color == "#000000FF" #warmwhite
      colorstring = '31' + color.to_s[1..-1] + '0F0F' #warmwhite magic code
    else
      colorstring = '31' + color.to_s[1..-1] + '00F00F'
    end
    byteArray = [colorstring].pack 'H*'

    sumOfValues = 0
    byteArray.bytes.each do |x|
      sumOfValues += x
    end

    colorstring += (sumOfValues % (2**(byteArray.length + 1))).to_s(16)

    s = TCPSocket.new(host, port)
    s.write [colorstring].pack('H*')
    s.close
  end

  def self.getcolor(light_ip)
    host = light_ip
    port = 5577

    s = TCPSocket.new(host, port)

    s.write ["818a8b96"].pack('H*')
    color = s.read(14).unpack('H*').to_s[14...22] #read extra two to tell if its warm white 

    s.close

    if color == "000000ff" #so warm white shows as white, due to issue it shows as black
      color = "FFFFFF"
      return color
    else
      return color[0...6]
    end

  end
end
