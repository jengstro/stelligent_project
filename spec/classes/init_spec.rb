require 'spec_helper'

describe package('nginx') do
	it { should be_installed }
end

describe service('nginx') do
	it { should be_running }
end

describe file('/usr/share/nginx/html/index.html') do
	it { is_expected.to contain_file('/usr/share/nginx/html/index.html').with_content(/<!DOCTYPE html>
          <html><body>
          Automation For The People./) }
end
