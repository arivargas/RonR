class ContentsController < ApplicationController
  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.where(["user_id = ?", session[:user_id]]).all
    @contents = Content.all
    #@contents.User_id = params[:user_id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])
    @content.ref_type = params[:type]

	if (@content.user_id == session[:user_id])    
    respond_to do |format|
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
    if (@content.pub_year !=  nil and @content.pub_month != nil and @content.pub_day =! nil)
    		@month = Content.asignar_mes(@content.pub_month)
    		@content.pub_date = "#{@content.pub_year}/#{@content.pub_month}/#{@content.pub_day}"
    elsif (@content.pub_year != nil and (@content.pub_month == nil  or @content.pub_day == nil))
    		@content.pub_date = @content.pub_year
    else
    		@content.pub_date = "s.f"
    end
    @month = Content.asignar_mes(@content.ref_month)
    @content.ref_date = "#{@content.ref_year}/#{@content.ref_month}/#{@content.ref_day}"

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
