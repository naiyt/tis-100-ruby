require_relative '../parsing/parser'
require 'pry'

describe 'TIS100 parsing' do
  def valid?(code)
    begin
      Parser.parse(code)
    rescue ParseError
      false
    end
  end

  describe 'valid syntaxes' do
    let(:valid) {
      ['COOLLABEL:', 'SAV', 'SWP', 'NEG', 'NOP',
       'MOV UP DOWN', 'MOV UP ACC', 'MOV 10 DOWN',
       'MOV UP ACC', 'MOV 10 DOWN', 'MOV 10 ACC',
       'ADD 10', 'ADD UP', 'ADD ACC', 'SUB UP',
       'SUB ACC']
    }

    it 'properly parses them' do
      valid.each do |syntax|
        expect(valid?(syntax)).to be_truthy
      end
    end
  end

  describe 'invalid syntaxes' do
    let(:invalid) {
      ['FDJSKLF', 'SAV 10', 'SWP 10', 'NEG 10',
       'NOP 10', 'MOV UP BAK', 'MOV 10', 'MOV UP DOWN UP',
       'MOV 10 BAK', 'ADD UP DOWN', 'ADD', 'ADD BAK', 'SUB',
       'SUB BAK']
    }

    it 'raises a SyntaxError' do
      invalid.each do |syntax|
        expect(valid?(syntax)).to be_falsy
      end
    end
  end

  describe 'a full valid program' do
    it 'is valid' do
      program = <<-EOS
        START:
          MOV 10 ACC
          MOV ACC DOWN
          SUB UP
          JEZ START
          SAV
          SWP
          JMP FINISH
        FINISH:
          NEG
          JEZ START
          JRO -1
          JNZ FINISH
      EOS
      Parser.parse(program)
      expect(valid?(program)).to be_truthy
    end
  end
end
