class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    job = Job.create(job_params)
    flash[:notice] = "Job posted!"
    redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    flash[:notice] = "Job listing successfully updated!"
    redirect_to jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Job '#{@job.title}' deleted!"
    redirect_to jobs_path
  end

  def show
    @job = Job.find(params[:id])
  end

    private

    def job_params
      params.require(:job).permit(:title, :description)
    end

end
