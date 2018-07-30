module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def get_order_number curent_page, index
    curent_page ||= 1
    (curent_page.to_i - 1) * 5 + 1 + index
  end
end
