require 'spec_helper'

describe DashboardController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it 'shows dashboard' do
      visit '/dashboard/index'
      page.should have_content("Dashboard")
      find('h1').should have_content("Dashboard")
    end

  end

end
