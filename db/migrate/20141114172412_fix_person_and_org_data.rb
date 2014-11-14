class FixPersonAndOrgData < ActiveRecord::Migration
  def change

    Organization.where(name: nil).delete_all
    Organization.where(name: "").delete_all
    Organization.where(name: " ").delete_all

    Organization.where(active: nil).update_all(active: false)

    Person.find_each do |person|
      if person.date_of_birth <= 100.years.ago
        person.delete
      end
    end

  end
end
