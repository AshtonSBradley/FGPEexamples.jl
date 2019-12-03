using Pkg, Weave
pkg"activate ."

@warn "Weaving all documents (will take a few minutes)... "
sleep(2)

cssfile = joinpath(@__DIR__,"templates","skeleton_css.css")
latexfile = joinpath(@__DIR__, "../docs", "templates", "julia_tex.tpl")

source_path = @__DIR__
html_path = joinpath(source_path,"../docs","html")
pdf_path = joinpath(source_path,"../docs","pdf")
notebook_path = joinpath(source_path,"../docs","notebooks")

filelist = ["1dharmonic" "1dbrightsoliton" "2dharmonic" "3dquenchiso" "3dquenchtrap" "3dquenchslab" "3dquenchtube" "jrsoliton"]

function weavedocs(file)
    tmp = joinpath(source_path,file)*".jmd"
    weave(tmp,out_path=html_path,doctype = "md2html")
    # weave(tmp,out_path=pdf_path,doctype="md2pdf"; template=latexfile)
    # Weave.convert_doc(tmp,joinpath(notebook_path,file)*".ipynb")
end

function makeall(flist)
for file in flist
    @info "Weaving example "*file
    weavedocs(file)
end
end

makeall(flist)
