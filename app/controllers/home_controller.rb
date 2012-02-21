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
  
  def edit
    @lab = Lab.find(current_lab.id, :include => :fields)
    (4 - @lab.fields.count).times {
      @lab.fields.build
    }
  end
  
  def update
    @lab = Lab.find(current_lab.id)
    @lab.update_attributes(params[:lab], :without_protection => true)
    redirect_to :root
  end
end
