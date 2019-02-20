require 'pry'
describe App do

  describe 'GET /' do
    it 'sends a 200 status code' do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it 'renders form' do
      visit '/'
      expect(page).to have_selector("form")
      expect(page).to have_field(:user_text)
    end
  end

  describe 'POST /' do
    it "displays string results" do
      visit '/'
      
      fill_in(:user_text, :with => "Green Eggs and Ham")
      click_button "submit"
      expect(page.status_code).to eq(200)
      expect(page).to have_text("Number of Words: 4") # 4
      expect(page).to have_text("Vowels: 4") # 5
      expect(page).to have_text("Consonants: 8") # 10
      expect(page).to have_text("Most Common Letter: e, used 2 times") # G, 3
    end
  end

  describe 'TextAnalyzer Class' do
    let!(:words) { TextAnalyzer.new("mirror mirror on the wall") }

    it 'can initialize a new instance of the class' do
      expect(TextAnalyzer.new("hey yall")).to be_an_instance_of(TextAnalyzer)
    end

    it 'can have text' do
      expect(words.text).to eq("mirror mirror on the wall")
    end
  end
end
