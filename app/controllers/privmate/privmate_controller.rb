module Privmate
  class PrivmateController < ApplicationController

    def info
      respond_to do |format|
	format.html
	format.js
      end
    end

  end
end
