class PreferencesController < ApplicationController
  def update
  	@preference = Preference.find(1)
  	uploaded_io = params[:preference][:header]
  	if uploaded_io.present?
		File.open(Rails.root.join('public','uploads', uploaded_io.original_filename), 'wb') do |file|
		  file.write(uploaded_io.read)
		end
	end
  	@preference.company = params[:preference][:company]
  	@preference.website = params[:preference][:website]
  	@preference.theme = params[:preference][:theme]
  	@preference.header = uploaded_io.original_filename if uploaded_io.present?
  	if @preference.save
      Activity.new({'user_id' => current_user.id, 'activity' => "Edited application settings" }).save
  		redirect_to :back, notice: 'Preferences updated'
  	else
  		redirect_to :back, notice: 'Preferences failed to update'
  	end
  end
end
