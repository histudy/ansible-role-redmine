require 'spec_helper'

describe user(property['redmine_user']) do
  it { should exist }
end

property['redmine_dependency_packages'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file(property['redmine_home']) do
  it { should exist }
  it { should be_directory }
end

property['redmine_themes'].each do |theme|
  dir_name = theme['directory'] || theme['name']
  describe file(property['redmine_home'] + '/public/themes/' + dir_name) do
    it { should exist }
    it { should be_directory }
  end
end

property['redmine_plugins'].each do |plugin|
  dir_name = plugin['directory'] || 'redmine_' + theme['name']
  describe file(property['redmine_home'] + '/plugins/' + dir_name) do
    it { should exist }
    it { should be_directory }
  end
end

describe service('redmine') do
  it { should be_enabled }
  it { should be_running }
end
