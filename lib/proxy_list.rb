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
  Capybara::Poltergeist::Driver.new(app,{:js_errors => false,:timeout => 1000,
    :debug => false,:inspector => false,
    :phantomjs_logger => File.open(File.expand_path('../../log/phantomjs.log',__FILE__),'a')
    })
end
module ProxyList

  ##
  # get proxy lists
  # @params [String] country_code ISO two byte code
  def self.get_lists(country_code='US')
     proxy_lists = ProxyList::SiteFreeproxylists.new(country_code).proxy_lists
     proxy_lists.concat(ProxyList::SiteSpys.new(country_code).proxy_lists)
     proxy_lists.concat(ProxyList::SiteCybersyndrome.new(country_code).proxy_lists)
     proxy_lists.uniq
  end
end
