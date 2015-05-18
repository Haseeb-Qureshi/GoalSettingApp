module CommentHelper
  def add_comment(form, comment, button)
    fill_in form, with: comment
    click_button button
  end
end
