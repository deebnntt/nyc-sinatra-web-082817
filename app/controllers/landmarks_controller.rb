require_relative '../../config/environment'

class LandmarksController < ApplicationController

  set :views, "app/views/landmarks"


  get '/' do
    erb :index
  end

  get '/landmarks/new' do

    erb :new
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    erb :show
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])    # @landmark.update(params[:figure])
    redirect to "/landmarks/#{@landmark.id}"
  end

end
