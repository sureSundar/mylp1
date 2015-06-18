class PayoffsController < ApplicationController
  before_action :set_payoff, only: [:show, :edit, :update, :destroy]

  # GET /payoffs
  # GET /payoffs.json
  def index
    @payoffs = Payoff.all
  end

  # GET /payoffs/1
  # GET /payoffs/1.json
  def show
  end

  # GET /payoffs/new
  def new
    @payoff = Payoff.new
  end

  # GET /payoffs/1/edit
  def edit
  end
  def upsert_payoff(payoff)
    lp = LivePaper.auth({id: "62me9qmy5vy1je70onkq1qe8q4oxhu7y", secret: "sRgV8ECR9ygoA67VSVQimt52sYn5deZ3"})    
    p=LivePaper::Payoff.create(name: 'name', type: LivePaper::Payoff::TYPE[:WEB], url: @payoff.url)  
    @payoff.payoff = p.id
    @payoff.save
  end
  # POST /payoffs
  # POST /payoffs.json
  def create
    @payoff = Payoff.new(payoff_params)
    upsert_payoff(@payoff)
    respond_to do |format|
      if @payoff.save
        format.html { redirect_to @payoff, notice: 'Payoff was successfully created.' }
        format.json { render :show, status: :created, location: @payoff }
      else
        format.html { render :new }
        format.json { render json: @payoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payoffs/1
  # PATCH/PUT /payoffs/1.json
  def update
    respond_to do |format|
      if @payoff.update(payoff_params)
        format.html { 
          upsert_payoff(@payoff)
          redirect_to @payoff, notice: 'Payoff was successfully updated.' }
        format.json { render :show, status: :ok, location: @payoff }
      else
        format.html { render :edit }
        format.json { render json: @payoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payoffs/1
  # DELETE /payoffs/1.json
  def destroy
  
    lp = LivePaper.auth({id: "62me9qmy5vy1je70onkq1qe8q4oxhu7y", secret: "sRgV8ECR9ygoA67VSVQimt52sYn5deZ3"})    
    p=LivePaper::Payoff.get(@payoff.payoff)  
    p.delete
    @payoff.destroy  
    respond_to do |format|
      format.html { redirect_to payoffs_url, notice: 'Payoff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payoff
      @payoff = Payoff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payoff_params
      params.require(:payoff).permit(:name, :url, :payoff, :project_id)
    end
end
