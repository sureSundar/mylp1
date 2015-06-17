class TestmigsController < ApplicationController
  before_action :set_testmig, only: [:show, :edit, :update, :destroy]

  # GET /testmigs
  # GET /testmigs.json
  def index
    @testmigs = Testmig.all
  end

  # GET /testmigs/1
  # GET /testmigs/1.json
  def show
  end

  # GET /testmigs/new
  def new
    @testmig = Testmig.new
  end

  # GET /testmigs/1/edit
  def edit
  end

  # POST /testmigs
  # POST /testmigs.json
  def create
    @testmig = Testmig.new(testmig_params)

    respond_to do |format|
      if @testmig.save
        format.html { redirect_to @testmig, notice: 'Testmig was successfully created.' }
        format.json { render :show, status: :created, location: @testmig }
      else
        format.html { render :new }
        format.json { render json: @testmig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testmigs/1
  # PATCH/PUT /testmigs/1.json
  def update
    respond_to do |format|
      if @testmig.update(testmig_params)
        format.html { redirect_to @testmig, notice: 'Testmig was successfully updated.' }
        format.json { render :show, status: :ok, location: @testmig }
      else
        format.html { render :edit }
        format.json { render json: @testmig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testmigs/1
  # DELETE /testmigs/1.json
  def destroy
    @testmig.destroy
    respond_to do |format|
      format.html { redirect_to testmigs_url, notice: 'Testmig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testmig
      @testmig = Testmig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testmig_params
      params.require(:testmig).permit(:name, :email)
    end
end
