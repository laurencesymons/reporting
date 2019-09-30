def ratio(val1,val2)

  if val1.nonzero?.nil? || val2.nonzero?.nil?
    return 0
  end

  val3 = val1.to_f / val2.to_f
  val3 * 100

end


describe "ratio" do

  it "divides" do
    expect(ratio(5,10)).to eq(50)
  end

  it "divides by 0" do
    expect(ratio(5,0)).to eq(0)
  end

end
