require 'test_helper'

class MathildaClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mathilda_class = mathilda_classes(:one)
  end

  test 'should get index' do
    get mathilda_classes_url, as: :json
    assert_response :success
  end

  test 'should create mathilda_class' do
    assert_difference('MathildaClass.count') do
      post mathilda_classes_url, params: { mathilda_class: { name: @mathilda_class.name } }, as: :json
    end

    assert_response :created
  end

  test 'should show mathilda_class' do
    get mathilda_class_url(@mathilda_class), as: :json
    assert_response :success
  end

  test 'should update mathilda_class' do
    patch mathilda_class_url(@mathilda_class), params: { mathilda_class: { name: @mathilda_class.name } }, as: :json
    assert_response :success
  end

  test 'should destroy mathilda_class' do
    assert_difference('MathildaClass.count', -1) do
      delete mathilda_class_url(@mathilda_class), as: :json
    end

    assert_response :no_content
  end
end
