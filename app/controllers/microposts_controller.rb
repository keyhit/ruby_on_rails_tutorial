class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @user = User.find(params[:user_id])
    @microposts = @user.microposts.all
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
    @user = User.find(params[:user_id])
    @microposts = @user.microposts.find(params[:id])
  end

  # GET /microposts/new
  def new
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.new
  end

  # GET /microposts/1/edit
  def edit
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.find(params[:id])
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.new(micropost_params)


    respond_to do |format|
      if @micropost.save
        format.html { redirect_to user_microposts_url, notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update


    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to user_microposts_url(params[:id]), notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.find_by_id(params[:id])
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to user_microposts_url(@user), notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
