class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one? item_name
    dev_inventory = []
    self.freebies.each do |freebie|
      dev_inventory << freebie.item_name
    end
    dev_inventory.include?(item_name)
  end
  
  def give_away new_dev, freebie
    if freebie.dev_id == self.id
      freebie.update(dev_id: "#{new_dev.id}")
    else
      p "can't give what's not yours"
    end
  end

end
