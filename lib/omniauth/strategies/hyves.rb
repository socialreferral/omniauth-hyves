require 'omniauth-oauth'
require 'multi_xml'

module OmniAuth
  module Strategies
    class Hyves < OmniAuth::Strategies::OAuth
      option :client_options, {
        :site => "https://data.hyves-api.nl",
        :request_token_path => '/?ha_method=auth.requesttoken&ha_version=2.0&ha_format=xml&ha_fancylayout=false&strict_oauth_spec_response=true',
        :authorize_url => 'http://www.hyves.nl/api/authorize/',
        :access_token_path => '/?ha_method=auth.accesstoken&ha_version=2.0&ha_format=xml&ha_fancylayout=false&strict_oauth_spec_response=true',
        :scheme => :query_string
      }

      option :request_params, {:methods => 'users.get,friends.get,media.get', :expirationtype => 'infinite'}

      uid do
        access_token.params["userid"]
      end

      info do
        {
          name: "#{user_info["firstname"]} #{user_info["lastname"]}",
          first_name: user_info["firstname"],
          last_name: user_info["lastname"],
          image: user_image
        }
      end

      private

      def user_info
        @user_info ||= MultiXml.parse(access_token.get("/?ha_version=2.0&ha_method=users.get&userid=#{uid}").body)["users_get_result"]["user"]
      end

      def user_image
        media_info = MultiXml.parse(access_token.get("/?ha_version=2.0&ha_method=media.get&mediaid=#{user_info["mediaid"]}").body)
        url = media_info["media_get_result"]["media"]["image"]["src"]
        url =~ /^http.*/ ? url : nil
      end
    end
  end
end
