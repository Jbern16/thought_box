require 'rails_helper'

describe "PATCH /api/v1/links/:id" do 
  it "updates the link to read" do

    user = User.create(email: "jon@jon.com", password: "password", password_confirmation: "password")
    link = user.links.create(title: "test", url: "http://example.com" )

    id = link.id

    patch api_v1_link_path(id), params: { :link => { read: :true }  }

    expect(Link.last.read).to eq true

  end
end 

