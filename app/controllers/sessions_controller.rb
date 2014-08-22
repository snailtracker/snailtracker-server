class SessionsController < ApplicationController
  include Authenticated
  def show
    @session = Session.find(params[:id])
  end
end
