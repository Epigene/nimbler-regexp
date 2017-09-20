# rspec spec/nimbler/regexp_spec.rb
RSpec.describe NimblerRegexp do
  it "has a version number" do
    expect(NimblerRegexp::VERSION).not_to be_nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  describe ".root" do
    it "returns the absolute path to gem root" do
      expect(NimblerRegexp.root.to_s.match?(%r'nimbler-regexp\z')).to(
        eq(true)
      )
    end
  end

  describe "#is_regexp_match(text, regex)" do
    it "correctly does plain string matching" do
      # "aBc".match?("Bc")
      expect(
        NimblerRegexp.is_regexp_match("aBc", "Bc")
      ).to eq(true)
    end

    it "correctly does case insensitive matching" do
      # "ABC".match?(%r'[a-z]{3,}'i)
      expect(
        NimblerRegexp.is_regexp_match("ABC", "/[a-z]{3,}/i")
      ).to eq(true)
    end

    it "correctly does multiline matching" do
      # "foo\nbar\nbaz".match?(%r'\Afoo.*baz\z'm)
      expect(
        NimblerRegexp.is_regexp_match(
          "foo\nbar\nbaz", "/\\Afoo.*baz\\z/m"
        )
      ).to eq(true)
    end

    it "correctly does extended matching" do
      expect(
        NimblerRegexp.is_regexp_match(
          "https://test.com/path1/path2?utm_campaign=true#anchor",
          "/\\A\n  https?:\\/\\/ # scheme\n  .* # anything\n\\z\n/"
        )
      ).to eq(true)
    end

    it "correctly does all three options together" do
      expect(
        NimblerRegexp.is_regexp_match(
          "Https://test.com\n/path1/path2?utm_campaign=true#anchor",
          "/\\A\n  https?:\\/\\/ # scheme\n  .* # anything\n\\z\n/ixm"
        )
      ).to eq(true)
    end

    it "correctly does not match if theres no match" do
      expect(
        NimblerRegexp.is_regexp_match(
          "abc",
          "/baz/"
        )
      ).to eq(true)
    end
  end

end
