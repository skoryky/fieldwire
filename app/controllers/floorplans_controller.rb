class FloorplansController < ApplicationController

  def create
    puts "create #{params}"
    @project = Project.find(params[:project_id])

    if params[:floorplan][:display_name].blank?
      default_display_name = File.basename(params[:blueprint].first[:file].instance_variable_get('@original_filename'),
                                           '.*')
      params[:floorplan][:display_name] = default_display_name
    end

    @floorplan = Floorplan.new(floorplan_params.merge(:project => @project))
    if @floorplan.save
      params[:blueprint].each do |blueprint|
        Blueprint.create(:floorplan => @floorplan, :file => blueprint[:file])
      end
      redirect_to project_path(@project)
    else
      # TODO
    end
  end

  def new
    @floorplan = Floorplan.new
    @project = Project.find(params[:id])
  end

private

  def floorplan_params
    params.require(:floorplan).permit(:display_name)
  end

end
