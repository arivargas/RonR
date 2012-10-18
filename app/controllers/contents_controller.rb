class ContentsController < ApplicationController
  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.where(["user_id = ?", session[:user_id]]).all
    #@contents.User_id = params[:user_id]

    respond_to do |format|
    # generar pdf
    format.pdf do
        render :pdf => "La casita de las torrejas - References",
               :template => 'contents/index.html.erb'
               end
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])
    #@ref_type = @content.ref_type

	if (@content.user_id == session[:user_id])    
    respond_to do |format|
    #generar pdf
        format.pdf do
           render :pdf => "La casita de las torrejas - References",
                  :template => 'contents/show.html.erb'
                   end
      format.html # show.html.erb
      format.json { render json: @content }
   	 end
	else
		redirect_to root_url  	
  	end
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @content = Content.new
    @content.ref_type = params[:type]
    @user_id = session[:user_id]
	 @ref_type = params[:type]
    respond_to do |format|
    	format.html # new.html.erb
      format.json { render json: @content }

    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
    
    if (@content.user_id == session[:user_id]) 
    	@user_id = session[:user_id]
    else    
		redirect_to root_url  	
    end
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(params[:content])
	
    @month = Content.asignar_mes(@content.pub_month)
    if (@content.pub_year !=  nil and @content.pub_month != nil and @content.pub_day == 1)
    		@content.pub_date = "#{@month} #{@content.pub_day} #{@content.pub_year}"
    elsif (@content.pub_year != nil and (@content.pub_month != nil  or @content.pub_day == nil))
    		@content.pub_date = "#{@month} #{@content.pub_year}"
    elsif (@content.pub_year != nil and (@content.pub_month == nil  or @content.pub_day == nil))
    		@content.pub_date = "#{@content.pub_year}"    
    else
    		@content.pub_date = "s.f"
    end
    @month2 = Content.asignar_mes(@content.ref_month)
    @content.ref_date = "#{@month2} #{@content.ref_day} #{@content.ref_year}"

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render json: @content, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  end
end
