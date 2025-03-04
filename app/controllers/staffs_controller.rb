class StaffsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_organization!

  # GET /staffs
  def index
    @staffs = current_user.organization.staffs
  end

  # GET /staffs/new
  def new
    @staff = current_user.organization.staffs.build
  end

  # POST /staffs
  def create
    @staff = current_user.organization.staffs.build(staff_params)
    @staff.user = User.new(
      email: params[:staff][:email],
      password: SecureRandom.hex(8),  # Generate a random password
      role: "staff"
    )

    if @staff.user.save
      @staff.save
      redirect_to staffs_path, notice: "Staff added successfully."
    else
      render :new
    end
  end

  private

  def ensure_organization!
    Rails.logger.debug "Current User: #{current_user.inspect}"
    Rails.logger.debug "Current User Organization: #{current_user.organization.inspect}"
    redirect_to root_path, alert: "You must be an organization to manage staff." if current_user.organization.nil?
  end

  def staff_params
    params.require(:staff).permit(:email, :phone_number, :roles)
  end
end