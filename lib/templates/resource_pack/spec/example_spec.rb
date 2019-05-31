require 'spec_helper'
require 'libraries/example'

describe_inspec_resource 'example' do
  context 'on windows' do
    # This helper method here is the equivalent to the first line within the environment
    #   that defines an os that returns a true when the names align.
    # let(:platform) { 'windows' }

    environment do
      os.returns(windows?: true, linux?: false)
      command('C:\example\bin\example.bat --version').returns(stdout: '0.1.0 (windows-build)')
    end

    its(:version) { should eq('0.1.0') }
  end

  context 'on linux' do
    let(:platform) { 'linux' }

    environment do
      command('/usr/bin/example --version').returns(stdout: '0.1.0 (GNULinux-build)')
    end

    its(:version) { should eq('0.1.0') }
  end
end