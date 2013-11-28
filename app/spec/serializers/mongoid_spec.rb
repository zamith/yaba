require 'spec_helper'
require 'serializers/mongoid'

describe Serializers::Mongoid do
  it "removes _id and populates id" do
    mongoid_post_attributes = { "_id" => "xpto123", "uid" => 1, "body" => "body of text" }
    record = double("Mongoid Record", attributes: mongoid_post_attributes)

    serialized_post = Serializers::Mongoid.new(record).serialize(id_attr: :uid)

    expect(serialized_post).to eq({ "id" => 1, "body" => "body of text" })
  end
end
