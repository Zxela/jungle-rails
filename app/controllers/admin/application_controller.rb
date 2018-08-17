class Admin::ApplicationController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_ACC'], password: ENV['ADMIN_PASS']

end
