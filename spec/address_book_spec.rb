require_relative '../models/address_book'

RSpec.describe AddressBook do
    
    let(:book) {AddressBook.new}
    
  def check_entry(entry, expected_name, expected_phone_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_phone_number
    expect(entry.email).to eq expected_email
  end
    
  describe "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augustaking@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augustaking@lovelace.com')
    end
  end

  describe "remove_entry" do
    it "deletes one entry from the address book" do
      book = AddressBook.new
      book.add_entry('Mike McFarlane', '010.012.9911', 'mikemcfarlane@farlane.com')
      name = 'Ada Lovelace'
      phone_number = '010.012.1815'
      email = 'augustaking@lovelace.com'
      book.add_entry(name, phone_number, email)
      expect(book.entries.size).to eq(2)

      book.remove_entry(name, phone_number, email)
      expect(book.entries.size).to eq(1)
      expect(book.entries.first.name).to eq('Mike McFarlane')
    end
  end
    
  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eq 5
    end

    it "import the first entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end
    
    it "import the second entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
    end
    
    it "import the third entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
   
    end

   it "import the fourth entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
   
    end
    
   it "import the fifth entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
    
    end   
  end
  
  describe "adding entries from entries_2" do
    it "imports entries from entries_2 csv file" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size
      expect(book_size).to eq 3
    end
    
    it "import the first entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Cassie", "777-888-9999", "cassie@blocmail.com" )
    end
    
    it "imports the second entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Jane", "616-888-1212", "jane@blocmail.com")
    end
    
    it "imports the third entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Mike", "811-345-9898", "mike@blocmail.com")
    end
  end
  
  describe "#binary_search method" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end
    
    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry - book.binary_search("Bill")
      expect(entry).to be_a Entry
      check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
    end
  end
end

            

