require 'spec_helper'

describe 'nginx', :type => :class do
  describe 'without parameters' do
          it { should compile }
  end
end
