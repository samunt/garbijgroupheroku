class SessionsController < ApplicationController

def new
  @session = Session.new
end

def create
  @session = Session.new(params[])
end

def destroy
  @session = Session.find()
  @session.destroy 
end
