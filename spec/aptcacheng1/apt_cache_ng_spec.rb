require 'spec_helper'

describe package('apt-cacher-ng'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('apt-cacher-ng'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(9999) do
  it { should be_listening }
end
