module ApplicationHelper
  def demo_partial name
    render 'home/demo_partial', {name: name}
  end
end
