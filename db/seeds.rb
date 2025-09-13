# db/seeds.rb
Client.create!(name: "Empresa X", email: "x@ex.com", due_day: Date.current.day,   payment_method_key: "boleto")
Client.create!(name: "Empresa Y", email: "y@ex.com", due_day: Date.current.day,   payment_method_key: "credit_card")
Client.create!(name: "Empresa Z", email: "z@ex.com", due_day: Date.current.day+1, payment_method_key: "pix")
