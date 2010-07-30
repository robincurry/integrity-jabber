require 'rubygems'
require 'integrity'
require 'xmpp4r-simple'

module Integrity
  class Notifier
    class Jabber < Notifier::Base
      attr_reader :recipients

      def self.to_haml
        File.read File.dirname(__FILE__) / "config.haml"
      end

      def initialize(build, config = {})
        host = config["host"].blank? ? nil  : config.delete("host")
        port = config["port"].blank? ? 5222 : config.delete("port")
        @server = ::Jabber::Simple.new(config.delete("user"), config.delete("pass"), nil, "Available", host, port)
        sleep 4
        @recipients = config["recipients"].nil? ? [] : config.delete("recipients").split(/\s+/)
        super
      end

      def deliver!
        @recipients.each do |r|
          @server.deliver(r, message)
        end
      end

      def message
        @message ||= <<-content
#{commit.project.name}: #{short_message}  (#{commit.committed_at} by #{commit.author.name})
Message: #{commit.message}
Link: #{commit_url}
content
      end
    end
  end
end
