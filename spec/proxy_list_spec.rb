require 'spec_helper'

describe ProxyList do
  it 'has a version number' do
    expect(ProxyList::VERSION).not_to be nil
  end

  it 'get proxy list' do
    puts ProxyList.get_lists
    expect(ProxyList.get_lists.count).to be > 0
  end
end
