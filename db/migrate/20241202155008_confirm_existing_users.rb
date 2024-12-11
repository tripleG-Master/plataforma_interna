class ConfirmExistingUsers < ActiveRecord::Migration[7.2]
  def up
    User.update_all(confirmed_at: Time.current)
  end

  def down
    # Si deseas revertir esta migración, puedes establecer confirmed_at a nil
    User.update_all(confirmed_at: nil)
  end
end
