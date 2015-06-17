class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def download
    root_dir = '/Users/sundar/Downloads'
    save_dir = "#{root_dir}/tc-hpMWMark"
    filename = "watermark.jpg"
     lp = LivePaper.auth({id: "62me9qmy5vy1je70onkq1qe8q4oxhu7y", secret: "sRgV8ECR9ygoA67VSVQimt52sYn5deZ3"})
      #image = LivePaper::Image.upload "file:///Users/sundar/Downloads/IMG_1010.JPG"
      image = LivePaper::Image.upload "https://s3-us-west-1.amazonaws.com/linkcreationstudio.com/developer/zion_600x450.jpg"
      #image = LivePaper::Image.upload "http://www.letsstartsmall.com/ITSE2313_WebAuthoring/images/unit3/jpg_example1.jpg"
      t=LivePaper::WmTrigger.create(name: 'watermark', watermark: {strength: 10, resolution: 75, imageURL: image})
      p=LivePaper::Payoff.create(name: 'name', type: LivePaper::Payoff::TYPE[:WEB], url: "http://www.amarsundar.com")
      l=LivePaper::Link.create(payoff_id: p.id, trigger_id: t.id, name: "link")
      #t.download_watermark
      puts "SAVING:  #{filename}"
          File.open("#{save_dir}/#{filename}", "wb:UTF-8") { |f| f.write(t.download_watermark.force_encoding("UTF-8")) }
  end
  def CallAuthAPI
  end
  def CallTriggerAPI
  end
  def CallPayOffAPI
  end
  def CallLinkAPI
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :original, :final, :height, :width, :project_id)
    end
end
