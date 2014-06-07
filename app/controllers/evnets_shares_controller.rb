class EvnetsSharesController < ApplicationController
  # GET /evnets_shares
  # GET /evnets_shares.json
  def index
    evnets_shares = EvnetsShare.all
    event_share_hash = Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
    evnets_shares.each{|ev|
      event_share_hash[ev.event_id][:name]=ev.event.name
      event_share_hash[ev.event_id][:total]=ev.event.total
      event_share_hash[ev.event_id][:user][ev.friend_id][:name] =ev.friend.name
      event_share_hash[ev.event_id][:user][ev.friend_id][:share] = ev.share

    }
    @evnets_shares_h =event_share_hash
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evnets_shares }
    end
  end

  # GET /evnets_shares/1
  # GET /evnets_shares/1.json
  def show
    @evnets_share = EvnetsShare.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evnets_share }
    end
  end

  # GET /evnets_shares/new
  # GET /evnets_shares/new.json
  def new
    @evnets_share = EvnetsShare.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evnets_share }
    end
  end

  # GET /evnets_shares/1/edit
  def edit
    @evnets_share = EvnetsShare.find(params[:id])
  end

  # POST /evnets_shares
  # POST /evnets_shares.json
  def create
    @evnets_share = EvnetsShare.new(params[:evnets_share])

    respond_to do |format|
      if @evnets_share.save
        format.html { redirect_to @evnets_share, notice: 'Evnets share was successfully created.' }
        format.json { render json: @evnets_share, status: :created, location: @evnets_share }
      else
        format.html { render action: "new" }
        format.json { render json: @evnets_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evnets_shares/1
  # PUT /evnets_shares/1.json
  def update
    @evnets_share = EvnetsShare.find(params[:id])

    respond_to do |format|
      if @evnets_share.update_attributes(params[:evnets_share])
        format.html { redirect_to @evnets_share, notice: 'Evnets share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evnets_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evnets_shares/1
  # DELETE /evnets_shares/1.json
  def destroy
    @evnets_share = EvnetsShare.find(params[:id])
    @evnets_share.destroy

    respond_to do |format|
      format.html { redirect_to evnets_shares_url }
      format.json { head :no_content }
    end
  end
end
