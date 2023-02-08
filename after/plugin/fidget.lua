local fg_ok, fg = pcall(require, "fidget")
if not fg_ok then
  return
end

fg.setup()
