class Shortener < ApplicationRecord
  serialize :alt_domain, Array

  validates :main_domain, :abbrev, presence: true
  validates_uniqueness_of :main_domain, :abbrev

  def self.abbreviate_url(main_domain)
    domain = get_host_without_www(main_domain)
    shortener = Shortener.where(main_domain: domain).first
    if shortener.blank?
      shortener = Shortener.new(main_domain: domain, abbrev: get_available_abbr(domain))
    end
    shortener.alt_domain = (shortener.alt_domain + [main_domain]).uniq
    return shortener
  end

  private

    # Only parses twice if url doesn't start with a scheme
    def self.get_host_without_www(url)
      uri = URI.parse(url)
      uri = URI.parse("http://#{url}") if uri.scheme.nil?
      host = uri.host.downcase
      host.start_with?('www.') ? host[4..-1] : host
    end

    def self.get_available_abbr(domain)
      abbr = domain.gsub(/[[:alpha:]]{4,}/) { |s| "%s%d%s" % [s[0], s.size-2, s[-1]] }
      while Shortener.where(abbrev: abbr).where.not(main_domain: domain).present?
        abbr += rand(10).to_s
      end
      return abbr
    end
end
