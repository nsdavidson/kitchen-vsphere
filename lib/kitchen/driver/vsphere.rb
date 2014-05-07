require 'kitchen/driver/vsphere_version'
require 'fog'
require 'kitchen'


module Kitchen
  module Driver
    # vSphere driver for Test Kitchen
    # @author Nolan Davidson <nolan.davidon@gmail.com>
    class Vsphere < Kitchen::Driver::SSHBase

      default_config :datacenter
      default_config :template_name
      default_config :template_path, 'Templates'
      default_config :destination_folder
      default_config :vm_name
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
        state[:server_id] = config["name"]

        info("vSphere instance #{state[:server_id]} created.")
        #server.wait_for { print '.'; ready? }
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

      def create_server
        connection.vm_clone(
          'datacenter' => config[:datacenter],
          'template_path' => "#{config[:template_path]}/#{config[:template_name]}",
          'name' => config[:vm_name],
          'dest_folder' => config[:destination_folder]
        )
      end
    end
  end
end
