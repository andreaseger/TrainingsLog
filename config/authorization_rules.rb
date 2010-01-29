authorization do
  role :admin do
    has_permission_on [:schedules, :comments, :users, :items, :shouts], :to => [:autocomplete, :index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :guest do
    has_permission_on :users, :to =>[:new, :create]
    has_permission_on :schedules, :to => [:index, :show]
  end

  role :registered_user do
    includes :guest
    has_permission_on :comments, :to => [:new, :create]
    has_permission_on :comments, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end

    has_permission_on :shouts, :to => [:new, :create]
    has_permission_on :shouts, :to => [:destroy] do
      if_attribute :user => is { user }
    end

    has_permission_on :users, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end

    has_permission_on :items, :to => [:index, :autocomplete]
  end

  role :moderator do
    includes :registered_user
    has_permission_on :comments, :to => [:edit, :update, :destroy]
    has_permission_on :shouts, :to => [:edit, :update, :destroy]
  end

  role :author do
    includes :registered_user
    has_permission_on :schedules, :to => [:new, :create]
    has_permission_on :schedules, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
    has_permission_on :items, :to => [:new, :create, :edit, :destroy, :update]
  end
end

