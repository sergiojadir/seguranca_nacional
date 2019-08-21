require 'test_helper'

class AeroportosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aeroporto = aeroportos(:one)
  end

  test "should get index" do
    get aeroportos_url, as: :json
    assert_response :success
  end

  test "should create aeroporto" do
    assert_difference('Aeroporto.count') do
      post aeroportos_url, params: { aeroporto: { cidade_id: @aeroporto.cidade_id, codigo: @aeroporto.codigo, nome: @aeroporto.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show aeroporto" do
    get aeroporto_url(@aeroporto), as: :json
    assert_response :success
  end

  test "should update aeroporto" do
    patch aeroporto_url(@aeroporto), params: { aeroporto: { cidade_id: @aeroporto.cidade_id, codigo: @aeroporto.codigo, nome: @aeroporto.nome } }, as: :json
    assert_response 200
  end

  test "should destroy aeroporto" do
    assert_difference('Aeroporto.count', -1) do
      delete aeroporto_url(@aeroporto), as: :json
    end

    assert_response 204
  end
end
