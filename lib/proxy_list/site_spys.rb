# encoding : utf-8
module ProxyList
  class SiteSpys
    @url = "http://spys.ru/free-proxy-list/COUNTRY_CODE/"

    ##
    # initialize
    # @params [String] country_code
    def initialize(country_code)
      @url.gsub!(/COUNTRY_CODE/,country_code)
    end


    ##
    # get proxy lists
    # @return [Array] proxy_lists
    def proxy_lists
      # TODO for javascript site
      html = open(url,{'User-Agent' => USER_AGENTS.sample}).read
      doc = Nokogiri.HTML(html)
      proxy_lists = []
      doc.xpath("/html/body/table[2]//tr[4]/td/table//tr[position() > 3]").each do |node|
        if node.xpath('td[2]/font').text.include?('HTTP')
          http = 'http'
        else
          http = 'https'
        end
        proxy_lists.push("#{http}://#{node.xpath('td[1]/font[2]').text}")
      end
      proxy_lists
    end
  end
end
