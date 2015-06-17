class HpusersController < ApplicationController
  before_action :set_hpuser, only: [:show, :edit, :update, :destroy]

  # GET /hpusers
  # GET /hpusers.json
  def index
    @hpusers = Hpuser.all
  end

  # GET /hpusers/1
  # GET /hpusers/1.json
  def show
  end

  # GET /hpusers/new
  def new
    @hpuser = Hpuser.new
  end

  # GET /hpusers/1/edit
  def edit
  end

  # POST /hpusers
  # POST /hpusers.json
  def create
    @hpuser = Hpuser.new(hpuser_params)

    respond_to do |format|
      if @hpuser.save
        format.html { redirect_to @hpuser, notice: 'Hpuser was successfully created.' }
        format.json { render :show, status: :created, location: @hpuser }
      else
        format.html { render :new }
        format.json { render json: @hpuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hpusers/1
  # PATCH/PUT /hpusers/1.json
  def update
    respond_to do |format|
      if @hpuser.update(hpuser_params)
        format.html { redirect_to @hpuser, notice: 'Hpuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @hpuser }
      else
        format.html { render :edit }
        format.json { render json: @hpuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hpusers/1
  # DELETE /hpusers/1.json
  def destroy
    @hpuser.destroy
    respond_to do |format|
      format.html { redirect_to hpusers_url, notice: 'Hpuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hpuser
      @hpuser = Hpuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hpuser_params
      params.require(:hpuser).permit(:username, :password, :email, :client_id, :client_secret)
    end
end
