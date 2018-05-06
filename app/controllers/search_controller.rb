class SearchController < ApplicationController
  
    def index
      @searchPlace = Place.where(map: params[:map], ampm: params[:ampm], time: params[:time])
    end

end
