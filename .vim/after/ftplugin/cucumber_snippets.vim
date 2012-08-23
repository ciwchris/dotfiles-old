if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim


exec "Snippet fea Feature: ".st.et."<CR>In order to ".st.et."<CR>As a ".st.et."<CR>I want ".st.et."<CR><CR>".st.et
exec "Snippet sce Scenario: ".st.et."<CR>Given ".st.et."<CR>When ".st.et."<CR>Then ".st.et."<CR><CR>".st.et
