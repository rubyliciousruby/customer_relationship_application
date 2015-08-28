require_relative 'rolodex.rb'

class CRM
  attr_accessor :title

  def self.run(name)
    crm = new(name)
    crm.main_menu
  end

  def initialize(name)
    @title = name
    @rolodex = Rolodex.new
  end

  # This is what attr_accessor does:

  # def title
  #   @title
  # end

  # def title=(new_title)
  #   @title = new_title
  # end

  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Display contact"
    puts "5. Display contact attribute"
    puts "6. Delete a contact"
    puts "7. Exit"
  end

  def main_menu
    while true
      print_main_menu
      print "Choose an option: "
      user_input = gets.chomp.to_i
      break if user_input == 7
      choose_option(user_input)
    end
  end

  def choose_option(input)
    # input = user_input
    case input
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then display_contact_attribute
    when 6 then delete_contact
    when 7 then exit
    else
      puts "I'm sorry Dave, I'm afraid you can't do that."
    end
  end

  def add_contact
    print "First name: "
    first_name = gets.chomp

    print "Last name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def display_all_contacts
    @rolodex.all.each do |contact|
      puts "#{contact.id}: #{contact.full_name} / #{contact.email}"
    end
  end
 
  def modify_contact

    print "Which contact you'd like to modify? (enter the id)"
    user_input_id = gets.chomp.to_i
    print "Are you sure that you would like to modify the contact info of ID: #{user_input_id}? Enter [Y] for Yes or [N] for No. "
    input_option = gets.chomp.upcase
     if input_option == "Y"

        puts "[1] to modify last name"
        puts "[2] to modify first name"
        puts "[3] to modify email"
        puts "[4] to modify notes"

        selection = gets.chomp.to_i

        print "What is the new info for this contact?"
        new_info = gets.chomp

        @rolodex.modify_contact(user_input_id, selection, new_info)
      else
        self.modify_contact
    end
  end
  
  def display_contact
        print "Please enter the ID of the contact information that you'd like to display."
        display_info = gets.chomp.to_i
    
    if display_info <= 7 then

        @rolodex.display_contact( display_info)

    else
        puts "There is no such contact exist in our database."
        puts " Please enter [3] to display all contact and find out which contact info that you'd like to display. "
    end

  end

  def display_contact_attribute
    puts "Please enter what type of contact attribute that you'd like to search by?" 
    puts "Type [1] to search for Last name"
    puts "Type [2] to search for First Name"
    puts "Type [3] to search for Notes "
    puts "Type [4] to search for email "
    user_input = gets.chomp.to_i
   
    while !(1..4).include?(user_input)
      puts "Please enter a valid number"
      user_input = gets.chomp.to_i
    end
    
    case user_input
    when 1 then 
    @rolodex.display_attribute_last_name
    when 2 then 
    @rolodex.display_attribute_first_name
    when 3 then 
    @rolodex.display_attribute_note
    when 4 then 
    @rolodex.display_attribute_email
    end  
  end

  def delete_contact
      print "Please enter the ID of the contact information that you'd like to delete."
      delete_info = gets.chomp.to_i
      @rolodex.delete_contact(delete_info)
  end
end


CRM.run("Bitmaker Labs CRM")

# my_crm = CRM.new("Bitmaker Labs CRM")
# my_crm.main_menu


# my_crm.title # => "Bitmaker Labs CRM"
# my_crm.title = "Something else"


