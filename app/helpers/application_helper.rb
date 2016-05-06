module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ka Mok").join(" - ")
      end
    end
  end
end
