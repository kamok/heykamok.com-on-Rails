module ApplicationHelper
  
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ka Mok").join(" - ")
      end
    end
  end

  def pretty_updated_at(resource)
    resource.updated_at.strftime("%m/%d/%Y")
  end

end