class TweetsController < ApplicationController

  get '/tweets' do
      if logged_in?
        @tweets = Tweet.all
        erb :'tweets/index'
      else
        redirect "/login"
      end
  end

  get '/tweets/new' do 
    if logged_in?
      erb :'tweets/new'
    else
      redirect "/login"
    end
  end

  post '/tweets' do
    tweet = Tweet.new(params)
    tweet.user = current_user
    if tweet.save
      redirect "/tweets"
    else
      redirect "/tweets/new"
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :'tweets/show'
    else
      redirect "/login"
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :'tweets/edit'
    else
      redirect "/login"
    end
  end

  delete '/tweets/:id' do
    tweet = Tweet.find(params[:id])
    if tweet.user == current_user
      tweet.destroy
      redirect "/tweets"
    else
      redirect "/tweets"
    end
  end

  patch '/tweets/:id' do
    tweet = Tweet.find(params[:id])
    if !params[:content].empty?
      tweet.content = params[:content]
      tweet.save
      redirect "/tweets/#{tweet.id}"
    else
      redirect "/tweets/#{tweet.id}/edit"
    end
  end


end
