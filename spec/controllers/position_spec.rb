require "rails_helper"

RSpec.describe Admin::PositionsController, type: :controller do
  let(:position) {FactoryBot.create :position}

  describe "GET #index" do
    before {get :index}

    it "renders the :index template" do
      is_expected.to render_template :index
    end
  end

  describe "GET #new" do
    before {get :new}

    it "build a new position object success" do
      expect(assigns :position).to be_a_new Position
    end

    it "renders the :new template" do
      is_expected.to render_template :new
    end
  end

  describe "POST #create" do
    context "valid attributes" do
      it "create a new position" do
        expect{
          post :create, params: {position: FactoryBot.attributes_for(:position)}
        }.to change(Position, :count).by(1)
      end

      it "shows success create message" do
        post :create, params: {position: FactoryBot.attributes_for(:position)}
        expect(flash[:success]).to eq(I18n.t "admin.positions.create.created")
      end

      it "redirect to index" do
        post :create, params: {position: FactoryBot.attributes_for(:position)}
        is_expected.to redirect_to(admin_positions_path)
      end
    end

    context "invalid attributes" do
      it "do not create new object" do
        expect{
          post :create, params: {position: FactoryBot.attributes_for(:invalid_position)}
        }.to_not change(Position,:count)
      end

      it "renders the :new template" do
        post :create, params: {position: FactoryBot.attributes_for(:invalid_position)}
        is_expected.to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "load object" do
      before {get :edit, params: {id: position}}

      it "build a new position object success" do
        expect(assigns :position).to eq position
      end

      it "renders the edit template" do
        is_expected.to render_template :edit
      end
    end
  end

  describe "PATCH #update" do
    context "valid attributes" do
      before {patch :update, params: {id: position, position: FactoryBot.attributes_for(:position, name: "Pos 1")}}

      it "locates the requersted @position" do
        expect(assigns(:position)).to eq position
      end

      it "update success" do
        position.reload
        expect(position.name).to eq ("Pos 1")
      end

      it "show success message" do
        expect(flash[:success]).to eq(I18n.t "admin.positions.update.updated")
      end

      it { is_expected.to redirect_to(admin_positions_path) }
    end

    context "invalid attributes" do
      it "invalid position name" do
        patch :update, params: {id: position, position: FactoryBot.attributes_for(:invalid_position)}
        expect(position.name).to_not eq nil
      end

      it "render the edit template" do
        patch :update, params: {id: position, position: FactoryBot.attributes_for(:invalid_position)}
        is_expected.to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    context "delete book" do
      before { delete :destroy, params: {id: position} }
      it do
        expect(Position.all).not_to include position
      end

      it "shows success delete message" do
        expect(flash[:success]).to eq(I18n.t "admin.positions.destroy.deleted")
      end

      it do
        is_expected.to redirect_to(admin_positions_path)
      end
    end
  end
end
