require 'spec_helper'

describe ProxyList do
  it 'has a version number' do
    expect(ProxyList::VERSION).not_to be nil
  end

  it 'get proxy list' do
    puts ProxyList.get_lists
    expect(ProxyList.get_lists.count).to be > 0
    puts ProxyList.get_lists('GB')
    expect(ProxyList.get_lists.count).to be > 0
    puts ProxyList.get_lists('JP')
    expect(ProxyList.get_lists.count).to be > 0
    puts ProxyList.get_lists('KR')
    expect(ProxyList.get_lists.count).to be > 0
#    puts ProxyList.get_lists('TW')
#    expect(ProxyList.get_lists.count).to be > 0
#    puts ProxyList.get_lists('HK')
#    expect(ProxyList.get_lists.count).to be > 0
#    puts ProxyList.get_lists('CN')
#    expect(ProxyList.get_lists.count).to be > 0
#    puts ProxyList.get_lists('CA')
#    expect(ProxyList.get_lists.count).to be > 0
#    puts ProxyList.get_lists('FR')
#    expect(ProxyList.get_lists.count).to be > 0
  end
end
