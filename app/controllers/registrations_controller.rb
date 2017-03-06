class RegistrationsController < Devise::RegistrationsController

  def create
    categories = default_categories
    build_resource(registration_params)
    if resource.save
      categories.each do |category|
        resource.categories.create(:name => category)
      end
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        respond_with resource, :location => after_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with resource
    end
  end

  private

  def registration_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def default_categories
    return ['Eat/Drink', 'Bills', 'Entertainment', 'Transportation', 'Other']
  end

end
