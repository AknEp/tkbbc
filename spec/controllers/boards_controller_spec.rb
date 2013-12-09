require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BoardsController do

  # This should return the minimal set of attributes required to create a valid
  # Board. As you add validations to Board, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {
      #title: 'hoge'
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BoardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all boards as @boards" do
      board = Board.create! valid_attributes
      get :index, {}, valid_session
      assigns(:boards).should eq([board])
    end
  end

  describe "GET show" do
    it "assigns the requested board as @board" do
      board = Board.create! valid_attributes
      get :show, {:id => board.to_param}, valid_session
      assigns(:board).should eq(board)
    end
  end

  describe "GET new" do
    it "assigns a new board as @board" do
      get :new, {}, valid_session
      assigns(:board).should be_a_new(Board)
    end
  end

  describe "GET edit" do
    it "assigns the requested board as @board" do
      board = Board.create! valid_attributes
      get :edit, {:id => board.to_param}, valid_session
      assigns(:board).should eq(board)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, {:board => valid_attributes}, valid_session
        }.to change(Board, :count).by(1)
      end

      it "assigns a newly created board as @board" do
        post :create, {:board => valid_attributes}, valid_session
        assigns(:board).should be_a(Board)
        assigns(:board).should be_persisted
      end

      it "redirects to the created board" do
        post :create, {:board => valid_attributes}, valid_session
        response.should redirect_to(Board.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved board as @board" do
        # Trigger the behavior that occurs when invalid params are submitted
        Board.any_instance.stub(:save).and_return(false)
        post :create, {:board => {  }}, valid_session
        assigns(:board).should be_a_new(Board)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Board.any_instance.stub(:save).and_return(false)
        post :create, {:board => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested board" do
        board = Board.create! valid_attributes
        # Assuming there are no other boards in the database, this
        # specifies that the Board created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Board.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => board.to_param, :board => { "these" => "params" }}, valid_session
      end

      it "assigns the requested board as @board" do
        board = Board.create! valid_attributes
        put :update, {:id => board.to_param, :board => valid_attributes}, valid_session
        assigns(:board).should eq(board)
      end

      it "redirects to the board" do
        board = Board.create! valid_attributes
        put :update, {:id => board.to_param, :board => valid_attributes}, valid_session
        response.should redirect_to(board)
      end
    end

    describe "with invalid params" do
      it "assigns the board as @board" do
        board = Board.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Board.any_instance.stub(:save).and_return(false)
        put :update, {:id => board.to_param, :board => {  }}, valid_session
        assigns(:board).should eq(board)
      end

      it "re-renders the 'edit' template" do
        board = Board.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Board.any_instance.stub(:save).and_return(false)
        put :update, {:id => board.to_param, :board => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested board" do
      board = Board.create! valid_attributes
      expect {
        delete :destroy, {:id => board.to_param}, valid_session
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      board = Board.create! valid_attributes
      delete :destroy, {:id => board.to_param}, valid_session
      response.should redirect_to(boards_url)
    end
  end

end
