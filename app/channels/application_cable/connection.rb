module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include SessionsHelper
    
    identified_by :message_user
    
    def connect
      self.message_user = find_verified_user
      #console.log("connected") this fucks up the application for some reason
    end
    
    private
    
      def find_verified_user
        if logged_in?
          current_user
        else
          reject_unauthorized_connection
        end
      end
  end
end

#only prevents during room not 