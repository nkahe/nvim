" Commands for editors such as Qt Creator.

""" Delete without yanking """
nnoremap <Space>d "_d
vnoremap <Space>d "_d
nnoremap <Space>D "_D
vnoremap <Space>D "_D
nnoremap öd "_d
vnoremap öd "_d
nnoremap öD "_D
vnoremap öD "_D
nnoremap <A-d> "_d
vnoremap <A-d> "_d
nnoremap <A-D> "_D
vnoremap <A-D> "_D

" AltGr + d in nordic layout
nnoremap ð "_d
vnoremap ð "_d
nnoremap Ð "_D
vnoremap Ð "_D

" nnoremap <Space>p "_dP (Commented out in Lua as well)

""" Ignore delete operations """
nnoremap <Del> "_x
vnoremap <Del> "_x
nnoremap <BS> "_X
vnoremap <BS> "_X
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

""" Clipboard operators """
nnoremap cp "+p
vnoremap cp "+p
nnoremap cP "+P
vnoremap cP "+P
nnoremap cd "+d
vnoremap cd "+d
nnoremap cD "+D
vnoremap cD "+D
nnoremap cy "+y
vnoremap cy "+y
nnoremap cY "+Y
vnoremap cY "+Y

""" GUI style insert mappings """
nnoremap <S-Insert> "*P
vnoremap <S-Insert> "*P
inoremap <S-Insert> <C-o>"*P
tnoremap <S-Insert> <C-\><C-n>"*Pi
cnoremap <S-Insert> <C-R>*

xnoremap <C-Insert> "+y



nnoremap gh ^
vnoremap gh ^
nnoremap gl $
vnoremap gl $
