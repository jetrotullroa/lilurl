module API
  module V1
    class Links < Grape::API
      include API::V1::Defaults

      resources :links do

        desc "Return all links"
        params do
          optional :visit_count, type: String, desc: "Number of times url were visited"
          optional :user_id, type: String, desc: "User who created the shortened link"
        end
        get "", root: :links do
          if params[:visit_count].present?
            Link.all.where(visit_count: permitted_params[:visit_count])
          elsif params[:user_id].present?
            Link.all.where(user_id: permitted_params[:user_id])
          else
            Link.all
          end
        end

        desc "Return a single link"
        params do
          requires :id, type: String, desc: "ID of the link"
          optional :visitor, type: String, desc: "User that visited the link will render user details"
        end
        get ":id", root: "link" do
          if params[:visitor].present?
            if Link.find(permitted_params[:id]).visitor.include? permitted_params[:visitor].to_i
              user = User.find(permitted_params[:visitor])
              link = Link.find(permitted_params[:id])
              visited_count = link.visitor.count(permitted_params[:visitor].to_i)
              render user_id: user.id,
                     username: user.username,
                     name: "#{user.first_name} #{user.last_name}",
                     company: user.company,
                     visited_short_link: link.short_link,
                     visited_original_link: link.original_link,
                     visited_count: visited_count
            else
              render message: "This user did not visit the link"
            end
          else
            Link.find(permitted_params[:id])
          end
        end
      end
    end
  end
end
