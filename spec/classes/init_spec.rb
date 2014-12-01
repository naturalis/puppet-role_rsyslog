require 'spec_helper'
describe 'role_rsyslog' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_rsyslog') }
  end
end
