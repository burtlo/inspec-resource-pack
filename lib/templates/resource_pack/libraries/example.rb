class ExampleResource < Inspec.resource(1)
  name 'example'

  def initialize(alternate_path = nil)
    @path = alternate_path || default_path
  end

  def default_path
    if inspec.os.windows?
      'C:\example\bin\example.bat'
    else
      '/usr/bin/example'
    end
  end

  attr_reader :path

  def version
    raw_result = inspec.command("#{path} --version").stdout
    raw_result.split.first
  end
end