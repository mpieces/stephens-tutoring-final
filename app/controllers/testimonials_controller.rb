class TestimonialsController < ApplicationController

  include SessionsHelper
  # before_action :set_testimonial, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy
  # before_action :signed_in_user, only: [:index, :new, :create]

  def index
    @testimonials = Testimonial.all
    @user = current_user
  end

  def show
    @testimonial = Testimonial.find(params[:id])
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to testimonials_url, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @testimonial }
      else
        format.html { render :new }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @testimonial.update(testimonial_params)
        format.html { redirect_to @testimonial, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @testimonial }
      else
        format.html { render :edit }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Testimonial.find(params[:id]).destroy
    flash[:success] = "Review deleted"
    redirect_to testimonials_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    def testimonial_params
      params.require(:testimonial).permit(:feedback, :name)
    end

end
