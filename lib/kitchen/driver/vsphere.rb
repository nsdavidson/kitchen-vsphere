require 'kitchen/driver/vsphere_version'

module Kitchen
  module Driver
    # vSphere driver for Test Kitchen
    # @author Nolan Davidson <nolan.davidon@gmail.com>
    class Vsphere

      default_config :datacenter
      default_config :template_name
      default_config :template_path, 'Templates'
      default_config :destination_folder
      default_config :vsphere_server do |driver|
        ENV['VSPHERE_SERVER']
      end
      default_config :vsphere_username do |driver|
        ENV['VSPHERE_USERNAME']
      end
      default_config :vsphere_password do |driver|
        ENV['VSPHERE_PASSWORD']
      end
      default_config :vsphere_expected_pubkey_hash do |driver|
        ENV['VSPHERE_PUBKEY_HASH']
      end

      def create(state)
        return if state[:server_id]
        server = create_server
        state[:server_id] = server
      end

      def destroy(state)

      end

      private

      def connection
        Fog::Compute.new(
          :provider                       => :vsphere,
          :vsphere_username               => config[:vsphere_username],
          :vsphere_password               => config[:vsphere_password],
          :vsphere_server                 => config[:vsphere_server],
          :vsphere_expected_pubkey_hash   => config[:vsphere_expected_pubkey_hash]
        )
      end
    end
  end
end
