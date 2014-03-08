require 'pp'

class LegislativeController < ApplicationController
  # before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @legislatives = Legislative.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
   id = params[:id]
   data_json = RestClient.get "http://api.pemiluapi.org/candidate/api/caleg/#{id}",
   {params: {'apiKey' => Rails.application.config.pemilu_api_id}}
   data = JSON.parse(data_json)

   caleg = data['data']['results']['caleg'].first

   if r = Legislative.find_by_name(caleg['nama'])
    legislative = r
  else
   party = Party.find_by_name(caleg['partai']['nama'])
   unless party
    id_party = caleg['partai']['id']
    data_party = RestClient.get "http://api.pemiluapi.org/candidate/api/partai/#{id_party}",
    {params: {'apiKey' => Rails.application.config.pemilu_api_id}}
    data_party = JSON.parse(data_party)
    partai = data_party['data']['results']['partai'].first

    party = Party.new({
      id: caleg['partai']['id'], 
      full_name: partai['nama_lengkap'], 
      name: caleg['partai']['nama'], 
      id_api: Rails.application.config.pemilu_api_id
      })
    party.save
  end
  district = District.find_by_name caleg['dapil']['nama']
  unless district
    id_district = caleg['dapil']['id']
    data_district = RestClient.get "http://api.pemiluapi.org/candidate/api/dapil/#{id_district}",
    {params: {'apiKey' => Rails.application.config.pemilu_api_id}}
    data_district = JSON.parse(data_district)
    dapil = data_district['data']['results']['dapil'].first

    district = District.new ({
      id: caleg['dapil']['id'], 
      full_name: dapil['nama_lengkap'] , 
      name: caleg['dapil']['nama'], 
      id_api: Rails.application.config.pemilu_api_id
      })
    district.save
  end

  legislative = Legislative.new({
    name: caleg['nama'], 
    id_api: Rails.application.config.pemilu_api_id, 
    party_id: caleg['partai']['id'] , 
    district_id: caleg['dapil']['id'], 
    dump: data_json
    })
  legislative.save
end
  
render json: {legislative: legislative, party_name: legislative.party.name, district_name: legislative.district.name}, status: :ok
end

  # GET /tweets/new
  def new
    @legislative = Legislative.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @legislative = Legislative.new(legislative_params)
    @legislative.save
    render json: {success: true}, status: :created
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
