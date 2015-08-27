require 'spec_helper' 

describe ApplicationHelper do
  describe "flash_class" do
    specify "when error key is (notice)" do
      expect(flash_class("notice")).to eq("alert alert-dismissable alert-info")
    end

    specify "when error key is (success)" do
      expect(flash_class("success")).to eq("alert alert-dismissable alert-success")
    end

    specify "when error key is (error)" do
      expect(flash_class("error")).to eq("alert alert-dismissable alert-danger")
    end

    specify "when error key is (alert)" do
      expect(flash_class("alert")).to eq("alert alert-dismissable alert-warning")
    end
  end
end