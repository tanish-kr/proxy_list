# encoding : utf-8
module ProxyList
  class SiteCybersyndrome
    @@url = "http://www.cybersyndrome.net/search.cgi?q=COUNTRY_CODE"
    ##
    # initialize
    # @params [String] country_code
    def initialize(country_code)
      @@url.gsub!(/COUNTRY_CODE/,country_code)
    end

    ##
    # get proxy lists
    # @return [Array] proxy_lists
    def proxy_lists
      session = Capybara::Session.new(:poltergeist)
      session.driver.headers = {'User-Agent' => USER_AGENTS.sample}
      session.visit(@@url)
      proxy_lists = []
      session.all(:xpath,"id('div_result')/table//tr/td[2]").each do |node|
        if !node.text.nil?
          proxy_lists.push("http://#{node.text}")
        end
      end
      proxy_lists
    end
  end
end
