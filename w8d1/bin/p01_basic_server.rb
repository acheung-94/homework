require "rack"
require_relative 'w8d1/lib/controller_base.rb'
app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new

    controller = ControllerBase.new(req, res)
    controller.render_content('text/html', 'whooowee')
end


Rack::Server.start(
    app: app,
    Port: 3000
)