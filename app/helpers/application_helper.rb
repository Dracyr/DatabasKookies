module ApplicationHelper

  def i(glyphicon_name)
    content_tag :i, '', class: "glyphicon glyphicon-#{glyphicon_name}"
  end
end
