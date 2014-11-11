class SchoolsController < ApplicationController
  def index
    # @school= School.all
  end

  def import
    if params[:file].present? && params[:Students_List].present?
      status_hash =  School.import(params[:file],params[:Students_List])

       if  status_hash[:status]
      redirect_to schools_path, notice: 'Schools imported.'
     else
       redirect_to schools_path, flash: { error: status_hash[:message] }
       end
    else
      if params[:file].nil? && params[:students_list].nil?
            redirect_to schools_path, notice: 'Please choose your file1 and file2'
      else
          if params[:file].nil?
                 redirect_to schools_path, notice: 'please choose your file1'
               else
                 redirect_to schools_path, notice: 'please choose your file2'
          end
      end

    end


  end
end
