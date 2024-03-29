class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /job_postings
  # GET /job_postings.json
  def index
    @job_postings = JobPosting.order(sort_column + " " + sort_direction)
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
    @job_posting = JobPosting.find(params[:id])
  end

  # GET /job_postings/new
  def new
    @job_posting = JobPosting.new
  end

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to job_postings_url, notice: 'Job posting was successfully created.' }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
        format.html { redirect_to job_postings_url, notice: 'Job posting was not created.' }
      end
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to job_postings_url, notice: 'Job posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { redirect_to job_postings_url, notice: 'Job posting could not be updated.' }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to job_postings_url, notice: 'Job posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.require(:job_posting).permit(:title, :description, :hiring_manager, :email)
    end

    def sort_column ## this sets the default for index page
      JobPosting.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
    end

    def sort_direction ## this tells page to display in descending order by default
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
