class HomeController < ApplicationController
  def index
    @labs = Lab.all(:include => [:fields, :students])
  end

  def new_student
    lab = Lab.find(params[:student][:lab_id])
    # Remote ip
    lab.students.create(:mail => params[:student][:lab_id], :ip => params[:remote_ip])
    redirect_to :back
  end
end
