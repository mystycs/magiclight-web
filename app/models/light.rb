
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
end
