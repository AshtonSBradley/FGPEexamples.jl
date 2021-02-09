module FGPEexamples

using Pkg, Weave

cssfile = joinpath(@__DIR__,"templates","skeleton_css.css")
latexfile = joinpath(@__DIR__, "../docs", "templates", "julia_tex.tpl")

source_path = @__DIR__
html_path = joinpath(source_path,"../docs","html")
pdf_path = joinpath(source_path,"../docs","pdf")
notebook_path = joinpath(source_path,"../docs","notebooks")

# flist = ["1dharmonic" "1dbrightsoliton" "2dharmonic" "3dquenchiso" "3dquenchtrap" "3dquenchslab" "3dquenchtube" "jrsoliton" "1dtemporalsoliton"]
flist = ["1dbrightsoliton"] # to only build this example

function weavedocs(file)
    tmp = joinpath(source_path,file)*".jmd"
    weave(tmp,out_path=html_path,doctype = "md2html")
    # Weave.convert_doc(tmp,joinpath(notebook_path,file)*".ipynb")
    # weave(tmp,out_path=pdf_path,doctype="md2pdf"; template=latexfile)
end

function weave_some(flist)
    for file in flist
        weavedocs(file)
    end
end

weave_all() = weave_some(flist)
end
