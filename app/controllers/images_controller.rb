class ImagesController < ApplicationController
  before_action :set_image, only: [:download,:show, :edit, :update, :destroy]

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
    @image = Image.find(params[:id])
    #root_dir = '/Users/sundar/Downloads'
    #save_dir = "#{root_dir}/tc-hpMWMark"
    uploader = AvatarUploader.new
    filename = "watermark"
     lp = LivePaper.auth({id: "62me9qmy5vy1je70onkq1qe8q4oxhu7y", secret: "sRgV8ECR9ygoA67VSVQimt52sYn5deZ3"})
      #image = LivePaper::Image.upload "file:///Users/sundar/Downloads/IMG_1010.JPG"
    #image = LivePaper::Image.upload "https://s3-us-west-1.amazonaws.com/linkcreationstudio.com/developer/zion_600x450.jpg"
    #image = LivePaper::Image.upload @image.original 
      #image = LivePaper::Image.upload "http://www.letsstartsmall.com/ITSE2313_WebAuthoring/images/unit3/jpg_example1.jpg"
      @regions = @image.regions
      puts @regions
      #overlay = Magick::Image.read(@image.original).first
      overlay = Magick::Image.read(@image.original.path).first
      #overlay = @image.original
      @regions.each do |r|
        puts "Watermarking #{r.name}"
             #overlay_path = Rails.root.join("/assets/images/IMG_1010.png")
             source = Magick::Image.read("#{r.original}").first
             crop = source.crop(r.top_left_x,r.top_left_y,r.width,r.height)
             crop.write('pool_cropped.jpg')
             uploader.store!(crop)   
             #source = source.resize_to_fill(70, 70).quantize(256, Magick::GRAYColorspace).contrast(true)
             #source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
             #colored = Magick::Image.new(70, 70) { background_color = color }
            #colored = Magick::Image.new(70, 70)
             #colored.composite(source.negate, 0, 0, Magick::CopyOpacityCompositeOp)
             #colored.write('colored.jpg')
             
                     #image = LivePaper::Image.upload  "#{r.original}"
                     image1 = LivePaper::Image.upload  "pool_cropped.jpg"
        t=LivePaper::WmTrigger.create(name: '#{r.name}', watermark: {strength: r.watermark_strength, resolution: r.watermark_resolution, imageURL: image1 })
        puts "Payoff to : ",r.payoff.url
        p=LivePaper::Payoff.create(name: 'name', type: LivePaper::Payoff::TYPE[:WEB], url: r.payoff.url)
        l=LivePaper::Link.create(payoff_id: p.id, trigger_id: t.id, name: "link")
        r.payoff.payoff = p.id
        r.payoff.save
        r.trigger = t.id
        r.link = l.id
        r.save
      #t.download_watermark
      puts "SAVING:  #{filename}_#{r.name}.jpg"
       File.open("#{filename}_#{r.name}.jpg", "wb:UTF-8") { |f| f.write(t.download_watermark.force_encoding("UTF-8")) }
       puts "Creating final image..."
       
     crop_region = Magick::Image.read("#{filename}_#{r.name}.jpg").last
     final_wm = overlay.composite(crop_region,r.top_left_x,r.top_left_y,Magick::OverCompositeOp)
    final_wm.write("#{filename}_#{r.name}_final.jpg")
    puts final_wm 
    
    File.open("#{filename}_#{r.name}_final.jpg") do |f|
      @image.final = f
    end
    @image.save
  
    overlay = Magick::Image.read("#{filename}_#{r.name}_final.jpg").first
    @finalwm = "#{filename}_#{r.name}_final.jpg"
   end
  end
  #overlay.write("final_watermark.jpg")
  
  
  def download1
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
