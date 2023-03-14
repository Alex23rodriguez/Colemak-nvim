local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup()

-- Check out defualt config here:
-- https://github.com/numToStr/Comment.nvim#configuration-optional
