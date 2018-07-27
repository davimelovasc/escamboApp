class AdminService

  def self.update(id, params_admin)
    if params_admin[:password].blank? &&  params_admin[:password_confirmation].blank?
      params_admin.delete(:password)
      params_admin.delete(:password_confirmation)
    end
    @admin = Admin.find(id)
    @admin.update(params_admin)
  end

end
