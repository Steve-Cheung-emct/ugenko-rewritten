# ugenko-rewritten
基於 TikZ 水印的 upLaTeX genko (原稿紙) 的重寫

## 字体説明
此預覽版使用之前需配置用戶本地字體，在 genkofonts.sty 中，125 行起。

將其中的字體替換爲用戶本地字體，格式如示例。

日文字體使用 UniJIS2004-UTF16-H/V 作爲 CMAP 映射。

中文字體使用 UniGB-UTF16-H/V 作爲映射，或者使橫書字體使用 unicode ，

直書字體使用 unicode 竝使用 -w 1 參數，將漢字參考方向旋轉90°。


## 項目文件描述
| 項目                 | 説明                                                                                                |
|--------------------|---------------------------------------------------------------------------------------------------|
| genko\.cls         | class文件。對 菅野 善久 老師的 genko （原稿紙）的重寫。                                                               |
| colordef\.clo      | class 使用的顔色定義文件。                                                                                  |
| pdfm\.clo          | 騎縫書眉使用的罣綫、邉框、書眉、頁碼等的tikz定義。                                                                       |
| binsen\.clo        | 便箋紙使用的定義，pdfm 的否定狀態。                                                                              |
| tgenko\.clo        | 垂直書寫作文紙的網格定義。                                                                                     |
| ygenko\.clo        | 水平書寫作文紙的網格定義。                                                                                     |
| ribbon\.clo        | 日式JIS B4作文紙的網格定義。                                                                                 |
| test\.clo          | 大唐西域記式卷子本的定義。每製作一次卷子，都需要重新定義。                                                                     |
| pagesizedef\.clo   | class 使用的外部判斷，主要是判斷紙張尺寸，以及對應的平衡參數。                                                                |
| genkoid\.tex       | 頁脚使用的姓名文本。用戶自定義。                                                                                  |
| genkofonts\.sty    | 自用字體的 NFSS2 配置。主要針對作文紙一字一格，使用刪掉glue和kern表的虛擬字體。                                                   |
| genkosettings\.sty | 配套的設置文件。                                                                                          |
| tochu\.sty         | 頭注包文件。本模板未使用。若使用頭注包，則需重構 pagesizedef\.clo 中的 `voffset` 參數。                                          |
| warichus\.sty      | 割注包文件。本模板未使用。                                                                                     |
| jcolor\.sty        | 日式顔色包文件。                                                                                          |
| jcolor\.tex        | 日式顔色包説明文件。                                                                                        |
| main\.tex          | 本文。                                                                                               |
| test\.tex          | 測試文本。                                                                                             |
| TFM文件夾             | 自製虛擬字體向量信息文件（TFM）。                                                                                |
| VF 文件夾             | 自製虛擬字體。安裝方法，將此兩個文件夾拷貝到 `C:\\texlive\\texmf\-local\\fonts` 下對應的目錄中，再執行 `mktexlsr`。 |


##  支持調用的選項

| 項目                                                        | 説明                                                                                                                                                                                                                                  |
|-----------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| b5paper,tate,final,openleft,twoside,onecolumn,淺朱,LightRed |                                                                                                                                                                                                                                     |
|                                                           | 默認選項：B5 紙張，直書，終稿，左開，雙邉，單欄；書眉文字為淺朱，欄目顔色為淺朱（LightRed）。 此默認選項不含版式，所以必須再選擇版式，否則將出錯。                                                                                                                                                     |
| pdfm                                                      | 騎縫書眉。此版式為永樂大典式，葉 16 欄，每欄兩行，行 32 字，行首空四格。欄寬 52 pt，行寬 26 pt。頁 448 字，葉 896 字。若使用頭注，則需重構 pagesizedef\.clo 中的 voffset 參數。只支持 A4 B5 紙張，使用其他紙張將出錯。                                                                                         |
| binsen                                                    | 便箋紙使用的定義，pdfm 的否定狀態。不使用騎縫書眉。只支持 A4 B5 紙張，使用其他紙張將出錯。                                                                                                                                                                                 |
| tgenko                                                    | 直書作文紙，默認 landscape 選項。頁面規格 20x20\.只支持 A4 B5 A5 紙張，使用其他紙張將出錯。B5 紙張由 A4 縮放得到。A4 B5 頁面規格 20x20\. A5 頁面規格 15x15\.                                                                                                                       |
| ygenko                                                    | 橫書作文紙，支持 A3 A4 A5 B5 紙張。選擇 B4 紙張將出錯。其中 A3 默認 landscape 選項。B5 紙張由 A4 縮放得到。A4 B5 頁面規格 20x20\. A5 頁面規格 15x15\. 此 A3 由兩張 A4 拼合而成。頁面規格也是 20x20\. 整版共 800 字。不支持 B4 紙張。                                                                    |
| 作文紙                                                       | ygenko A3 紙張的增强版，用於對考試作文紙的模擬。頁面規格 20x23\. 行高 30 pt。整版共 920 字。如果調用帶有章標題的頁面佈局（`\\pagestyle\{chapter`），則整版共 880 字。                                                                                                           |
| ribbon                                                    | 日式 JIS B4 作文紙。 每葉 20 欄 20 行，每行 20 字，欄寬 42 pt。對於所有帶網格的版式，使用 `\\空行` 產生一個空行，此命令後多敲兩個 Enter ，使下一行成爲一個段落。否則將引起異常。此命令等效爲`\\vskip\\baselineskip`；使用 `\\空一格` 、 `\\空兩格` 對行首進行空格處理。默認空格請設置爲 0 pt，否則段落首行將無法對齊。 |
| test                                                      | 大唐西域記式卷子本。它的技術難點在於尋找文本的起點，以及網格的起點。網格寬度即爲行高 35 pt，網格從右往左繪製。第一條網格綫即爲版心的右側界限。 每製作一次卷子，都需要重新定義 pagesizedef\.clo 中對應的平衡參數。                                                                                                               |
| 橫向頁碼                                                      | 或“横向頁碼”“橫頁碼”“横頁碼”“yokopage”：調用頁脚頁碼。默認無頁脚。                                                                                                                                                                                           |
| 名字                                                        | 或“ID”“名前”“myname”：調用頁脚簽名。需要“橫向頁碼”支持。                                                                                                                                                                                                |
| 顔色選項                                                      | 詳見 colordef\.clo，其中漢字選項多爲書眉漢字顔色定義。假名選項為網格顔色。                                                                                                                                                                                        |


## 選項衝突表

| 項目        | pdfm | binsen | tgenko | ygenko | ribbon | 作文紙 | test | 注    |
|-----------|---------------------------|-----------------------------|-----------------------------|-----------------------------|-----------------------------|--------------------------|---------------------------|------|
| a3paper   | ╳                         | ╳                           | ╳                           | ◯                           | ╳                           | ◯                        | ╳                         |      |
| a4paper   | ◯                         | ◯                           | ◯                           | ◯                           | ╳                           | ╳                        | ╳                         |      |
| a5paper   | ╳                         | ╳                           | ◯                           | ◯                           | ╳                           | ╳                        | ╳                         |      |
| b4paper   | ╳                         | ╳                           | ╳                           | ◯                           | ◯                           | ╳                        | ╳                         |      |
| b5paper   | ◯                         | ◯                           | ◯                           | ◯                           | ╳                           | ╳                        | ╳                         |      |
| landscape | ╳                         | ╳                           | ◯                           | ◯                           | ◯                           | ◯                        | ◯                         | 紙張橫置 |
| tate      | ◯                         | ◯                           | ◯                           | ╳                           | ◯                           | ╳                        | ◯                         | 直書   |
| yoko      | ╳                         | ╳                           | ╳                           | ◯                           | ╳                           | ◯                        | ◯                         | 橫書   |
| 橫向頁碼      | ◯                         | ◯                           | ◯                           | ◎                           | ◯                           | ╳                        | ╳                         |      |
| 名字        | ◯                         | ◯                           | ◯                           | ◎                           | ◯                           | ╳                        | ╳                         |      |
| test      | ╳                         | ╳                           | ╳                           | ╳                           | ╳                           | ╳                        | ◯                         | 卷子本  |
| 注         | 騎縫書眉                      | 日式便箋                        | 直書作文紙                       | 橫書作文紙                       | 日式B4作文紙                     | 考試用作文紙                   | 卷子本                       |      |
| 古典書式      | 永樂大典式                     | 紅樓夢式                        |                             |                             |                             |                          | 大唐西域記式                    |      |



參考鏈接：[原稿用紙；原稿紙；稿紙；日式便箋；UPTEX/UPLATEX 縱書](https://github.com/Steve-Cheung-emct/genkou-for-uplatex)
