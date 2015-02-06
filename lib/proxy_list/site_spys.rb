# encoding : utf-8
module ProxyList
  class SiteSpys
    @@url = "http://spys.ru/free-proxy-list/COUNTRY_CODE/"

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
      session.all(:xpath,"//table[2]//tr[4]/td/table//tr[position()>3]").each do |node|
        if !node.text.nil? && node.has_xpath?('td[2]/font')
          if node.find(:xpath,'td[2]/font').text.include?('HTTP')
            http = 'http'
          else
            http = 'https'
          end
          proxy_lists.push("#{http}://#{node.find(:xpath,'td[1]/font[2]').text}")
        end
      end
      Capybara.reset_sessions!
      proxy_lists
    end
  end
end
