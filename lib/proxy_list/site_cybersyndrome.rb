# encoding : utf-8
module ProxyList
  class SiteCybersyndrome
    @url = "http://www.cybersyndrome.net/search.cgi?q=COUNTRY_CODE"
    ##
    # initialize
    # @params [String] country_code
    def initialize(contry_code)
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
      doc.xpath("id('div_result')/table//tr/td[2]").each do |node|
        proxy_lists.push(node.text)
      end
      proxy_lists
    end
  end
end
