class BackgroundJobsController < ApplicationController

  def index
    @value = 0
    @jobs = BackgroundJob.all
    @newJob = BackgroundJob.new
  end

  def create
    create_job
  end

  def destroy
    @job = BackgroundJob.find(params[:id])
    @job.destroy
    flash[:notice] = @job.title + " job was destroyed..."
    redirect_to background_jobs_path
  end

  def show 
  end

  private

    def create_job
      @job = BackgroundJob.new(job_params)
      if @job.save
        flash[:success] = @job.title + " job created and started."
        @job.delay.start()
      else
        flash[:warning] = "Job creation error!"
      end

    redirect_to background_jobs_path

    end

    def job_params
      params.require(:background_job).permit(:title)
    end

end