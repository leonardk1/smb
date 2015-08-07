def requires_attribute(attribute)
  before { subject.send("#{attribute}=", nil) }
  it { should_not be_valid }
end

def has_attribute(attribute)
  it { should respond_to(attribute.to_sym) }
end