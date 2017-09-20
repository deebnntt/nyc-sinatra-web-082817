require_relative '../../config/environment'
require 'pry'
class FiguresController < ApplicationController

  set :views, "app/views/figures"

  get '/figures/new' do
    erb :new
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    erb :figure
  end

  get '/figures' do
    @figures = Figure.all
    erb :figure
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :show
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :edit
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


end
