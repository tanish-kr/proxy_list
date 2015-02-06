# encoding : utf-8
module ProxyList
  class SiteFreeproxylists
    @@url = "http://www.freeproxylists.net/ja/?c=COUNTRY_CODE&pt=&pr=&a[]=0&a[]=1&a[]=2&u=0"
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
      session.all(:xpath,"/html/body/div[1]/div[2]/table//tr[not(@class='Caption')]").each do |node|
        if !node.text.nil? && node.has_xpath?('td[3]')
          proxy_lists.push("#{node.find(:xpath,'td[3]').text.downcase}://#{node.find(:xpath,'td[1]').text}:#{node.find(:xpath,'td[2]').text}")
        end
      end
      Capybara.reset_sessions!
      session.driver.quit
      proxy_lists
    end

  end
end
