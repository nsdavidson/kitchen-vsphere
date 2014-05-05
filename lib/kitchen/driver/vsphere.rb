require 'kitchen/driver/vsphere_version'

module Kitchen
  module Driver
    # vSphere driver for Test Kitchen
    # @author Nolan Davidson <nolan.davidon@gmail.com>
    class Vsphere

      default_config :datacenter
      default_config :template_name
      default_config :template_path, 'Templates'
      default_config :vsphere_server
      default_config :vsphere_username
      default_config :vsphere_password
      default_config :vsphere_expected_pubkey_hash

      def create(state)

      end

      def destroy(state)

      end
    end
  end
end
