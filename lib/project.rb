class Project < ActiveRecord::Base
  scope(:not_done, -> do
    where({:done => false})
  end)
  has_many(:employees)
end
