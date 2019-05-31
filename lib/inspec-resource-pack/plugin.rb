# encoding: UTF-8

# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide hooks that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

# Presumably this is light
require 'inspec-resource-pack/version'

# The InspecPlugins namespace is where all plugins should declare themselves.
# The 'Inspec' capitalization is used throughout the InSpec source code; yes, it's
# strange.
module InspecPlugins
  # Pick a reasonable namespace here for your plugin.  A reasonable choice
  # would be the CamelCase version of your plugin gem name.
  # inspec-resource-pack => ResourcePack
  module ResourcePack
    # This simple class handles the plugin definition, so calling it simply Plugin is OK.
    #   Inspec.plugin returns various Classes, intended to be superclasses for various
    # plugin components. Here, the one-arg form gives you the Plugin Definition superclass,
    # which mainly gives you access to the hook / plugin_type DSL.
    #   The number '2' says you are asking for version 2 of the plugin API. If there are
    # future versions, InSpec promises plugin API v2 will work for at least two more InSpec
    # major versions.
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-resource-pack'

      cli_command :generate do
        require 'inspec-resource-pack/cli_command'
        InspecPlugins::ResourcePack::GenerateCLI
      end
    end
  end
end
