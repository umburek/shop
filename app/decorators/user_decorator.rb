class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name} [#{object.email}]"
  end

  def admin_badge
    h.content_tag :span, "Admin", class: "badge badge-warning" if admin?
  end

  def user_badge
    h.content_tag :span, "User", class: "badge badge-primary" if registered?
  end

  def accepted
    if invitation_accepted?
      h.content_tag :span, "Accepted", class: "badge badge-success"
    else
      h.content_tag :span, "Not Yet", class: "badge badge-secondary"
    end
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
