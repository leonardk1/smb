def requires_attribute(attribute)
  before { subject.send("#{attribute}=", nil) }
  it { should_not be_valid }
end

def has_attribute(attribute)
  it { should respond_to(attribute.to_sym) }
end

def attributes_present_or_not?(attributes)
  #testing validity
  attributes.each { |attribute|
    #ensures that all the the required attributes are present
    context "when #{attribute} is present" do
      has_attribute(attribute)
    end

    #checks for absence of any of the required attributes
    context "when #{attribute} is not present" do
     requires_attribute(attribute)
    end
  }
end