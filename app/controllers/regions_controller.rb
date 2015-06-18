class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  
  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end
  def upsert_trigger(region)
    uploader = AvatarUploader.new
    filename = "watermark"
             lp = LivePaper.auth({id: "62me9qmy5vy1je70onkq1qe8q4oxhu7y", secret: "sRgV8ECR9ygoA67VSVQimt52sYn5deZ3"})
             source = Magick::Image.read(@region.original.path).first
             crop = source.crop(@region.top_left_x,@region.top_left_y,@region.width,@region.height)
             crop.write('pool_cropped.jpg')
             uploader.store!(crop)   
             image1 = LivePaper::Image.upload  "pool_cropped.jpg"
             t=LivePaper::WmTrigger.create(name: '#{@region.name}', watermark: {strength: @region.watermark_strength, resolution: @region.watermark_resolution, imageURL: image1 })
             l=LivePaper::Link.create(payoff_id: @region.payoff.payoff, trigger_id: t.id, name: "link")
        @region.trigger = t.id
        @region.link = l.id
        puts "SAVING:  #{filename}_#{@region.name}.jpg"
       File.open("#{filename}_#{@region.name}.jpg", "wb:UTF-8") { |f| f.write(t.download_watermark.force_encoding("UTF-8")) }
       puts "Creating Region Watermark image..."
  
    File.open("#{filename}_#{@region.name}.jpg") do |f|
      @region.watermark = f
    end
    @region.save
  end
  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)
    upsert_trigger(@region)
    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    #upsert_trigger @region
    respond_to do |format|
      if @region.update(region_params)
        format.html {     upsert_trigger @region
          redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy

    lp = LivePaper.auth({id: "62me9qmy5vy1je70onkq1qe8q4oxhu7y", secret: "sRgV8ECR9ygoA67VSVQimt52sYn5deZ3"})
    t = LivePaper::WmTrigger.get(@region.trigger)
    t.delete
    l =LivePaper::Link.get(@region.link)
    l.delete
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name, :top_left_x, :top_left_y, :width, :height, :original, :watermark, :watermark_strength, :watermark_resolution, :link, :image_id, :payoff_id)
    end
end
