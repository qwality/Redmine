module ApplicationHelper
  def test
    "test"
  end

  def get_pages(table, page)
    table.page(page).per(Constants::ITEMS_PER_PAGE)
  end
end
