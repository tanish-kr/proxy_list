# encoding : utf-8
#require 'open-uri'
#require 'nokogiri'
require 'capybara'
require 'capybara/poltergeist'
require "proxy_list/version"
require "proxy_list/user_agents"
require 'proxy_list/site_freeproxylists'
require 'proxy_list/site_cybersyndrome'
require 'proxy_list/site_spys'

Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,{:js_errors => false,:timeout => 1000})
end
module ProxyList

  ##
  # get proxy lists
  # @params [String] country_code ISO two byte code
  def self.get_lists(country_code='US')
    session = Capybara::Session.new(:poltergeist)
    session.driver.headers = {'User-Agent' => USER_AGENTS.sample}
    session.visit("http://www.freeproxylists.net/ja/?c=KR&pt=&pr=&a[]=0&a[]=1&a[]=2&u=0")
    session.save_screenshot "proxy_site.png"
    puts session.html
    session.visit("http://www.yahoo.co.jp")
    session.save_screenshot "yahoo.png"
    puts session.html
    #puts session.find(:xpath,"/html/body/div[1]/div[2]/table//tr[2]/td[1]/a").text
  end
end
