require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  login_user
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all locations as @locations" do
      location = Location.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:locations)).to eq([location])
    end
  end

  describe "GET #show" do
    it "assigns the requested location as @location" do
      location = Location.create! valid_attributes
      get :show, {:id => location.to_param}, valid_session
      expect(assigns(:location)).to eq(location)
    end
  end

  describe "GET #new" do
    it "assigns a new location as @location" do
      get :new, {}, valid_session
      expect(assigns(:location)).to be_a_new(Location)
    end
  end

  describe "GET #edit" do
    it "assigns the requested location as @location" do
      location = Location.create! valid_attributes
      get :edit, {:id => location.to_param}, valid_session
      expect(assigns(:location)).to eq(location)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Location" do
        expect {
          post :create, {:location => valid_attributes}, valid_session
        }.to change(Location, :count).by(1)
      end

      it "assigns a newly created location as @location" do
        post :create, {:location => valid_attributes}, valid_session
        expect(assigns(:location)).to be_a(Location)
        expect(assigns(:location)).to be_persisted
      end

      it "redirects to the created location" do
        post :create, {:location => valid_attributes}, valid_session
        expect(response).to redirect_to(Location.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved location as @location" do
        post :create, {:location => invalid_attributes}, valid_session
        expect(assigns(:location)).to be_a_new(Location)
      end

      it "re-renders the 'new' template" do
        post :create, {:location => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => new_attributes}, valid_session
        location.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested location as @location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
        expect(assigns(:location)).to eq(location)
      end

      it "redirects to the location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
        expect(response).to redirect_to(location)
      end
    end

    context "with invalid params" do
      it "assigns the location as @location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => invalid_attributes}, valid_session
        expect(assigns(:location)).to eq(location)
      end

      it "re-renders the 'edit' template" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested location" do
      location = Location.create! valid_attributes
      expect {
        delete :destroy, {:id => location.to_param}, valid_session
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the locations list" do
      location = Location.create! valid_attributes
      delete :destroy, {:id => location.to_param}, valid_session
      expect(response).to redirect_to(locations_url)
    end
  end
end
