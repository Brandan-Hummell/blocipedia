class ChargesController < ApplicationController
    @@amount = 1500
    
    
    def new
        @stripe_btn_data = {
          key: "#{ Rails.configuration.stripe[:publishable_key] }",
          description: "Premium Blocipedia Membership - #{current_user.email}",
          amount: @@amount
        }
      end

    def create
        # Creates a Stripe Customer object, for associating
        # with the charge
        customer = Stripe::Customer.create(
          email: current_user.email,
          card: params[:stripeToken]
        )
      
        charge = Stripe::Charge.create(
          customer: customer.id, # Note -- this is NOT the user_id in your app
          amount: @@amount,
          description: "Premium Blocipedia Membership - #{current_user.email}",
          currency: 'usd'
        )
      
        flash[:notice] = "Your account is now updgraded #{current_user.email}! You can now make private Wikis."
        User.update(current_user.id, role: 'premium')
        redirect_to edit_user_registration_path(current_user) # or wherever
      
        # Stripe will send back CardErrors, with friendly messages
        # when something goes wrong.
        # This `rescue block` catches and displays those errors.
        rescue Stripe::CardError => e
          flash[:alert] = e.message
          redirect_to new_charge_path
    end

    def downgrade
        User.update(current_user.id, role: 'standard')
        redirect_to edit_user_registration_path(current_user)
    end
end
