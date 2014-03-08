require 'pp'

class DashboardController < ApplicationController
  # before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    cons_key = 'BZtL83qpbEn7GCgwCJEjA';
    cons_sec = 'oxfwyGib0KWh9DPzcHatHJNpmwQCpKxvQOU3vGdqbhs';
    acc_key = '358833888-CBLxSysJYymrRFJLDYTprFNhSq76w2M7PfjgM4zp';
    acc_sec = '8TUDB8v4DDDHHaO3ufpWHTvT4mBMYrBxZzgbC4SR10ek9';

    Resque.enqueue(TweeterJob, )

    

  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(legislative_params)
    @tweet.save
    render json: {success: true}, status: :created
  end

  def get_trending
    render json: {count: 10}, status: :ok
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legislative_params
      params.permit(:district_no, :id_api)
    end
  end
