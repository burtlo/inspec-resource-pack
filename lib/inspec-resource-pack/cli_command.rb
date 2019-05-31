# encoding: utf-8

require 'inspec/resource'
require 'plugins/inspec-init/lib/inspec-init/renderer'

module InspecPlugins
  module ResourcePack
    class GenerateCLI < Inspec.plugin(2, :cli_command)
      subcommand_desc 'generate resource_pack', 'Create an InSpec profile that is resource pack'

      # The usual rhythm for a Thor CLI file is description, options, command method.
      # Thor just has you call DSL methods in sequence prior to each command.

      # Let's make a command, 'do_something'. This will then be available
      # as `inspec my-command do-something
      # (Change this method name to be something sensible for your plugin.)

      # First, provide a usage / description. This will appear
      # in `inspec help my-command`.
      # As this is a usage message, you should write the command as it should appear
      # to the user (if you want it to have dashes, use dashes)
      desc 'resource_pack NAME', 'Create a custom resource pack'

      option :overwrite, type: :boolean, default: false,
             desc: 'Overwrites existing directory'

      def resource_pack(new_resource_pack_name)
        base_templates_path = File.absolute_path(File.join(__FILE__,'..','..','templates'))
        resource_pack_template = 'resource_pack'

        render_opts = {
          templates_path: base_templates_path,
          overwrite: options[:overwrite]
        }
        renderer = InspecPlugins::Init::Renderer.new(ui, render_opts)

        vars = { name: new_resource_pack_name }

        renderer.render_with_values(resource_pack_template, 'resource pack', vars)

        # ui.exit(:success) # or :usage_error
        ui.exit
      end
    end
  end
end