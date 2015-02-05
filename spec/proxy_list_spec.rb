require 'spec_helper'

describe ProxyList do
  it 'has a version number' do
    expect(ProxyList::VERSION).not_to be nil
  end

  it 'does something useful' do
    ProxyList.get_lists
  end
end
