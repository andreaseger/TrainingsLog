authorization do
  role :admin do
    has_permission_on [:schedules, :comments, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :guest do
    has_permission_on :users, :to =>[:new, :create]
    has_permission_on :users, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
    has_permission_on :schedules, :to => [:index, :show]
    has_permission_on :comments, :to => [:new, :create]
    has_permission_on :comments, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
  end
  
  role :moderator do
    includes :guest
    has_permission_on :comments, :to => [:edit, :update]
  end
  
  role :author do
    includes :guest
    has_permission_on :schedules, :to => [:new, :create]
    has_permission_on :schedules, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
  end
end
