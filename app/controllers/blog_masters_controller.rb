class BlogMastersController < ApplicationController
  before_action :set_blog_master, only: [:show, :edit, :update, :destroy, :newpost]

  # GET /blog_masters
  # GET /blog_masters.json
  def index
    session[:blog_id] = nil
    @blog_masters = BlogMaster.where(user_id: current_user)

  end

  # GET /blog_masters/1
  # GET /blog_masters/1.json
  def show
    session[:blog_id] = @blog_master.id 
    redirect_to post_masters_path
  end

 

  # GET /blog_masters/new
  def new
    @blog_master = BlogMaster.new
  end

  # GET /blog_masters/1/edit
  def edit
  end

  # POST /blog_masters
  # POST /blog_masters.json
  def create
    @blog_master = BlogMaster.new(blog_master_params)

    respond_to do |format|
      if @blog_master.save
        format.html { redirect_to blog_masters_path, notice: 'Blog master was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog_master }
      else
        format.html { render action: 'new' }
        format.json { render json: @blog_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_masters/1
  # PATCH/PUT /blog_masters/1.json
  def update
    respond_to do |format|
      if @blog_master.update(blog_master_params)
        format.html { redirect_to blog_masters_path, notice: 'Blog master was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog_master.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /blog_masters/1
  # DELETE /blog_masters/1.json
  def destroy
    @blog_master.destroy
    respond_to do |format|
      format.html { redirect_to blog_masters_url }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_master
      @blog_master = BlogMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_master_params
      params.require(:blog_master).permit(:blog_name, :discription, :user_id)
    end
end
