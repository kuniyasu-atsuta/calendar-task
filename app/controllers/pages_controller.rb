# frozen_string_literal: true

class PagesController < ApplicationController
  def landing; end

  def calendar
    @user = current_user
  end

  def piano; end

  def help
    @user = current_user
  end
end
