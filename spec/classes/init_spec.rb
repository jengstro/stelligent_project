require 'spec_helper'

describe 'nginx' do
  let(:title) { 'nginx' }

  it { is_expected.to contain_package('nginx').with(ensure: 'present') }

  it { is_expected.to contain_file('/usr/share/nginx/html/index.html')
    .with(
      :ensure  => 'file',
      :require => 'Package[nginx]',
    )
  }

  it { is_expected.to contain_file('/usr/share/nginx/html/index.html')
	  .with_content(/<!DOCTYPE html>\n    <html><body>\n    Automation For The People.\n/
		       )
  }

  it { is_expected.to contain_service('nginx')
    .with(
      :ensure => 'running',
      :enable => true,
    )
  }
end
