-- pandoc Lua filter: translate ::: {custom-style="EmployerDate"} divs
-- to a LaTeX `employerdate` environment when rendering to PDF/LaTeX.
--
-- The docx writer respects the custom-style attribute natively (applies
-- the EmployerDate paragraph style defined in the reference docx). The
-- LaTeX writer, by contrast, strips the div entirely and treats the
-- content as a regular paragraph — which means the date line picks up
-- the global \parskip and looks too loose.
--
-- This filter wraps the content of any such div in
-- `\begin{employerdate} ... \end{employerdate}`, which the LaTeX header
-- defines to italicise and tighten the vertical spacing.
--
-- For any output format other than LaTeX, the filter leaves the div alone
-- (pandoc's default handling is correct for those).

function Div(el)
  if el.attributes['custom-style'] == 'EmployerDate' and FORMAT:match('latex') then
    local out = { pandoc.RawBlock('latex', '\\begin{employerdate}') }
    for _, block in ipairs(el.content) do
      table.insert(out, block)
    end
    table.insert(out, pandoc.RawBlock('latex', '\\end{employerdate}'))
    return out
  end
end
