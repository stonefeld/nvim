local status_ok, mta = pcall(require, "masita")
if not status_ok then
	return
end

mta.setup({
	transparent_bg = true,
	scheme = "nord",
	styles = {
		functions = "NONE",
	},
})
