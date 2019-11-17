class WelcomesController < Frack::BaseController
  def index
    render('welcomes/index')
  end
end
