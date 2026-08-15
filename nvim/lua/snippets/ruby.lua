local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local s = ls.snippet

return {
  s("has_many", fmt("has_many :{}, dependent: :destroy", { i(1, "items") })),
  s("belongs_to", fmt("belongs_to :{}", { i(1, "user") })),
  s("has_one", fmt("has_one :{}", { i(1, "profile") })),
  s("has_and_belongs_to_many", fmt("has_and_belongs_to_many :{}", { i(1, "items") })),
  s("validates", fmt("validates :{}, presence: true", { i(1, "name") })),
  s("scope", fmt("scope :{}, -> {{ {} }}", { i(1, "active"), i(2, "where(active: true)") })),
  s("before_action", fmt("before_action :{}", { i(1, "authenticate_user!") })),
  s("include", fmt("include {}", { i(1, "SomeModule") })),
  s("delegate", fmt("delegate :{}, to: :{}", { i(1, "name"), i(2, "user") })),
}
