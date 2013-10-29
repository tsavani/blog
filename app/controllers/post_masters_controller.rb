class PostMastersController < ApplicationController
  before_action :set_post_master, only: [:show, :edit, :update, :destroy]

  # GET /post_masters
  # GET /post_masters.json
  def index
      @blog_master =  BlogMaster.find(session[:blog_id])
      @post_masters = PostMaster.where(blog_master_id: session[:blog_id])
      #@post_masters = PostMaster.all
     # @blog = BlogMaster.where('id=?', params[:blog_master])
  end

  # GET /post_masters/1
  # GET /post_masters/1.json
  def show
    #@bolg_master = BlogMaster.where(blog_master_id: session[:blog_id])
  end

  # GET /post_masters/new
  def new
    @blog_master ||=  BlogMaster.find(session[:blog_id])
    @post_master = PostMaster.new
  end

  # GET /post_masters/1/edit
  def edit
  end

  # POST /post_masters
  # POST /post_masters.json
  def create

    @post_master = PostMaster.new(post_master_params)

    respond_to do |format|
      if @post_master.save
        format.html { redirect_to @post_master, notice: 'Post master was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_master }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_masters/1
  # PATCH/PUT /post_masters/1.json
  def update
    respond_to do |format|
      if @post_master.update(post_master_params)
        format.html { redirect_to @post_master, notice: 'Post master was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_masters/1
  # DELETE /post_masters/1.json
  def destroy
    @post_master.destroy
    respond_to do |format|
      format.html { redirect_to post_masters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_master
      @post_master = PostMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_master_params
      params.require(:post_master).permit(:post_name, :discription, :blog_master_id)
    end
end
