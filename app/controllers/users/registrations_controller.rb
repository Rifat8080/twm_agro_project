class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    @user = User.new
    @user.build_individual # Prepare nested form for individuals
    @user.build_organization # Prepare nested form for organizations
    super
  end

  def create
    super do |resource|
      if resource.persisted?
        if resource.individual?
          resource.create_individual(individual_params)
        elsif resource.organization?
          resource.create_organization(organization_params)
        end
      end
    end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, individual_attributes: [:full_name], organization_attributes: [:organization_name]])
  end

  def individual_params
    params.require(:user).require(:individual).permit(:full_name) if params[:user][:role] == "individual"
  end

  def organization_params
    params.require(:user).require(:organization).permit(:organization_name) if params[:user][:role] == "organization"
  end
end