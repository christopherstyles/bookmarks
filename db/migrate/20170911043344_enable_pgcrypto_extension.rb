# frozen_string_literal: true

class EnablePgcryptoExtension < ActiveRecord::Migration[5.1]
  def change
    enable_extension "pgcrypto"
  end
end
