module ApplicationHelper

  def cl_image_tag_or_default(item, class_name: nil)
    return cl_image_tag(item.photo.nil? ? 'http://placehold.it/60x60' : item.photo.path, height: 60, width: 60, crop: :fill, class: class_name)
  end
end
