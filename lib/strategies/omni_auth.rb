module OmniAuth
  module Strategies
    class Developer
      include OmniAuth::Strategy

      # app = lambda{ |env| [200, {}, ["Hello, World."]]}
      # OmniAuth::Strategies::Developer.new(app).options.uid_field
      # OmniAuth::Strategies::Developer.new(app, :uid_field => :name).options.uid_field

      option :fields, [:name, :email]
      option :uid_field, :email

      args [:authenication_url]

      def request_phase
        response = Rack::Response.new
        response.redirect "#{options.authenication_url}?redir=#{full_host + script_name + callback_path}"
        response.finish
      end

      def callback_phase
        request = Rack::Request.new env
        cookies = request.cookies
        response = Rack::Response.new

        if cookies['developer'] != nil
          response.redirect some_application_url
          response.finish
        else
          response.status = 401
          response.finish
        end
      end
      
    end
  end
end
