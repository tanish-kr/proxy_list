# encoding : utf-8
module ProxyList
  class SiteFreeproxylists
    @url = "http://www.freeproxylists.net/ja/?c=COUNTRY_CODE&pt=&pr=&a[]=0&a[]=1&a[]=2&u=0"
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
      #TODO javascript
      html = open(url,{'User-Agent' => USER_AGENTS.sample}).read
      doc = Nokogiri.HTML(html)
      proxy_lists = []
      doc.xpath("/html/body/div[1]/div[2]/table//tr[not(@class='Caption')]").each do |node|
        if !node.text.nil?
          proxy_lists.push("#{node.xpath('td[3]').text.downcase}://#{node.xpath('td[1]').text}:#{node.xpath('td[2]').text}")
        end
      end
      proxy_lists
    end

  end
end
