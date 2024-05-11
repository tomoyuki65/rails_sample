require 'rails_helper'

RSpec.describe "Applications", type: :request do
  # テスト用APIの検証
  describe "GET /api/v1/hello" do
    # レスポンスのステータス検証
    it "ステータス200で正常終了すること" do
      get hello_path
      expect(response).to have_http_status(:success)
    end

    # レスポンスの出力内容の検証
    it "「hello world !!」を出力すること" do
      get hello_path
      expect(response.body).to eq("hello world !!")
    end
  end
end
