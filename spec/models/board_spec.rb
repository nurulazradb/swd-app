require 'rails_helper'
require 'tictactoe/board'

RSpec.describe Board, type: :model do
  let(:board) { build(:board) }

  it 'has 9 spaces' do
    expect(board.size).to eq(3)
    expect(board.empty_fields.length).to eq(9)
    expect(board.board_fields).to eq({1=>"   ", 2=>"   ", 3=>"   ", 4=>"   ", 5=>"   ", 6=>"   ", 7=>"   ", 8=>"   ", 9=>"   "})
    expect(board.lines.length).to eq(8)
  end

  it 'should marks with X' do
    board.mark 1, 'X'
    expect(board.empty_fields.length).to eq(8)
    expect(board.board_fields[1]).to eq(' X ')
  end

  it 'should validates moves' do
    board.mark 1, 'X'
    expect { board.mark 1, 'O' }.to_not change {board.empty_fields.length}
  end

  it 'should return a winner' do
    allow(board).to receive(:winner?) { true }
    expect(board.winner?('x')).to be true
  end

  it 'should return a winner' do
    board.mark 1, 'x'
    board.mark 2, 'x'
    board.mark 3, 'x'
    expect(board.winner?('x')).to be true
  end

  it 'should not return a winner' do
    allow(board).to receive(:winner?) { false }
    expect(board.winner? 'o').to be false
  end

  it 'should not return a winner' do
    board.mark 1, 'o'
    board.mark 2, 'o'
    board.mark 3, 'x'
    expect(board.winner?('o')).to be false
  end

  it 'should return tie' do
    allow(board).to receive(:tie?) { true }
    expect(board.tie?).to be(true)
  end

  it 'should draw with 1 X' do
    board.mark 1, 'X'
    expect(board.draw).to start_with(' X |   |   ')
  end
end
