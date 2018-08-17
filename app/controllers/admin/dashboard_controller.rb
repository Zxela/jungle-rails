class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_ACC'], password: ENV['ADMIN_PASS']

  def show
  end
end
