require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

ruby_version_is "1.9" do
  describe "Array.try_convert" do
    it "returns the argument if it's an Array" do
      x = Array.new
      Array.try_convert(x).should equal(x)
    end

    pending "returns the argument if it's a kind of Array" do
      x = ArraySpecs::MyArray[]
      Array.try_convert(x).should equal(x)
    end

    pending "returns nil when the argument does not respond to #to_ary" do
      Array.try_convert(Object.new).should be_nil
    end

    pending "sends #to_ary to the argument and returns the result if it's nil" do
      obj = mock("to_ary")
      obj.should_receive(:to_ary).and_return(nil)
      Array.try_convert(obj).should be_nil
    end

    pending "sends #to_ary to the argument and returns the result if it's an Array" do
      x = Array.new
      obj = mock("to_ary")
      obj.should_receive(:to_ary).and_return(x)
      Array.try_convert(obj).should equal(x)
    end

    pending "sends #to_ary to the argument and returns the result if it's a kind of Array" do
      x = ArraySpecs::MyArray[]
      obj = mock("to_ary")
      obj.should_receive(:to_ary).and_return(x)
      Array.try_convert(obj).should equal(x)
    end

    pending "sends #to_ary to the argument and raises TypeError if it's not a kind of Array" do
      obj = mock("to_ary")
      obj.should_receive(:to_ary).and_return(Object.new)
      lambda { Array.try_convert obj }.should raise_error(TypeError)
    end

    pending "does not rescue exceptions raised by #to_ary" do
      obj = mock("to_ary")
      obj.should_receive(:to_ary).and_raise(RuntimeError)
      lambda { Array.try_convert obj }.should raise_error(RuntimeError)
    end
  end
end