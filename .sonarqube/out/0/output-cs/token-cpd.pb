≈-
SC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\Extensions\EnumExtensions.cs
	namespace 	
Melad
 
. 
Common 
. 

Extensions !
;! "
public 
static 
class 
EnumExtensions "
{ 
public 

static 
IEnumerable 
< 
T 
>  
GetEnumValues! .
<. /
T/ 0
>0 1
(1 2
this2 6
T7 8
input9 >
)> ?
where@ E
TF G
:H I
structJ P
{		 
if

 

(

 
!

 
typeof

 
(

 
T

 
)

 
.

 
IsEnum

 
)

 
throw 
new !
NotSupportedException +
(+ ,
), -
;- .
return 
Enum 
. 
	GetValues 
( 
input #
.# $
GetType$ +
(+ ,
), -
)- .
.. /
Cast/ 3
<3 4
T4 5
>5 6
(6 7
)7 8
;8 9
} 
public 

static 
IEnumerable 
< 
T 
>  
GetEnumFlags! -
<- .
T. /
>/ 0
(0 1
this1 5
T6 7
input8 =
)= >
where? D
TE F
:G H
structI O
{ 
if 

( 
! 
typeof 
( 
T 
) 
. 
IsEnum 
) 
throw 
new !
NotSupportedException +
(+ ,
), -
;- .
foreach 
( 
var 
value 
in 
Enum "
." #
	GetValues# ,
(, -
input- 2
.2 3
GetType3 :
(: ;
); <
)< =
)= >
if 
( 
( 
( 
input 
as 
Enum 
)  
!  !
)! "
." #
HasFlag# *
(* +
(+ ,
value, 1
as2 4
Enum5 9
)9 :
!: ;
); <
)< =
yield 
return 
( 
T 
)  
value  %
;% &
} 
public 

static 
string 
	ToDisplay "
(" #
this# '
Enum( ,
value- 2
,2 3
DisplayProperty4 C
propertyD L
=M N
DisplayPropertyO ^
.^ _
Name_ c
)c d
{ 
Guard 
. 
Against 
. 
Null 
( 
value  
,  !
nameof" (
(( )
value) .
). /
)/ 0
;0 1
var 
	attribute 
= 
value 
. 
GetType %
(% &
)& '
.' (
GetField( 0
(0 1
value1 6
.6 7
ToString7 ?
(? @
)@ A
)A B
!B C
. 
GetCustomAttributes  
<  !
DisplayAttribute! 1
>1 2
(2 3
false3 8
)8 9
.9 :
FirstOrDefault: H
(H I
)I J
;J K
if 

( 
	attribute 
== 
null 
) 
return   
value   
.   
ToString   !
(  ! "
)  " #
;  # $
var!! 
	propValue!! 
=!! 
	attribute!! !
.!!! "
GetType!!" )
(!!) *
)!!* +
.!!+ ,
GetProperty!!, 7
(!!7 8
property!!8 @
.!!@ A
ToString!!A I
(!!I J
)!!J K
)!!K L
!!!L M
.!!M N
GetValue!!N V
(!!V W
	attribute!!W `
,!!` a
null!!b f
)!!f g
;!!g h
return"" 
	propValue"" 
?"" 
."" 
ToString"" "
(""" #
)""# $
!""$ %
;""% &
}## 
public%% 

static%% 

Dictionary%% 
<%% 
int%%  
,%%  !
string%%" (
>%%( )
ToDictionary%%* 6
(%%6 7
this%%7 ;
Enum%%< @
value%%A F
)%%F G
{&& 
return'' 
Enum'' 
.'' 
	GetValues'' 
('' 
value'' #
.''# $
GetType''$ +
(''+ ,
)'', -
)''- .
.''. /
Cast''/ 3
<''3 4
Enum''4 8
>''8 9
(''9 :
)'': ;
.''; <
ToDictionary''< H
(''H I
p''I J
=>''K M
Convert''N U
.''U V
ToInt32''V ]
(''] ^
p''^ _
)''_ `
,''` a
q''b c
=>''d f
	ToDisplay''g p
(''p q
q''q r
)''r s
)''s t
;''t u
}(( 
})) 
public++ 
enum++ 
DisplayProperty++ 
{,, 
Description-- 
,-- 
	GroupName.. 
,.. 
Name// 
,// 	
Prompt00 

,00
 
	ShortName11 
,11 
Order22 	
}33 ˙
WC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\Extensions\IdentityExtensions.cs
	namespace 	
Melad
 
. 
Common 
. 

Extensions !
;! "
public 
static 
class 
IdentityExtensions &
{		 
public

 

static

 
string

 
FindFirstValue

 '
(

' (
this

( ,
ClaimsIdentity

- ;
identity

< D
,

D E
string

F L
	claimType

M V
)

V W
{ 
return 
identity 
? 
. 
	FindFirst "
(" #
	claimType# ,
), -
?- .
.. /
Value/ 4
!4 5
;5 6
} 
public 

static 
string 
FindFirstValue '
(' (
this( ,
	IIdentity- 6
identity7 ?
,? @
stringA G
	claimTypeH Q
)Q R
{ 
var 
claimsIdentity 
= 
identity %
as& (
ClaimsIdentity) 7
;7 8
return 
claimsIdentity 
? 
. 
FindFirstValue -
(- .
	claimType. 7
)7 8
!8 9
;9 :
} 
public 

static 
string 
	GetUserId "
(" #
this# '
	IIdentity( 1
identity2 :
): ;
{ 
return 
identity 
? 
. 
FindFirstValue '
(' (

ClaimTypes( 2
.2 3
NameIdentifier3 A
)A B
!B C
;C D
} 
public 

static 
T 
? 
	GetUserId 
< 
T  
>  !
(! "
this" &
	IIdentity' 0
identity1 9
)9 :
where; @
TA B
:C D
IConvertibleE Q
{ 
var 
userId 
= 
identity 
? 
. 
	GetUserId (
(( )
)) *
;* +
return 
userId 
! 
. 
HasValue 
(  
)  !
? 
( 
T 
) 
Convert 
. 

ChangeType #
(# $
userId$ *
,* +
typeof, 2
(2 3
T3 4
)4 5
,5 6
CultureInfo7 B
.B C
InvariantCultureC S
)S T
!T U
: 
default 
; 
}   
public!! 

static!! 
string!! 
GetUserName!! $
(!!$ %
this!!% )
	IIdentity!!* 3
identity!!4 <
)!!< =
{"" 
return## 
identity## 
?## 
.## 
FindFirstValue## '
(##' (

ClaimTypes##( 2
.##2 3
Name##3 7
)##7 8
!##8 9
;##9 :
}$$ 
}%% Åc
UC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\Extensions\StringExtentions.cs
	namespace 	
Melad
 
. 
Common 
. 

Extensions !
;! "
public 
static 
class 
StringExtensions $
{ 
public 

static 
bool 
HasValue 
(  
this  $
string% +
value, 1
,1 2
bool3 7
ignoreWhiteSpace8 H
=I J
trueK O
)O P
{		 
return

 
ignoreWhiteSpace

 
?

  !
!

" #
string

# )
.

) *
IsNullOrWhiteSpace

* <
(

< =
value

= B
)

B C
:

D E
!

F G
string

G M
.

M N
IsNullOrEmpty

N [
(

[ \
value

\ a
)

a b
;

b c
} 
public 

static 
int 
ToInt 
( 
this  
string! '
value( -
)- .
{ 
return 
Convert 
. 
ToInt32 
( 
value $
)$ %
;% &
} 
public 

static 
decimal 
	ToDecimal #
(# $
this$ (
string) /
value0 5
)5 6
{ 
return 
Convert 
. 
	ToDecimal  
(  !
value! &
)& '
;' (
} 
public 

static 
string 
	ToNumeric "
(" #
this# '
int( +
value, 1
)1 2
{ 
return 
value 
. 
ToString 
( 
$str "
)" #
;# $
} 
public 

static 
string 
	ToNumeric "
(" #
this# '
decimal( /
value0 5
)5 6
{ 
return 
value 
. 
ToString 
( 
$str "
)" #
;# $
}   
public"" 

static"" 
string"" 

ToCurrency"" #
(""# $
this""$ (
int"") ,
value""- 2
)""2 3
{## 
return&& 
value&& 
.&& 
ToString&& 
(&& 
$str&& "
)&&" #
;&&# $
}'' 
public)) 

static)) 
string)) 

ToCurrency)) #
())# $
this))$ (
decimal))) 0
value))1 6
)))6 7
{** 
return++ 
value++ 
.++ 
ToString++ 
(++ 
$str++ "
)++" #
;++# $
},, 
public.. 

static.. 
string.. 
En2Fa.. 
(.. 
this.. #
string..$ *
str..+ .
)... /
{// 
return00 
str00 
.00 
Replace00 
(00 
$str00 
,00 
$str00  #
)00# $
.11 
Replace11 
(11 
$str11 
,11 
$str11 
)11 
.22 
Replace22 
(22 
$str22 
,22 
$str22 
)22 
.33 
Replace33 
(33 
$str33 
,33 
$str33 
)33 
.44 
Replace44 
(44 
$str44 
,44 
$str44 
)44 
.55 
Replace55 
(55 
$str55 
,55 
$str55 
)55 
.66 
Replace66 
(66 
$str66 
,66 
$str66 
)66 
.77 
Replace77 
(77 
$str77 
,77 
$str77 
)77 
.88 
Replace88 
(88 
$str88 
,88 
$str88 
)88 
.99 
Replace99 
(99 
$str99 
,99 
$str99 
)99 
;99 
}:: 
public<< 

static<< 
string<< 
Fa2En<< 
(<< 
this<< #
string<<$ *
str<<+ .
)<<. /
{== 
return>> 
str>> 
.>> 
Replace>> 
(>> 
$str>> 
,>> 
$str>>  #
)>># $
.?? 
Replace?? 
(?? 
$str?? 
,?? 
$str?? 
)?? 
.@@ 
Replace@@ 
(@@ 
$str@@ 
,@@ 
$str@@ 
)@@ 
.AA 
ReplaceAA 
(AA 
$strAA 
,AA 
$strAA 
)AA 
.BB 
ReplaceBB 
(BB 
$strBB 
,BB 
$strBB 
)BB 
.CC 
ReplaceCC 
(CC 
$strCC 
,CC 
$strCC 
)CC 
.DD 
ReplaceDD 
(DD 
$strDD 
,DD 
$strDD 
)DD 
.EE 
ReplaceEE 
(EE 
$strEE 
,EE 
$strEE 
)EE 
.FF 
ReplaceFF 
(FF 
$strFF 
,FF 
$strFF 
)FF 
.GG 
ReplaceGG 
(GG 
$strGG 
,GG 
$strGG 
)GG 
.II 
ReplaceII 
(II 
$strII 
,II 
$strII 
)II 
.JJ 
ReplaceJJ 
(JJ 
$strJJ 
,JJ 
$strJJ 
)JJ 
.KK 
ReplaceKK 
(KK 
$strKK 
,KK 
$strKK 
)KK 
.LL 
ReplaceLL 
(LL 
$strLL 
,LL 
$strLL 
)LL 
.MM 
ReplaceMM 
(MM 
$strMM 
,MM 
$strMM 
)MM 
.NN 
ReplaceNN 
(NN 
$strNN 
,NN 
$strNN 
)NN 
.OO 
ReplaceOO 
(OO 
$strOO 
,OO 
$strOO 
)OO 
.PP 
ReplacePP 
(PP 
$strPP 
,PP 
$strPP 
)PP 
.QQ 
ReplaceQQ 
(QQ 
$strQQ 
,QQ 
$strQQ 
)QQ 
.RR 
ReplaceRR 
(RR 
$strRR 
,RR 
$strRR 
)RR 
;RR 
}SS 
publicUU 

staticUU 
stringUU 
FixPersianCharsUU (
(UU( )
thisUU) -
stringUU. 4
strUU5 8
)UU8 9
{VV 
returnWW 
strWW 
.WW 
ReplaceWW 
(WW 
$strWW 
,WW 
$strWW  #
)WW# $
.XX 
ReplaceXX 
(XX 
$strXX 
,XX 
$strXX 
)XX 
.YY 
ReplaceYY 
(YY 
$strYY 
,YY 
$strYY 
)YY 
.ZZ 
ReplaceZZ 
(ZZ 
$strZZ 
,ZZ 
$strZZ 
)ZZ 
.[[ 
Replace[[ 
([[ 
$str[[ 
,[[ 
$str[[ 
)[[ 
.\\ 
Replace\\ 
(\\ 
$str\\ 
,\\ 
$str\\ 
)\\ 
.]] 
Replace]] 
(]] 
$str]] 
,]] 
$str]] 
)]] 
.^^ 
Replace^^ 
(^^ 
$str^^ 
,^^ 
$str^^ 
)^^ 
.__ 
Replace__ 
(__ 
$str__ 
,__ 
$str__ 
)__ 
.`` 
Replace`` 
(`` 
$str`` 
,`` 
$str`` 
)`` 
;`` 
}aa 
publiccc 

staticcc 
stringcc 
?cc 
CleanStringcc %
(cc% &
thiscc& *
stringcc+ 1
strcc2 5
)cc5 6
{dd 
returnee 
stree 
.ee 
Trimee 
(ee 
)ee 
.ee 
FixPersianCharsee )
(ee) *
)ee* +
.ee+ ,
Fa2Enee, 1
(ee1 2
)ee2 3
.ee3 4
NullIfEmptyee4 ?
(ee? @
)ee@ A
;eeA B
}ff 
publichh 

statichh 
stringhh 
?hh 
NullIfEmptyhh %
(hh% &
thishh& *
stringhh+ 1
?hh1 2
strhh3 6
)hh6 7
{ii 
returnjj 
strjj 
?jj 
.jj 
Lengthjj 
==jj 
$numjj 
?jj  !
nulljj" &
:jj' (
strjj) ,
;jj, -
}kk 
privatepp 
staticpp 
voidpp !
_cleanStringSqlServerpp -
(pp- .
ChangeTrackerpp. ;
changeTrackerpp< I
)ppI J
{qq 
varrr 
changedEntitiesrr 
=rr 
changeTrackerrr +
.rr+ ,
Entriesrr, 3
(rr3 4
)rr4 5
.ss 
Wheress 
(ss 
xss 
=>ss 
xss 
.ss 
Statess 
==ss  "
EntityStatess# .
.ss. /
Addedss/ 4
||ss5 7
xss8 9
.ss9 :
Statess: ?
==ss@ B
EntityStatessC N
.ssN O
ModifiedssO W
)ssW X
;ssX Y
foreachtt 
(tt 
vartt 
itemtt 
intt 
changedEntitiestt ,
)tt, -
{uu 	
ifvv 
(vv 
itemvv 
.vv 
Entityvv 
==vv 
nullvv #
)vv# $
continueww 
;ww 
varyy 

propertiesyy 
=yy 
itemyy !
.yy! "
Entityyy" (
.yy( )
GetTypeyy) 0
(yy0 1
)yy1 2
.yy2 3
GetPropertiesyy3 @
(yy@ A
BindingFlagsyyA M
.yyM N
PublicyyN T
|yyU V
BindingFlagsyyW c
.yyc d
Instanceyyd l
)yyl m
.zz 
Wherezz 
(zz 
pzz 
=>zz 
pzz 
.zz 
CanReadzz %
&&zz& (
pzz) *
.zz* +
CanWritezz+ 3
&&zz4 6
pzz7 8
.zz8 9
PropertyTypezz9 E
==zzF H
typeofzzI O
(zzO P
stringzzP V
)zzV W
)zzW X
;zzX Y
foreach|| 
(|| 
var|| 
property|| !
in||" $

properties||% /
)||/ 0
{}} 
var~~ 
propName~~ 
=~~ 
property~~ '
.~~' (
Name~~( ,
;~~, -
var 
val 
= 
( 
string !
)! "
property" *
.* +
GetValue+ 3
(3 4
item4 8
.8 9
Entity9 ?
,? @
nullA E
)E F
!F G
;G H
if
ÄÄ 
(
ÄÄ 
val
ÄÄ 
.
ÄÄ 
HasValue
ÄÄ  
(
ÄÄ  !
)
ÄÄ! "
)
ÄÄ" #
{
ÅÅ 
var
ÇÇ 
newVal
ÇÇ 
=
ÇÇ  
val
ÇÇ! $
.
ÇÇ$ %
Fa2En
ÇÇ% *
(
ÇÇ* +
)
ÇÇ+ ,
.
ÇÇ, -
FixPersianChars
ÇÇ- <
(
ÇÇ< =
)
ÇÇ= >
;
ÇÇ> ?
if
ÉÉ 
(
ÉÉ 
newVal
ÉÉ 
==
ÉÉ !
val
ÉÉ" %
)
ÉÉ% &
continue
ÑÑ  
;
ÑÑ  !
property
ÖÖ 
.
ÖÖ 
SetValue
ÖÖ %
(
ÖÖ% &
item
ÖÖ& *
.
ÖÖ* +
Entity
ÖÖ+ 1
,
ÖÖ1 2
newVal
ÖÖ3 9
,
ÖÖ9 :
null
ÖÖ; ?
)
ÖÖ? @
;
ÖÖ@ A
}
ÜÜ 
}
áá 
}
àà 	
}
ââ 
}ää H
FC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\GlobalUsings.csû
RC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\Infra\Domains\BaseEntity.cs
	namespace 	
Melad
 
. 
Common 
. 
Infra 
. 
Domains $
;$ %
public 
	interface 
IBaseEntity 
{ 
} 
public 
	interface 
ICreateDate 
{ 
public		 

DateTimeOffset		 

CreateDate		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
}

 
public 
abstract 
class 

BaseEntity  
<  !
TKey! %
>% &
:' (
IBaseEntity) 4
<4 5
TKey5 9
>9 :
{ 
public 

TKey 
? 
Id 
{ 
get 
; 
set 
; 
}  !
} 
public 
	interface 
IBaseEntity 
< 
TKey !
>! "
:# $
IBaseEntity% 0
{ 
TKey 
? 	
Id
 
{ 
get 
; 
set 
; 
} 
} 
public 
abstract 
class 

BaseEntity  
:! "

BaseEntity# -
<- .
int. 1
>1 2
{ 
} 
public 
	interface 
ISoftDelete 
{ 
public 

bool 
	IsDeleted 
{ 
get 
;  
set! $
;$ %
}& '
public 

DateTimeOffset 
? 
	DeletedAt $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

void 
Undo 
( 
) 
{   
	IsDeleted!! 
=!! 
false!! 
;!! 
	DeletedAt"" 
="" 
null"" 
;"" 
}## 
}$$ €L
`C:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\Infra\SqlServer\ModelBuilderExtensions.cs
	namespace 	
Melad
 
. 
Common 
. 
Infra 
. 
	SqlServer &
;& '
public 
class 
HumanizerPluralizer  
:! "
IPluralizer# .
{ 
public		 

string		 
	Pluralize		 
(		 
string		 "
name		# '
)		' (
=>

 

name

 
?

 
.

 
	Pluralize

 
(

 $
inputIsKnownToBeSingular

 3
:

3 4
false

5 :
)

: ;
!

; <
;

< =
public 

string 
Singularize 
( 
string $
name% )
)) *
=> 

name 
? 
. 
Singularize 
( "
inputIsKnownToBePlural 3
:3 4
false5 :
): ;
!; <
;< =
} 
public 
static 
class "
ModelBuilderExtensions *
{ 
public 

static 
void /
#AddSingularizingTableNameConvention :
(: ;
this; ?
ModelBuilder@ L
modelBuilderM Y
)Y Z
{ 
IPluralizer 

pluralizer 
=  
new! $
HumanizerPluralizer% 8
(8 9
)9 :
;: ;
foreach 
( 
IMutableEntityType #

entityType$ .
in/ 1
modelBuilder2 >
.> ?
Model? D
.D E
GetEntityTypesE S
(S T
)T U
)U V
{ 	
string 
	tableName 
= 

entityType )
.) *
GetTableName* 6
(6 7
)7 8
!8 9
;9 :

entityType 
. 
SetTableName #
(# $

pluralizer$ .
.. /
Singularize/ :
(: ;
	tableName; D
)D E
)E F
;F G
} 	
} 
public$$ 

static$$ 
void$$ ,
 AddSequentialGuidForIdConvention$$ 7
($$7 8
this$$8 <
ModelBuilder$$= I
modelBuilder$$J V
)$$V W
{%% 
modelBuilder&& 
.&& (
AddDefaultValueSqlConvention&& 1
(&&1 2
$str&&2 6
,&&6 7
typeof&&8 >
(&&> ?
Guid&&? C
)&&C D
,&&D E
$str&&F Y
)&&Y Z
;&&Z [
}'' 
public00 

static00 
void00 (
AddDefaultValueSqlConvention00 3
(003 4
this004 8
ModelBuilder009 E
modelBuilder00F R
,00R S
string00T Z
propertyName00[ g
,00g h
Type00i m
propertyType00n z
,00z {
string	00| Ç
defaultValueSql
00É í
)
00í ì
{11 
foreach22 
(22 
IMutableEntityType22 #

entityType22$ .
in22/ 1
modelBuilder222 >
.22> ?
Model22? D
.22D E
GetEntityTypes22E S
(22S T
)22T U
)22U V
{33 	
IMutableProperty44 
property44 %
=44& '

entityType44( 2
.442 3
GetProperties443 @
(44@ A
)44A B
.44B C
SingleOrDefault44C R
(44R S
p44S T
=>44U W
p44X Y
.44Y Z
Name44Z ^
.44^ _
Equals44_ e
(44e f
propertyName44f r
,44r s
StringComparison	44t Ñ
.
44Ñ Ö
OrdinalIgnoreCase
44Ö ñ
)
44ñ ó
)
44ó ò
!
44ò ô
;
44ô ö
if55 
(55 
property55 
!=55 
null55  
&&55! #
property55$ ,
.55, -
ClrType55- 4
==555 7
propertyType558 D
)55D E
property66 
.66 
SetDefaultValueSql66 +
(66+ ,
defaultValueSql66, ;
)66; <
;66< =
}77 	
}88 
public>> 

static>> 
void>> /
#AddRestrictDeleteBehaviorConvention>> :
(>>: ;
this>>; ?
ModelBuilder>>@ L
modelBuilder>>M Y
)>>Y Z
{?? 
var@@ 

cascadeFKs@@ 
=@@ 
modelBuilder@@ %
.@@% &
Model@@& +
.@@+ ,
GetEntityTypes@@, :
(@@: ;
)@@; <
.AA 

SelectManyAA 
(AA 
tAA 
=>AA 
tAA 
.AA 
GetForeignKeysAA -
(AA- .
)AA. /
)AA/ 0
.BB 
WhereBB 
(BB 
fkBB 
=>BB 
!BB 
fkBB 
.BB 
IsOwnershipBB (
&&BB) +
fkBB, .
.BB. /
DeleteBehaviorBB/ =
==BB> @
DeleteBehaviorBBA O
.BBO P
CascadeBBP W
)BBW X
;BBX Y
foreachCC 
(CC 
varCC 
fkCC 
inCC 

cascadeFKsCC %
)CC% &
fkDD 
.DD 
DeleteBehaviorDD 
=DD 
DeleteBehaviorDD  .
.DD. /
RestrictDD/ 7
;DD7 8
}EE 
publicLL 

staticLL 
voidLL +
RegisterEntityTypeConfigurationLL 6
(LL6 7
thisLL7 ;
ModelBuilderLL< H
modelBuilderLLI U
,LLU V
paramsLLW ]
AssemblyLL^ f
[LLf g
]LLg h

assembliesLLi s
)LLs t
{MM 
varNN 
applyGenericMethodNN 
=NN  
typeofNN! '
(NN' (
ModelBuilderNN( 4
)NN4 5
.NN5 6

GetMethodsNN6 @
(NN@ A
)NNA B
.OO 
FirstOO 
(OO 
mOO 
=>OO 
mOO 
.OO 
NameOO 
==OO !
nameofOO" (
(OO( )
ModelBuilderOO) 5
.OO5 6
ApplyConfigurationOO6 H
)OOH I
)OOI J
;OOJ K
varQQ 
typesQQ 
=QQ 

assembliesQQ 
.QQ 

SelectManyQQ )
(QQ) *
aQQ* +
=>QQ, .
aQQ/ 0
.QQ0 1
GetExportedTypesQQ1 A
(QQA B
)QQB C
)QQC D
.RR 
WhereRR 
(RR 
cRR 
=>RR 
cRR 
.RR 
IsClassRR !
&&RR" $
!RR% &
cRR& '
.RR' (

IsAbstractRR( 2
&&RR3 5
cRR6 7
.RR7 8
IsPublicRR8 @
)RR@ A
;RRA B
foreachTT 
(TT 
varTT 
typeTT 
inTT 
typesTT "
)TT" #
foreachUU 
(UU 
varUU 
ifaceUU 
inUU 
typeUU "
.UU" #
GetInterfacesUU# 0
(UU0 1
)UU1 2
)UU2 3
ifVV 
(VV 
ifaceVV 
.VV $
IsConstructedGenericTypeVV .
&&VV/ 1
ifaceWW 
.WW $
GetGenericTypeDefinitionWW .
(WW. /
)WW/ 0
==WW1 3
typeofWW4 :
(WW: ;$
IEntityTypeConfigurationWW; S
<WWS T
>WWT U
)WWU V
)WWV W
{XX 
varYY 
applyConcreteMethodYY '
=YY( )
applyGenericMethodYY* <
.YY< =
MakeGenericMethodYY= N
(YYN O
ifaceYYO T
.YYT U 
GenericTypeArgumentsYYU i
[YYi j
$numYYj k
]YYk l
)YYl m
;YYm n
applyConcreteMethodZZ #
.ZZ# $
InvokeZZ$ *
(ZZ* +
modelBuilderZZ+ 7
,ZZ7 8
newZZ9 <
[ZZ< =
]ZZ= >
{ZZ? @
	ActivatorZZA J
.ZZJ K
CreateInstanceZZK Y
(ZZY Z
typeZZZ ^
)ZZ^ _
}ZZ` a
)ZZa b
;ZZb c
}[[ 
}\\ 
publicdd 

staticdd 
voiddd 
RegisterAllEntitiesdd *
<dd* +
BaseTypedd+ 3
>dd3 4
(dd4 5
thisdd5 9
ModelBuilderdd: F
modelBuilderddG S
,ddS T
paramsddU [
Assemblydd\ d
[ddd e
]dde f

assembliesddg q
)ddq r
{ee 
varff 
typesff 
=ff 

assembliesff 
.ff 

SelectManyff )
(ff) *
aff* +
=>ff, .
aff/ 0
.ff0 1
GetExportedTypesff1 A
(ffA B
)ffB C
)ffC D
.gg 
Wheregg 
(gg 
cgg 
=>gg 
cgg 
.gg 
IsClassgg !
&&gg" $
!gg% &
cgg& '
.gg' (

IsAbstractgg( 2
&&gg3 5
cgg6 7
.gg7 8
IsPublicgg8 @
&&ggA C
typeofggD J
(ggJ K
BaseTypeggK S
)ggS T
.ggT U
IsAssignableFromggU e
(gge f
cggf g
)ggg h
)ggh i
;ggi j
foreachhh 
(hh 
varhh 
typehh 
inhh 
typeshh "
)hh" #
modelBuilderii 
.ii 
Entityii 
(ii  
typeii  $
)ii$ %
;ii% &
}jj 
}kk Œ
]C:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\AddCustomApiVersioning.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
static 
class 
CustomApiVersioning '
{ 
public 

static 
IServiceCollection $"
AddCustomApiVersioning% ;
(; <
this< @
IServiceCollectionA S
servicesT \
)\ ]
{ 
services 
. 
AddApiVersioning !
(! "
options" )
=>* ,
{ 	
options 
. /
#AssumeDefaultVersionWhenUnspecified 7
=8 9
true: >
;> ?
options 
. 
DefaultApiVersion %
=& '
new( +

ApiVersion, 6
(6 7
$num7 8
,8 9
$num: ;
); <
;< =
options 
. 
ReportApiVersions %
=& '
true( ,
;, -
options!! 
.!! 
ApiVersionReader!! $
=!!% &
new!!' *&
UrlSegmentApiVersionReader!!+ E
(!!E F
)!!F G
;!!G H
}&& 	
)&&	 

;&&
 
return'' 
services'' 
;'' 
}(( 
public** 

static** 
IServiceCollection** $
AddMinimalMvc**% 2
(**2 3
this**3 7
IServiceCollection**8 J
services**K S
)**S T
{++ 
services-- 
.-- 
AddControllers-- 
(--  
options--  '
=>--( *
{.. 	
options// 
.// 
Filters// 
.// 
Add// 
(//  
new//  #
AuthorizeFilter//$ 3
(//3 4
)//4 5
)//5 6
;//6 7
options00 
.00 ,
 SuppressAsyncSuffixInActionNames00 4
=005 6
false007 <
;00< =
}77 	
)77	 

.77
 
AddNewtonsoftJson77 
(77 
option77 #
=>77$ &
{88 	
option99 
.99 
SerializerSettings99 %
.99% &

Converters99& 0
.990 1
Add991 4
(994 5
new995 8
StringEnumConverter999 L
(99L M
)99M N
)99N O
;99O P
option:: 
.:: 
SerializerSettings:: %
.::% &!
ReferenceLoopHandling::& ;
=::< =!
ReferenceLoopHandling::> S
.::S T
Ignore::T Z
;::Z [
}== 	
)==	 

;==
 
services>> 
.>> *
AddSwaggerGenNewtonsoftSupport>> /
(>>/ 0
)>>0 1
;>>1 2
returnhh 
serviceshh 
;hh 
}ii 
}jj æY
PC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\ApiResult.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
class 
	ApiResult 
{ 
public		 

	ApiResult		 
(		 
bool		 
	isSuccess		 #
,		# $
ApiResultStatusCode		% 8

statusCode		9 C
,		C D
string		E K
message		L S
=		T U
null		V Z
!		Z [
)		[ \
{

 
	IsSuccess 
= 
	isSuccess 
; 
Message 
= 
message 
?? 

statusCode '
.' (
	ToDisplay( 1
(1 2
)2 3
;3 4
} 
public 

bool 
	IsSuccess 
{ 
get 
;  
set! $
;$ %
}& '
[ 
JsonProperty 
( 
NullValueHandling #
=$ %
NullValueHandling& 7
.7 8
Ignore8 >
)> ?
]? @
public 

string 
Message 
{ 
get 
;  
set! $
;$ %
}& '
public 

static 
implicit 
operator #
	ApiResult$ -
(- .
OkResult. 6
result7 =
)= >
{ 
return 
new 
	ApiResult 
( 
true !
,! "
ApiResultStatusCode# 6
.6 7
Success7 >
)> ?
;? @
} 
public 

static 
implicit 
operator #
	ApiResult$ -
(- .
BadRequestResult. >
result? E
)E F
{ 
return 
new 
	ApiResult 
( 
false "
," #
ApiResultStatusCode$ 7
.7 8

BadRequest8 B
)B C
;C D
} 
public   

static   
implicit   
operator   #
	ApiResult  $ -
(  - ."
BadRequestObjectResult  . D
result  E K
)  K L
{!! 
var"" 
message"" 
="" 
result"" 
."" 
Value"" "
?""" #
.""# $
ToString""$ ,
("", -
)""- .
;"". /
if## 

(## 
result## 
.## 
Value## 
is## 
SerializableError## -
errors##. 4
)##4 5
{$$ 	
var%% 
errorMessages%% 
=%% 
errors%%  &
.%%& '

SelectMany%%' 1
(%%1 2
p%%2 3
=>%%4 6
(%%7 8
string%%8 >
[%%> ?
]%%? @
)%%@ A
p%%A B
.%%B C
Value%%C H
)%%H I
.%%I J
Distinct%%J R
(%%R S
)%%S T
;%%T U
message&& 
=&& 
string&& 
.&& 
Join&& !
(&&! "
$str&&" '
,&&' (
errorMessages&&) 6
)&&6 7
;&&7 8
}'' 	
return)) 
new)) 
	ApiResult)) 
()) 
false)) "
,))" #
ApiResultStatusCode))$ 7
.))7 8

BadRequest))8 B
,))B C
message))D K
!))K L
)))L M
;))M N
}** 
public,, 

static,, 
implicit,, 
operator,, #
	ApiResult,,$ -
(,,- .
ContentResult,,. ;
result,,< B
),,B C
{-- 
return.. 
new.. 
	ApiResult.. 
(.. 
true.. !
,..! "
ApiResultStatusCode..# 6
...6 7
Success..7 >
,..> ?
result..@ F
...F G
Content..G N
!..N O
)..O P
;..P Q
}// 
public11 

static11 
implicit11 
operator11 #
	ApiResult11$ -
(11- .
NotFoundResult11. <
result11= C
)11C D
{22 
return33 
new33 
	ApiResult33 
(33 
false33 "
,33" #
ApiResultStatusCode33$ 7
.337 8
NotFound338 @
)33@ A
;33A B
}44 
}77 
public99 
class99 
	ApiResult99 
<99 
TData99 
>99 
:99 
	ApiResult99  )
where:: 	
TData::
 
::: 
class:: 
{;; 
public<< 

	ApiResult<< 
(<< 
bool<< 
	isSuccess<< #
,<<# $
ApiResultStatusCode<<% 8

statusCode<<9 C
,<<C D
TData<<E J
data<<K O
,<<O P
string<<Q W
message<<X _
=<<` a
null<<b f
!<<f g
)<<g h
:== 	
base==
 
(== 
	isSuccess== 
,== 

statusCode== $
,==$ %
message==& -
)==- .
{>> 
Data?? 
=?? 
data?? 
;?? 
}@@ 
publicBB 

TDataBB 
DataBB 
{BB 
getBB 
;BB 
setBB  
;BB  !
}BB" #
publicFF 

staticFF 
implicitFF 
operatorFF #
	ApiResultFF$ -
<FF- .
TDataFF. 3
>FF3 4
(FF4 5
TDataFF5 :
dataFF; ?
)FF? @
{GG 
returnHH 
newHH 
	ApiResultHH 
<HH 
TDataHH "
>HH" #
(HH# $
trueHH$ (
,HH( )
ApiResultStatusCodeHH* =
.HH= >
SuccessHH> E
,HHE F
dataHHG K
)HHK L
;HHL M
}II 
publicKK 

staticKK 
implicitKK 
operatorKK #
	ApiResultKK$ -
<KK- .
TDataKK. 3
>KK3 4
(KK4 5
OkResultKK5 =
resultKK> D
)KKD E
{LL 
returnMM 
newMM 
	ApiResultMM 
<MM 
TDataMM "
>MM" #
(MM# $
trueMM$ (
,MM( )
ApiResultStatusCodeMM* =
.MM= >
SuccessMM> E
,MME F
nullMMG K
!MMK L
)MML M
;MMM N
}NN 
publicPP 

staticPP 
implicitPP 
operatorPP #
	ApiResultPP$ -
<PP- .
TDataPP. 3
>PP3 4
(PP4 5
OkObjectResultPP5 C
resultPPD J
)PPJ K
{QQ 
returnRR 
newRR 
	ApiResultRR 
<RR 
TDataRR "
>RR" #
(RR# $
trueRR$ (
,RR( )
ApiResultStatusCodeRR* =
.RR= >
SuccessRR> E
,RRE F
(RRG H
TDataRRH M
)RRM N
resultRRN T
.RRT U
ValueRRU Z
!RRZ [
)RR[ \
;RR\ ]
}SS 
publicUU 

staticUU 
implicitUU 
operatorUU #
	ApiResultUU$ -
<UU- .
TDataUU. 3
>UU3 4
(UU4 5
BadRequestResultUU5 E
resultUUF L
)UUL M
{VV 
returnWW 
newWW 
	ApiResultWW 
<WW 
TDataWW "
>WW" #
(WW# $
falseWW$ )
,WW) *
ApiResultStatusCodeWW+ >
.WW> ?

BadRequestWW? I
,WWI J
nullWWK O
!WWO P
)WWP Q
;WWQ R
}XX 
publicZZ 

staticZZ 
implicitZZ 
operatorZZ #
	ApiResultZZ$ -
<ZZ- .
TDataZZ. 3
>ZZ3 4
(ZZ4 5"
BadRequestObjectResultZZ5 K
resultZZL R
)ZZR S
{[[ 
var\\ 
message\\ 
=\\ 
result\\ 
.\\ 
Value\\ "
?\\" #
.\\# $
ToString\\$ ,
(\\, -
)\\- .
;\\. /
if]] 

(]] 
result]] 
.]] 
Value]] 
is]] 
SerializableError]] -
errors]]. 4
)]]4 5
{^^ 	
var__ 
errorMessages__ 
=__ 
errors__  &
.__& '

SelectMany__' 1
(__1 2
p__2 3
=>__4 6
(__7 8
string__8 >
[__> ?
]__? @
)__@ A
p__A B
.__B C
Value__C H
)__H I
.__I J
Distinct__J R
(__R S
)__S T
;__T U
message`` 
=`` 
string`` 
.`` 
Join`` !
(``! "
$str``" '
,``' (
errorMessages``) 6
)``6 7
;``7 8
}aa 	
returncc 
newcc 
	ApiResultcc 
<cc 
TDatacc "
>cc" #
(cc# $
falsecc$ )
,cc) *
ApiResultStatusCodecc+ >
.cc> ?

BadRequestcc? I
,ccI J
nullccK O
!ccO P
,ccP Q
messageccR Y
!ccY Z
)ccZ [
;cc[ \
}dd 
publicff 

staticff 
implicitff 
operatorff #
	ApiResultff$ -
<ff- .
TDataff. 3
>ff3 4
(ff4 5
ContentResultff5 B
resultffC I
)ffI J
{gg 
returnhh 
newhh 
	ApiResulthh 
<hh 
TDatahh "
>hh" #
(hh# $
truehh$ (
,hh( )
ApiResultStatusCodehh* =
.hh= >
Successhh> E
,hhE F
nullhhG K
!hhK L
,hhL M
resulthhN T
.hhT U
ContenthhU \
!hh\ ]
)hh] ^
;hh^ _
}ii 
publickk 

statickk 
implicitkk 
operatorkk #
	ApiResultkk$ -
<kk- .
TDatakk. 3
>kk3 4
(kk4 5
NotFoundResultkk5 C
resultkkD J
)kkJ K
{ll 
returnmm 
newmm 
	ApiResultmm 
<mm 
TDatamm "
>mm" #
(mm# $
falsemm$ )
,mm) *
ApiResultStatusCodemm+ >
.mm> ?
NotFoundmm? G
,mmG H
nullmmI M
!mmM N
)mmN O
;mmO P
}nn 
publicpp 

staticpp 
implicitpp 
operatorpp #
	ApiResultpp$ -
<pp- .
TDatapp. 3
>pp3 4
(pp4 5 
NotFoundObjectResultpp5 I
resultppJ P
)ppP Q
{qq 
returnrr 
newrr 
	ApiResultrr 
<rr 
TDatarr "
>rr" #
(rr# $
falserr$ )
,rr) *
ApiResultStatusCoderr+ >
.rr> ?
NotFoundrr? G
,rrG H
(rrI J
TDatarrJ O
)rrO P
resultrrP V
.rrV W
ValuerrW \
!rr\ ]
)rr] ^
;rr^ _
}ss 
}vv ÚG
_C:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\ApiResultFilterAttribute.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
class $
ApiResultFilterAttribute %
:& '!
ActionFilterAttribute( =
{ 
public 

override 
void 
OnResultExecuting *
(* +"
ResultExecutingContext+ A
contextB I
)I J
{		 
if

 

(

 
context

 
.

 
Result

 
is

 
OkObjectResult

 ,
okObjectResult

- ;
)

; <
{ 	
var 
	apiResult 
= 
new 
	ApiResult  )
<) *
object* 0
>0 1
(1 2
true2 6
,6 7
ApiResultStatusCode8 K
.K L
SuccessL S
,S T
okObjectResultU c
.c d
Valued i
!i j
)j k
;k l
context 
. 
Result 
= 
new  

JsonResult! +
(+ ,
	apiResult, 5
)5 6
{7 8

StatusCode9 C
=D E
okObjectResultF T
.T U

StatusCodeU _
}` a
;a b
} 	
else 
if 
( 
context 
. 
Result 
is  "
OkResult# +
okResult, 4
)4 5
{ 	
var 
	apiResult 
= 
new 
	ApiResult  )
() *
true* .
,. /
ApiResultStatusCode0 C
.C D
SuccessD K
)K L
;L M
context 
. 
Result 
= 
new  

JsonResult! +
(+ ,
	apiResult, 5
)5 6
{7 8

StatusCode9 C
=D E
okResultF N
.N O

StatusCodeO Y
}Z [
;[ \
} 	
else 
if 
( 
context 
. 
Result 
is  "
ObjectResult# /"
badRequestObjectResult0 F
&&G I"
badRequestObjectResultJ `
.` a

StatusCodea k
==l n
$numo r
)r s
{ 	
string 
message 
= 
null !
!! "
;" #
switch 
( "
badRequestObjectResult *
.* +
Value+ 0
)0 1
{ 
case $
ValidationProblemDetails -$
validationProblemDetails. F
:F G
var 
errorMessages %
=& '$
validationProblemDetails( @
.@ A
ErrorsA G
.G H

SelectManyH R
(R S
pS T
=>U W
pX Y
.Y Z
ValueZ _
)_ `
.` a
Distincta i
(i j
)j k
;k l
message 
= 
string $
.$ %
Join% )
() *
$str* /
,/ 0
errorMessages1 >
)> ?
;? @
break 
; 
case 
SerializableError &
errors' -
:- .
var 
errorMessages2 &
=' (
errors) /
./ 0

SelectMany0 :
(: ;
p; <
=>= ?
(@ A
stringA G
[G H
]H I
)I J
pJ K
.K L
ValueL Q
)Q R
.R S
DistinctS [
([ \
)\ ]
;] ^
message   
=   
string   $
.  $ %
Join  % )
(  ) *
$str  * /
,  / 0
errorMessages2  1 ?
)  ? @
;  @ A
break!! 
;!! 
case"" 
var"" 
value"" 
when"" #
value""$ )
!=""* ,
null""- 1
&&""2 4
!""5 6
(""6 7
value""7 <
is""= ?
ProblemDetails""@ N
)""N O
:""O P
message## 
=##  !"
badRequestObjectResult##" 8
?##8 9
.##9 :
Value##: ?
?##? @
.##@ A
ToString##A I
(##I J
)##J K
!##K L
;##L M
break$$ 
;$$ 
}%% 
var'' 
	apiResult'' 
='' 
new'' 
	ApiResult''  )
('') *
false''* /
,''/ 0
ApiResultStatusCode''1 D
.''D E

BadRequest''E O
,''O P
message''Q X
!''X Y
)''Y Z
;''Z [
context(( 
.(( 
Result(( 
=(( 
new((  

JsonResult((! +
(((+ ,
	apiResult((, 5
)((5 6
{((7 8

StatusCode((9 C
=((D E
ExceptionEnum((F S
.((S T$
ModelValidationException((T l
}((m n
;((n o
})) 	
else** 
if** 
(** 
context** 
.** 
Result** 
is**  "
ObjectResult**# / 
notFoundObjectResult**0 D
&&**E G 
notFoundObjectResult**H \
.**\ ]

StatusCode**] g
==**h j
$num**k n
)**n o
{++ 	
string,, 
message,, 
=,, 
null,, !
!,,! "
;,," #
if-- 
(--  
notFoundObjectResult-- $
.--$ %
Value--% *
!=--+ -
null--. 2
&&--3 5
!--6 7
(--7 8 
notFoundObjectResult--8 L
.--L M
Value--M R
is--S U
ProblemDetails--V d
)--d e
)--e f
message.. 
=..  
notFoundObjectResult.. .
.... /
Value../ 4
...4 5
ToString..5 =
(..= >
)..> ?
!..? @
;..@ A
var00 
	apiResult00 
=00 
new00 
	ApiResult00  )
(00) *
false00* /
,00/ 0
ApiResultStatusCode001 D
.00D E
NotFound00E M
,00M N
message00O V
!00V W
)00W X
;00X Y
context11 
.11 
Result11 
=11 
new11  

JsonResult11! +
(11+ ,
	apiResult11, 5
)115 6
{117 8

StatusCode119 C
=11D E 
notFoundObjectResult11F Z
.11Z [

StatusCode11[ e
}11f g
;11g h
}22 	
else33 
if33 
(33 
context33 
.33 
Result33 
is33  "
ContentResult33# 0
contentResult331 >
)33> ?
{44 	
var55 
	apiResult55 
=55 
new55 
	ApiResult55  )
(55) *
true55* .
,55. /
ApiResultStatusCode550 C
.55C D
Success55D K
,55K L
contentResult55M Z
.55Z [
Content55[ b
!55b c
)55c d
;55d e
context66 
.66 
Result66 
=66 
new66  

JsonResult66! +
(66+ ,
	apiResult66, 5
)665 6
{667 8

StatusCode669 C
=66D E
contentResult66F S
.66S T

StatusCode66T ^
}66_ `
;66` a
}77 	
else88 
if88 
(88 
context88 
.88 
Result88 
is88  "
ObjectResult88# /
objectResult880 <
&&88= ?
objectResult88@ L
.88L M

StatusCode88M W
==88X Z
null88[ _
&&99= ?
!99@ A
(99A B
objectResult99B N
.99N O
Value99O T
is99U W
	ApiResult99X a
)99a b
)99b c
{:: 	
var;; 
	apiResult;; 
=;; 
new;; 
	ApiResult;;  )
<;;) *
object;;* 0
>;;0 1
(;;1 2
true;;2 6
,;;6 7
ApiResultStatusCode;;8 K
.;;K L
Success;;L S
,;;S T
objectResult;;U a
.;;a b
Value;;b g
!;;g h
);;h i
;;;i j
context<< 
.<< 
Result<< 
=<< 
new<<  

JsonResult<<! +
(<<+ ,
	apiResult<<, 5
)<<5 6
{<<7 8

StatusCode<<9 C
=<<D E
objectResult<<F R
.<<R S

StatusCode<<S ]
}<<^ _
;<<_ `
}== 	
base?? 
.?? 
OnResultExecuting?? 
(?? 
context?? &
)??& '
;??' (
}@@ 
}AA ©

ZC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\ApiResultStatusCode.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
enum 
ApiResultStatusCode 
{ 
[ 
Display 
( 
Name 
= 
$str /
)/ 0
]0 1
Success2 9
=: ;
$num< ?
,? @
[ 
Display 
( 
Name 
= 
$str /
)/ 0
]0 1
ServerError2 =
=> ?
$num@ C
,C D
[		 
Display		 
(		 
Name		 
=		 
$str		 5
)		5 6
]		6 7

BadRequest		8 B
=		C D
$num		E H
,		H I
[

 
Display

 
(

 
Name

 
=

 
$str

 
)

 
]

  
NotFound

! )
=

* +
$num

, /
,

/ 0
[ 
Display 
( 
Name 
= 
$str %
)% &
]& '
UnAuthorized( 4
=5 6
$num7 :
} ø?
SC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\AppException.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
class 
AppException 
: 
	Exception %
{ 
public 

AppException 
( 
) 
: 	
this
 
( 
ApiResultStatusCode "
." #
ServerError# .
). /
{		 
}

 
public 

AppException 
( 
ApiResultStatusCode +

statusCode, 6
)6 7
: 	
this
 
( 

statusCode 
, 
null 
!  
)  !
{ 
} 
public 

AppException 
( 
string 
message &
)& '
: 	
this
 
( 
ApiResultStatusCode "
." #
ServerError# .
,. /
message0 7
)7 8
{ 
} 
public 

AppException 
( 
ApiResultStatusCode +

statusCode, 6
,6 7
string8 >
message? F
)F G
: 	
this
 
( 

statusCode 
, 
message "
," #
HttpStatusCode$ 2
.2 3
InternalServerError3 F
)F G
{ 
} 
public 

AppException 
( 
string 
message &
,& '
object( .
additionalData/ =
)= >
: 	
this
 
( 
ApiResultStatusCode "
." #
ServerError# .
,. /
message0 7
,7 8
additionalData9 G
)G H
{ 
} 
public   

AppException   
(   
ApiResultStatusCode   +

statusCode  , 6
,  6 7
object  8 >
additionalData  ? M
)  M N
:!! 	
this!!
 
(!! 

statusCode!! 
,!! 
null!! 
!!!  
,!!  !
additionalData!!" 0
)!!0 1
{"" 
}## 
public%% 

AppException%% 
(%% 
ApiResultStatusCode%% +

statusCode%%, 6
,%%6 7
string%%8 >
message%%? F
,%%F G
object%%H N
additionalData%%O ]
)%%] ^
:&& 	
this&&
 
(&& 

statusCode&& 
,&& 
message&& "
,&&" #
HttpStatusCode&&$ 2
.&&2 3
InternalServerError&&3 F
,&&F G
additionalData&&H V
)&&V W
{'' 
}(( 
public** 

AppException** 
(** 
ApiResultStatusCode** +

statusCode**, 6
,**6 7
string**8 >
message**? F
,**F G
HttpStatusCode**H V
httpStatusCode**W e
)**e f
:++ 	
this++
 
(++ 

statusCode++ 
,++ 
message++ "
,++" #
httpStatusCode++$ 2
,++2 3
null++4 8
!++8 9
)++9 :
{,, 
}-- 
public// 

AppException// 
(// 
ApiResultStatusCode// +

statusCode//, 6
,//6 7
string//8 >
message//? F
,//F G
HttpStatusCode//H V
httpStatusCode//W e
,//e f
object00 
additionalData00 
)00 
:11 	
this11
 
(11 

statusCode11 
,11 
message11 "
,11" #
httpStatusCode11$ 2
,112 3
null114 8
!118 9
,119 :
additionalData11; I
)11I J
{22 
}33 
public55 

AppException55 
(55 
string55 
message55 &
,55& '
	Exception55( 1
	exception552 ;
)55; <
:66 	
this66
 
(66 
ApiResultStatusCode66 "
.66" #
ServerError66# .
,66. /
message660 7
,667 8
	exception669 B
)66B C
{77 
}88 
public:: 

AppException:: 
(:: 
string:: 
message:: &
,::& '
	Exception::( 1
	exception::2 ;
,::; <
object::= C
additionalData::D R
)::R S
:;; 	
this;;
 
(;; 
ApiResultStatusCode;; "
.;;" #
ServerError;;# .
,;;. /
message;;0 7
,;;7 8
	exception;;9 B
,;;B C
additionalData;;D R
);;R S
{<< 
}== 
public?? 

AppException?? 
(?? 
ApiResultStatusCode?? +

statusCode??, 6
,??6 7
string??8 >
message??? F
,??F G
	Exception??H Q
	exception??R [
)??[ \
:@@ 	
this@@
 
(@@ 

statusCode@@ 
,@@ 
message@@ "
,@@" #
HttpStatusCode@@$ 2
.@@2 3
InternalServerError@@3 F
,@@F G
	exception@@H Q
)@@Q R
{AA 
}BB 
publicDD 

AppExceptionDD 
(DD 
ApiResultStatusCodeDD +

statusCodeDD, 6
,DD6 7
stringDD8 >
messageDD? F
,DDF G
	ExceptionDDH Q
	exceptionDDR [
,DD[ \
objectDD] c
additionalDataDDd r
)DDr s
:EE 	
thisEE
 
(EE 

statusCodeEE 
,EE 
messageEE "
,EE" #
HttpStatusCodeEE$ 2
.EE2 3
InternalServerErrorEE3 F
,EEF G
	exceptionEEH Q
,EEQ R
additionalDataEES a
)EEa b
{FF 
}GG 
publicII 

AppExceptionII 
(II 
ApiResultStatusCodeII +

statusCodeII, 6
,II6 7
stringII8 >
messageII? F
,IIF G
HttpStatusCodeIIH V
httpStatusCodeIIW e
,IIe f
	ExceptionJJ 
	exceptionJJ 
)JJ 
:KK 	
thisKK
 
(KK 

statusCodeKK 
,KK 
messageKK "
,KK" #
httpStatusCodeKK$ 2
,KK2 3
	exceptionKK4 =
,KK= >
nullKK? C
!KKC D
)KKD E
{LL 
}MM 
publicOO 

AppExceptionOO 
(OO 
ApiResultStatusCodeOO +

statusCodeOO, 6
,OO6 7
stringOO8 >
messageOO? F
,OOF G
HttpStatusCodeOOH V
httpStatusCodeOOW e
,OOe f
	ExceptionPP 
	exceptionPP 
,PP 
objectPP #
additionalDataPP$ 2
)PP2 3
:QQ 	
baseQQ
 
(QQ 
messageQQ 
,QQ 
	exceptionQQ !
)QQ! "
{RR 
ApiStatusCodeSS 
=SS 

statusCodeSS "
;SS" #
HttpStatusCodeTT 
=TT 
httpStatusCodeTT '
;TT' (
AdditionalDataUU 
=UU 
additionalDataUU '
;UU' (
}VV 
publicXX 

HttpStatusCodeXX 
HttpStatusCodeXX (
{XX) *
getXX+ .
;XX. /
setXX0 3
;XX3 4
}XX5 6
publicYY 

ApiResultStatusCodeYY 
ApiStatusCodeYY ,
{YY- .
getYY/ 2
;YY2 3
setYY4 7
;YY7 8
}YY9 :
publicZZ 

objectZZ 
AdditionalDataZZ  
{ZZ! "
getZZ# &
;ZZ& '
setZZ( +
;ZZ+ ,
}ZZ- .
}[[ ”
QC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\AppSetting.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
class 

AppSetting 
{ 
public 


JwtSetting 

JwtSetting  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
public 

IdentitySetting 
IdentitySetting *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
null; ?
!? @
;@ A
} 
public 
record 
IdentitySetting 
{		 
public

 

bool

  
PasswordRequireDigit

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 

int "
PasswordRequiredLength %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 

bool *
PasswordRequireNonAlphanumeric .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 

bool $
PasswordRequireUppercase (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 

bool $
PasswordRequireLowercase (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 

bool 
RequireUniqueEmail "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
public 
record 

JwtSetting 
{ 
public 

string 
	SecretKey 
{ 
get !
;! "
set# &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public 

string 

EncryptKey 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public 

string 
Issuer 
{ 
get 
; 
set  #
;# $
}% &
=' (
null) -
!- .
;. /
public 

string 
Audience 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 

int 
NotBeforeMinutes 
{  !
get" %
;% &
set' *
;* +
}, -
public 

int 
ExpirationMinutes  
{! "
get# &
;& '
set( +
;+ ,
}- .
} ˝
ZC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\BadRequestException.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
class 
BadRequestException  
:! "
AppException# /
{ 
public 

BadRequestException 
( 
)  
: 	
base
 
( 
ApiResultStatusCode "
." #

BadRequest# -
,- .
HttpStatusCode/ =
.= >

BadRequest> H
)H I
{		 
}

 
public 

BadRequestException 
( 
string %
message& -
)- .
: 	
base
 
( 
ApiResultStatusCode "
." #

BadRequest# -
,- .
message/ 6
,6 7
HttpStatusCode8 F
.F G

BadRequestG Q
)Q R
{ 
} 
public 

BadRequestException 
( 
object %
additionalData& 4
)4 5
: 	
base
 
( 
ApiResultStatusCode "
." #

BadRequest# -
,- .
null/ 3
!3 4
,4 5
HttpStatusCode6 D
.D E

BadRequestE O
,O P
additionalDataQ _
)_ `
{ 
} 
public 

BadRequestException 
( 
string %
message& -
,- .
object/ 5
additionalData6 D
)D E
: 	
base
 
( 
ApiResultStatusCode "
." #

BadRequest# -
,- .
message/ 6
,6 7
HttpStatusCode8 F
.F G

BadRequestG Q
,Q R
additionalDataS a
)a b
{ 
} 
public 

BadRequestException 
( 
string %
message& -
,- .
	Exception/ 8
	exception9 B
)B C
: 	
base
 
( 
ApiResultStatusCode "
." #

BadRequest# -
,- .
message/ 6
,6 7
	exception8 A
,A B
HttpStatusCodeC Q
.Q R

BadRequestR \
)\ ]
{ 
} 
public   

BadRequestException   
(   
string   %
message  & -
,  - .
	Exception  / 8
	exception  9 B
,  B C
object  D J
additionalData  K Y
)  Y Z
:!! 	
base!!
 
(!! 
ApiResultStatusCode!! "
.!!" #

BadRequest!!# -
,!!- .
message!!/ 6
,!!6 7
HttpStatusCode!!8 F
.!!F G

BadRequest!!G Q
,!!Q R
	exception!!S \
,!!\ ]
additionalData!!^ l
)!!l m
{"" 
}## 
}$$ ‰
UC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\BaseController.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
[ 
Route 
( 
$str 8
)8 9
]9 :
[ 

ApiVersion 
( 
$str 
) 
] 
[		 
ApiController		 
]		 
[

 
ApiResultFilter

 
]

 
public 
class 
BaseController 
: 
ControllerBase ,
{ 
	protected 
readonly 
	IMediator  
	_mediator! *
;* +
	protected 
BaseController 
( 
	IMediator &
mediator' /
)/ 0
{ 
	_mediator 
= 
mediator 
; 
} 
} ÿZ
qC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\CustomExceptionHandlerMiddlewareExtensions.cs
	namespace

 	
Melad


 
.

 
Common

 
.

 
WebFramework

 #
;

# $
public 
static 
class 6
*CustomExceptionHandlerMiddlewareExtensions >
{ 
public 

static 
IApplicationBuilder %%
UseCustomExceptionHandler& ?
(? @
this@ D
IApplicationBuilderE X
builderY `
)` a
{ 
return 
builder 
. 
UseMiddleware $
<$ %,
 CustomExceptionHandlerMiddleware% E
>E F
(F G
)G H
;H I
} 
} 
public 
class ,
 CustomExceptionHandlerMiddleware -
{ 
private 
readonly 
IHostEnvironment %
_env& *
;* +
private 
readonly 
ILogger 
< ,
 CustomExceptionHandlerMiddleware =
>= >
_logger? F
;F G
private 
readonly 
RequestDelegate $
_next% *
;* +
public 
,
 CustomExceptionHandlerMiddleware +
(+ ,
RequestDelegate, ;
next< @
,@ A
IHostEnvironment 
env 
, 
ILogger 
< ,
 CustomExceptionHandlerMiddleware 0
>0 1
logger2 8
)8 9
{ 
_next 
= 
next 
; 
_env 
= 
env 
; 
_logger   
=   
logger   
;   
}!! 
public## 

async## 
Task## 
Invoke## 
(## 
HttpContext## (
context##) 0
)##0 1
{$$ 
string%% 
message%% 
=%% 
null%% 
!%% 
;%% 
var&& 
httpStatusCode&& 
=&& 
HttpStatusCode&& +
.&&+ ,
InternalServerError&&, ?
;&&? @
var'' 
apiStatusCode'' 
='' 
ApiResultStatusCode'' /
.''/ 0
ServerError''0 ;
;''; <
try(( 
{)) 	
await** 
_next** 
(** 
context** 
)**  
;**  !
}++ 	
catch,, 
(,, 
AppException,, 
	exception,, %
),,% &
{-- 	
_logger.. 
... 
LogError.. 
(.. 
	exception.. &
,..& '
	exception..( 1
...1 2
Message..2 9
)..9 :
;..: ;
httpStatusCode// 
=// 
	exception// &
.//& '
HttpStatusCode//' 5
;//5 6
apiStatusCode00 
=00 
	exception00 %
.00% &
ApiStatusCode00& 3
;003 4
var33 
dic33 
=33 
new33 

Dictionary33 $
<33$ %
string33% +
,33+ ,
string33- 3
>333 4
{44 
[55 
$str55 
]55 
=55 
	exception55  )
.55) *
Message55* 1
,551 2
[66 
$str66 
]66 
=66  
	exception66! *
.66* +

StackTrace66+ 5
!665 6
}77 
;77 
if88 
(88 
	exception88 
.88 
InnerException88 (
!=88) +
null88, 0
)880 1
{99 
dic:: 
.:: 
Add:: 
(:: 
$str:: 2
,::2 3
	exception::4 =
.::= >
InnerException::> L
.::L M
Message::M T
)::T U
;::U V
dic;; 
.;; 
Add;; 
(;; 
$str;; 3
,;;3 4
	exception;;5 >
.;;> ?
InnerException;;? M
.;;M N

StackTrace;;N X
!;;X Y
);;Y Z
;;;Z [
}<< 
if>> 
(>> 
	exception>> 
.>> 
AdditionalData>> (
!=>>) +
null>>, 0
)>>0 1
dic?? 
.?? 
Add?? 
(?? 
$str?? (
,??( )
JsonConvert??* 5
.??5 6
SerializeObject??6 E
(??E F
	exception??F O
.??O P
AdditionalData??P ^
)??^ _
)??_ `
;??` a
messageAA 
=AA 
JsonConvertAA !
.AA! "
SerializeObjectAA" 1
(AA1 2
dicAA2 5
)AA5 6
;AA6 7
awaitGG  
WriteToResponseAsyncGG &
(GG& '
)GG' (
;GG( )
}HH 	
catchII 
(II )
SecurityTokenExpiredExceptionII ,
	exceptionII- 6
)II6 7
{JJ 	
_loggerKK 
.KK 
LogErrorKK 
(KK 
	exceptionKK &
,KK& '
	exceptionKK( 1
.KK1 2
MessageKK2 9
)KK9 :
;KK: ;"
SetUnAuthorizeResponseLL "
(LL" #
	exceptionLL# ,
)LL, -
;LL- .
awaitMM  
WriteToResponseAsyncMM &
(MM& '
)MM' (
;MM( )
}NN 	
catchOO 
(OO '
UnauthorizedAccessExceptionOO *
	exceptionOO+ 4
)OO4 5
{PP 	
_loggerQQ 
.QQ 
LogErrorQQ 
(QQ 
	exceptionQQ &
,QQ& '
	exceptionQQ( 1
.QQ1 2
MessageQQ2 9
)QQ9 :
;QQ: ;"
SetUnAuthorizeResponseRR "
(RR" #
	exceptionRR# ,
)RR, -
;RR- .
awaitSS  
WriteToResponseAsyncSS &
(SS& '
)SS' (
;SS( )
}TT 	
catchUU 
(UU 
	ExceptionUU 
	exceptionUU "
)UU" #
{VV 	
IAppExceptionWW 
domainExceptionWW )
=WW* +
(WW, -
	exceptionWW- 6
asWW7 9
IAppExceptionWW: G
)WWG H
!WWH I
;WWI J
ifXX 
(XX 
domainExceptionXX 
!=XX  "
nullXX# '
)XX' (
{YY 
httpStatusCodeZZ 
=ZZ  
(ZZ! "
HttpStatusCodeZZ" 0
)ZZ0 1
domainExceptionZZ1 @
.ZZ@ A

StatusCodeZZA K
;ZZK L
message[[ 
=[[ 
	exception[[ #
.[[# $
Message[[$ +
;[[+ ,
apiStatusCode\\ 
=\\ 
(\\  !
ApiResultStatusCode\\! 4
)\\4 5
domainException\\5 D
.\\D E

StatusCode\\E O
;\\O P
}]] 
_logger__ 
.__ 
LogError__ 
(__ 
	exception__ &
,__& '
	exception__( 1
.__1 2
Message__2 9
)__9 :
;__: ;
varbb 
dicbb 
=bb 
newbb 

Dictionarybb $
<bb$ %
stringbb% +
,bb+ ,
stringbb- 3
>bb3 4
{cc 
[dd 
$strdd 
]dd 
=dd 
$"dd  "
{dd" #
messagedd# *
}dd* +
$strdd+ ,
{dd, -
	exceptiondd- 6
.dd6 7
Messagedd7 >
}dd> ?
"dd? @
,dd@ A
[ee 
$stree 
]ee 
=ee  
	exceptionee! *
.ee* +

StackTraceee+ 5
!ee5 6
}ff 
;ff 
messagegg 
=gg 
JsonConvertgg !
.gg! "
SerializeObjectgg" 1
(gg1 2
dicgg2 5
)gg5 6
;gg6 7
awaitii  
WriteToResponseAsyncii &
(ii& '
)ii' (
;ii( )
}jj 	
asyncll 
Taskll  
WriteToResponseAsyncll '
(ll' (
)ll( )
{mm 	
ifnn 
(nn 
contextnn 
.nn 
Responsenn  
.nn  !

HasStartednn! +
)nn+ ,
throwoo 
newoo %
InvalidOperationExceptionoo 3
(oo3 4
$strpp m
)ppm n
;ppn o
varrr 
resultrr 
=rr 
newrr 
	ApiResultrr &
(rr& '
falserr' ,
,rr, -
apiStatusCoderr. ;
,rr; <
messagerr= D
)rrD E
;rrE F
varss 
jsonss 
=ss 
JsonConvertss "
.ss" #
SerializeObjectss# 2
(ss2 3
resultss3 9
,ss9 :
newss; >"
JsonSerializerSettingsss? U
{tt 
ContractResolveruu  
=uu! "
newuu# &2
&CamelCasePropertyNamesContractResolveruu' M
(uuM N
)uuN O
}vv 
)vv 
;vv 
contextxx 
.xx 
Responsexx 
.xx 

StatusCodexx '
=xx( )
(xx* +
intxx+ .
)xx. /
httpStatusCodexx/ =
;xx= >
contextyy 
.yy 
Responseyy 
.yy 
ContentTypeyy (
=yy) *
$stryy+ =
;yy= >
awaitzz 
contextzz 
.zz 
Responsezz "
.zz" #

WriteAsynczz# -
(zz- .
jsonzz. 2
)zz2 3
;zz3 4
}{{ 	
void}} "
SetUnAuthorizeResponse}} #
(}}# $
	Exception}}$ -
	exception}}. 7
)}}7 8
{~~ 	
httpStatusCode 
= 
HttpStatusCode +
.+ ,
Unauthorized, 8
;8 9
apiStatusCode
ÄÄ 
=
ÄÄ !
ApiResultStatusCode
ÄÄ /
.
ÄÄ/ 0
UnAuthorized
ÄÄ0 <
;
ÄÄ< =
if
ÇÇ 
(
ÇÇ 
_env
ÇÇ 
.
ÇÇ 
IsDevelopment
ÇÇ "
(
ÇÇ" #
)
ÇÇ# $
)
ÇÇ$ %
{
ÉÉ 
var
ÑÑ 
dic
ÑÑ 
=
ÑÑ 
new
ÑÑ 

Dictionary
ÑÑ (
<
ÑÑ( )
string
ÑÑ) /
,
ÑÑ/ 0
string
ÑÑ1 7
>
ÑÑ7 8
{
ÖÖ 
[
ÜÜ 
$str
ÜÜ  
]
ÜÜ  !
=
ÜÜ" #
	exception
ÜÜ$ -
.
ÜÜ- .
Message
ÜÜ. 5
,
ÜÜ5 6
[
áá 
$str
áá !
]
áá! "
=
áá# $
	exception
áá% .
.
áá. /

StackTrace
áá/ 9
!
áá9 :
}
àà 
;
àà 
if
ââ 
(
ââ 
	exception
ââ 
is
ââ  +
SecurityTokenExpiredException
ââ! >
tokenException
ââ? M
)
ââM N
dic
ää 
.
ää 
Add
ää 
(
ää 
$str
ää %
,
ää% &
tokenException
ää' 5
.
ää5 6
Expires
ää6 =
.
ää= >
ToString
ää> F
(
ääF G
)
ääG H
)
ääH I
;
ääI J
message
åå 
=
åå 
JsonConvert
åå %
.
åå% &
SerializeObject
åå& 5
(
åå5 6
dic
åå6 9
)
åå9 :
;
åå: ;
}
çç 
}
éé 	
}
èè 
}êê ¶
TC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\ExceptionEnum.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
static 
class 
ExceptionEnum !
{ 
public 

const 
short 
UnhandledException )
=* +
$num, /
;/ 0
public 

const 
short #
ApiVersioningNotSupport .
=/ 0
$num1 4
;4 5
public 

const 
short %
LinqDynamicParseException 0
=1 2
$num3 6
;6 7
public 

const 
short $
ModelValidationException /
=0 1
$num2 5
;5 6
public 

const 
short 
RateLimitException )
=* +
$num, /
;/ 0
public		 

const		 
short		 (
ForceChangePasswordException		 3
=		4 5
$num		6 9
;		9 :
public

 

const

 
short

 +
TaskSchedulerExecutionException

 6
=

7 8
$num

9 <
;

< =
public 

const 
short "
MeladHttpCallException -
=. /
$num0 3
;3 4
public 

const 
short %
PermissionAccessException 0
=1 2
$num3 6
;6 7
public 

const 
short 
NotFoundException (
=) *
$num+ .
;. /
public 

const 
short 
MeladException %
=& '
$num( +
;+ ,
public 

const 
short "
MeladIdentityException -
=. /
$num0 3
;3 4
public 

const 
short 
MeladSiloException )
=* +
$num, /
;/ 0
public 

const 
short 
DuplicatedKey $
=% &
$num' *
;* +
public 

const 
short %
RelationalEntityDeleteKey 0
=1 2
$num3 6
;6 7
public 

const 
short 
SqlInjectionKey &
=' (
$num) ,
;, -
public 

const 
short 
UpdateConcurrency (
=) *
$num+ .
;. /
public 

const 
short 
AccessDenied #
=$ %
$num& )
;) *
} û
TC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\IAppException.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
	interface 
IAppException 
{ 
int 

StatusCode 
{ 
get 
; 
} 
} Æ
YC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Mediatr\AddMediatR.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Mediatr$ +
;+ ,
public 
static 
class 
CustomAddMediatr $
{ 
public 

static 
IServiceCollection $

AddMediatR% /
(/ 0
this0 4
IServiceCollection5 G
servicesH P
,P Q
paramsR X
AssemblyY a
[a b
]b c

assembliesd n
)n o
{		 
services

 
.

 '
AddValidatorsFromAssemblies

 ,
(

, -

assemblies

- 7
)

7 8
;

8 9
services 
. 

AddMediatR 
( 
cfg 
=>  "
{ 	
cfg 
. *
RegisterServicesFromAssemblies .
(. /

assemblies/ 9
)9 :
;: ;
cfg 
. 
AddBehavior 
( 
typeof "
(" #
IPipelineBehavior# 4
<4 5
,5 6
>6 7
)7 8
,8 9
typeof: @
(@ A'
UnhandledExceptionBehaviourA \
<\ ]
,] ^
>^ _
)_ `
)` a
;a b
cfg 
. 
AddBehavior 
( 
typeof "
(" #
IPipelineBehavior# 4
<4 5
,5 6
>6 7
)7 8
,8 9
typeof: @
(@ A
ValidationBehaviourA T
<T U
,U V
>V W
)W X
)X Y
;Y Z
cfg 
. 
AddBehavior 
( 
typeof "
(" #
IPipelineBehavior# 4
<4 5
,5 6
>6 7
)7 8
,8 9
typeof: @
(@ A 
PerformanceBehaviourA U
<U V
,V W
>W X
)X Y
)Y Z
;Z [
} 	
)	 

;
 
return 
services 
; 
} 
} Ω
_C:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Mediatr\LoggingBehaviour.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Mediatr$ +
;+ ,
public 
class 
LoggingBehaviour 
< 
TRequest &
>& '
:( ) 
IRequestPreProcessor* >
<> ?
TRequest? G
>G H
whereI N
TRequestO W
:X Y
notnullZ a
{ 
private		 
readonly		 
ILogger		 
_logger		 $
;		$ %
public 

LoggingBehaviour 
( 
ILogger #
<# $
TRequest$ ,
>, -
logger. 4
)4 5
{ 
_logger 
= 
logger 
; 
} 
public 

Task 
Process 
( 
TRequest  
request! (
,( )
CancellationToken* ;
cancellationToken< M
)M N
{ 
var 
requestName 
= 
typeof  
(  !
TRequest! )
)) *
.* +
Name+ /
;/ 0
string 
? 
userName 
= 
string !
.! "
Empty" '
;' (
_logger 
. 
LogInformation 
( 
$str Z
,Z [
requestName 
, 
userName "
," #
request$ +
)+ ,
;, -
return 
Task 
. 
CompletedTask !
;! "
} 
} «
cC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Mediatr\PerformanceBehaviour.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Mediatr$ +
;+ ,
public 
class  
PerformanceBehaviour !
<! "
TRequest" *
,* +
	TResponse, 5
>5 6
:7 8
IPipelineBehavior9 J
<J K
TRequestK S
,S T
	TResponseU ^
>^ _
where` e
TRequestf n
:o p
notnullq x
{ 
private 
readonly 
	Stopwatch 
_timer %
;% &
private		 
readonly		 
ILogger		 
<		 
TRequest		 %
>		% &
_logger		' .
;		. /
public 
 
PerformanceBehaviour 
(  
ILogger 
< 
TRequest 
> 
logger  
) 
{ 
_timer 
= 
new 
	Stopwatch 
( 
)  
;  !
_logger 
= 
logger 
; 
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest( 0
request1 8
,8 9"
RequestHandlerDelegate: P
<P Q
	TResponseQ Z
>Z [
next\ `
,` a
CancellationToken 
cancellationToken +
)+ ,
{ 
_timer 
. 
Start 
( 
) 
; 
var 
response 
= 
await 
next !
(! "
)" #
;# $
_timer 
. 
Stop 
( 
) 
; 
var 
elapsedMilliseconds 
=  !
_timer" (
.( )
ElapsedMilliseconds) <
;< =
if 

( 
elapsedMilliseconds 
>  !
$num" %
)% &
{ 	
var 
requestName 
= 
typeof $
($ %
TRequest% -
)- .
.. /
Name/ 3
;3 4
var 
userName 
= 
string !
.! "
Empty" '
;' (
_logger 
. 

LogWarning 
( 
$str }
,} ~
requestName   
,   
elapsedMilliseconds   0
,  0 1
userName  2 :
,  : ;
request  < C
)  C D
;  D E
}!! 	
return## 
response## 
;## 
}$$ 
}%% Ÿ
jC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Mediatr\UnhandledExceptionBehaviour.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Mediatr$ +
;+ ,
public 
class '
UnhandledExceptionBehaviour (
<( )
TRequest) 1
,1 2
	TResponse3 <
>< =
:> ?
IPipelineBehavior@ Q
<Q R
TRequestR Z
,Z [
	TResponse\ e
>e f
whereg l
TRequestm u
:v w
notnullx 
{ 
private 
readonly 
ILogger 
< 
TRequest %
>% &
_logger' .
;. /
public		 
'
UnhandledExceptionBehaviour		 &
(		& '
ILogger		' .
<		. /
TRequest		/ 7
>		7 8
logger		9 ?
)		? @
{

 
_logger 
= 
logger 
; 
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest( 0
request1 8
,8 9"
RequestHandlerDelegate: P
<P Q
	TResponseQ Z
>Z [
next\ `
,` a
CancellationTokenb s
cancellationToken	t Ö
)
Ö Ü
{ 
try 
{ 	
return 
await 
next 
( 
) 
;  
} 	
catch 
( 
	Exception 
ex 
) 
{ 	
var 
requestName 
= 
typeof $
($ %
TRequest% -
)- .
.. /
Name/ 3
;3 4
_logger 
. 
LogError 
( 
ex 
,  
$str! o
,o p
requestNameq |
,| }
request	~ Ö
)
Ö Ü
;
Ü á
throw 
; 
} 	
} 
} æ
bC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Mediatr\ValidationBehaviour.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Mediatr$ +
;+ ,
public 
class 
ValidationBehaviour  
<  !
TRequest! )
,) *
	TResponse+ 4
>4 5
:6 7
IPipelineBehavior8 I
<I J
TRequestJ R
,R S
	TResponseT ]
>] ^
where 

TRequest 
: 
notnull 
{ 
private 
readonly 
IEnumerable  
<  !

IValidator! +
<+ ,
TRequest, 4
>4 5
>5 6
_validators7 B
;B C
public		 

ValidationBehaviour		 
(		 
IEnumerable		 *
<		* +

IValidator		+ 5
<		5 6
TRequest		6 >
>		> ?
>		? @

validators		A K
)		K L
{

 
_validators 
= 

validators  
;  !
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest( 0
request1 8
,8 9"
RequestHandlerDelegate: P
<P Q
	TResponseQ Z
>Z [
next\ `
,` a
CancellationTokenb s
cancellationToken	t Ö
)
Ö Ü
{ 
if 

( 
_validators 
. 
Any 
( 
) 
) 
{ 	
var 
context 
= 
new 
ValidationContext /
</ 0
TRequest0 8
>8 9
(9 :
request: A
)A B
;B C
var 
validationResults !
=" #
await$ )
Task* .
.. /
WhenAll/ 6
(6 7
_validators 
. 
Select "
(" #
v# $
=>% '
v 
. 
ValidateAsync #
(# $
context$ +
,+ ,
cancellationToken- >
)> ?
)? @
)@ A
;A B
var 
failures 
= 
validationResults ,
. 
Where 
( 
r 
=> 
r 
. 
Errors $
.$ %
Any% (
(( )
)) *
)* +
. 

SelectMany 
( 
r 
=>  
r! "
." #
Errors# )
)) *
. 
ToList 
( 
) 
; 
if 
( 
failures 
. 
Any 
( 
) 
) 
throw 
new 
ValidationException -
(- .
failures. 6
)6 7
;7 8
} 	
return   
await   
next   
(   
)   
;   
}!! 
}"" ‘
bC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Mediatr\ValidationException.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Mediatr$ +
;+ ,
public 
class 
ValidationException  
:! "
	Exception# ,
{ 
public 

ValidationException 
( 
)  
: 	
base
 
( 
$str ?
)? @
{		 
Errors

 
=

 
new

 

Dictionary

 
<

  
string

  &
,

& '
string

( .
[

. /
]

/ 0
>

0 1
(

1 2
)

2 3
;

3 4
} 
public 

ValidationException 
( 
IEnumerable *
<* +
ValidationFailure+ <
>< =
failures> F
)F G
: 	
this
 
( 
) 
{ 
Errors 
= 
failures 
. 
GroupBy 
( 
e 
=> 
e 
. 
PropertyName (
,( )
e* +
=>, .
e/ 0
.0 1
ErrorMessage1 =
)= >
. 
ToDictionary 
( 
failureGroup &
=>' )
failureGroup* 6
.6 7
Key7 :
,: ;
failureGroup< H
=>I K
failureGroupL X
.X Y
ToArrayY `
(` a
)a b
)b c
;c d
} 
public 

IDictionary 
< 
string 
, 
string %
[% &
]& '
>' (
Errors) /
{0 1
get2 5
;5 6
}7 8
} ’
XC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\NotFoundException.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
;# $
public 
class 
NotFoundException 
:  
AppException! -
{ 
public 

NotFoundException 
( 
) 
: 	
base
 
( 
ApiResultStatusCode "
." #
NotFound# +
,+ ,
HttpStatusCode- ;
.; <
NotFound< D
)D E
{		 
}

 
public 

NotFoundException 
( 
string #
message$ +
)+ ,
: 	
base
 
( 
ApiResultStatusCode "
." #
NotFound# +
,+ ,
message- 4
,4 5
HttpStatusCode6 D
.D E
NotFoundE M
)M N
{ 
} 
public 

NotFoundException 
( 
object #
additionalData$ 2
)2 3
: 	
base
 
( 
ApiResultStatusCode "
." #
NotFound# +
,+ ,
null- 1
!1 2
,2 3
HttpStatusCode4 B
.B C
NotFoundC K
,K L
additionalDataM [
)[ \
{ 
} 
public 

NotFoundException 
( 
string #
message$ +
,+ ,
object- 3
additionalData4 B
)B C
: 	
base
 
( 
ApiResultStatusCode "
." #
NotFound# +
,+ ,
message- 4
,4 5
HttpStatusCode6 D
.D E
NotFoundE M
,M N
additionalDataO ]
)] ^
{ 
} 
public 

NotFoundException 
( 
string #
message$ +
,+ ,
	Exception- 6
	exception7 @
)@ A
: 	
base
 
( 
ApiResultStatusCode "
." #
NotFound# +
,+ ,
message- 4
,4 5
	exception6 ?
,? @
HttpStatusCodeA O
.O P
NotFoundP X
)X Y
{ 
} 
public   

NotFoundException   
(   
string   #
message  $ +
,  + ,
	Exception  - 6
	exception  7 @
,  @ A
object  B H
additionalData  I W
)  W X
:!! 	
base!!
 
(!! 
ApiResultStatusCode!! "
.!!" #
NotFound!!# +
,!!+ ,
message!!- 4
,!!4 5
HttpStatusCode!!6 D
.!!D E
NotFound!!E M
,!!M N
	exception!!O X
,!!X Y
additionalData!!Z h
)!!h i
{"" 
}## 
}$$ ±$
YC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Serilog\AddSerilog.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Serilog$ +
;+ ,
public 
static 
class 
CustomAddSerilog $
{		 
public 

static 
IHostBuilder 

AddSerilog )
() *
this* .
IHostBuilder/ ;
hostBuilder< G
,G H
stringJ P
?P Q

elasticUriR \
,\ ]
string 
? 
userName 
, 
string  
?  !
password" *
)* +
{ 
hostBuilder 
. 

UseSerilog 
( 
(  
context  '
,' (
configuration) 6
)6 7
=>8 :
{ 	
var 
environment 
= 
Environment )
.) *"
GetEnvironmentVariable* @
(@ A
$strA Y
)Y Z
;Z [
configuration 
. 
MinimumLevel &
.& '
Override' /
(/ 0
$str0 ;
,; <
LogEventLevel= J
.J K
ErrorK P
)P Q
. 
MinimumLevel 
. 
Override &
(& '
$str' =
,= >
LogEventLevel? L
.L M
ErrorM R
)R S
. 
Enrich 
. 
FromLogContext &
(& '
)' (
. 
Enrich 
. 
WithProperty $
($ %
$str% 2
,2 3
environment4 ?
)? @
. 
WriteTo 
. 
Elasticsearch &
(& '
new' *$
ElasticsearchSinkOptions+ C
(C D
newD G
UriH K
(K L
$"L N
{N O

elasticUriO Y
}Y Z
"Z [
)[ \
)\ ]
{ 
IndexFormat 
=  !
$"" $
{$ %
Assembly% -
.- . 
GetExecutingAssembly. B
(B C
)C D
.D E
GetNameE L
(L M
)M N
.N O
NameO S
!S T
.T U
ToLowerU \
(\ ]
)] ^
.^ _
Replace_ f
(f g
$strg j
,j k
$strl o
)o p
}p q
"q r
+s t
$"" $
$str$ %
{% &
environment& 1
?1 2
.2 3
ToLower3 :
(: ;
); <
.< =
Replace= D
(D E
$strE H
,H I
$strJ M
)M N
}N O
$strO P
{P Q
TimeProviderQ ]
.] ^
System^ d
.d e
	GetUtcNowe n
(n o
)o p
:p q
$strq x
}x y
"y z
,z {$
ModifyConnectionSettings   ,
=  - .
x  / 0
=>  1 3
x!! 
.!! 
BasicAuthentication!! -
(!!- .
userName!!. 6
,!!6 7
password!!8 @
)!!@ A
,!!A B
FailureCallback"" #
=""$ %
e""& '
=>""( *
Console""+ 2
.""2 3
	WriteLine""3 <
(""< =
$str""= c
+""d e
e""f g
.""g h
MessageTemplate""h w
)""w x
,""x y
EmitEventFailure## $
=##% &$
EmitEventFailureHandling##' ?
.##? @
WriteToSelfLog##@ N
|##O P$
EmitEventFailureHandling$$' ?
.$$? @
WriteToFailureSink$$@ R
|$$S T$
EmitEventFailureHandling%%' ?
.%%? @
RaiseCallback%%@ M
,%%M N 
AutoRegisterTemplate&& (
=&&) *
true&&+ /
,&&/ 0
}'' 
)'' 
.)) 
ReadFrom)) 
.)) 
Configuration)) '
())' (
context))( /
.))/ 0
Configuration))0 =
)))= >
.** 
WriteTo** 
.** 
Console**  
(**  !
)**! "
;**" #
}++ 	
)++	 

;++
 
return,, 
hostBuilder,, 
;,, 
}-- 
}.. «X
lC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Swagger\ApplySummariesOperationFilter.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Swagger$ +
;+ ,
public		 
class		 )
ApplySummariesOperationFilter		 *
:		+ ,
IOperationFilter		- =
{

 
public 

void 
Apply 
( 
OpenApiOperation &
	operation' 0
,0 1"
OperationFilterContext2 H
contextI P
)P Q
{ 
var &
controllerActionDescriptor &
=' (
context) 0
.0 1
ApiDescription1 ?
.? @
ActionDescriptor@ P
asQ S&
ControllerActionDescriptorT n
;n o
if 

( &
controllerActionDescriptor &
==' )
null* .
). /
return0 6
;6 7
var 

pluralizer 
= 
new 

Pluralizer '
(' (
)( )
;) *
var 

actionName 
= &
controllerActionDescriptor 3
.3 4

ActionName4 >
;> ?
var 
singularizeName 
= 

pluralizer (
.( )
Singularize) 4
(4 5&
controllerActionDescriptor5 O
.O P
ControllerNameP ^
)^ _
;_ `
var 
pluralizeName 
= 

pluralizer &
.& '
	Pluralize' 0
(0 1
singularizeName1 @
)@ A
;A B
var 
parameterCount 
= 
	operation &
.& '

Parameters' 1
.1 2
Where2 7
(7 8
p8 9
=>: <
p= >
.> ?
Name? C
!=D F
$strG P
&&Q S
pT U
.U V
NameV Z
!=[ ]
$str^ k
)k l
.l m
Countm r
(r s
)s t
;t u
if 

( 
IsGetAllAction 
( 
) 
) 
{ 	
if 
( 
! 
	operation 
. 
Summary "
." #
HasValue# +
(+ ,
), -
)- .
	operation 
. 
Summary !
=" #
$"$ &
$str& 2
{2 3
pluralizeName3 @
}@ A
"A B
;B C
} 	
else 
if 
( 
IsActionName 
( 
$str $
,$ %
$str& .
). /
)/ 0
{ 	
if 
( 
! 
	operation 
. 
Summary "
." #
HasValue# +
(+ ,
), -
)- .
	operation   
.   
Summary   !
=  " #
$"  $ &
$str  & 0
{  0 1
singularizeName  1 @
}  @ A
"  A B
;  B C
if"" 
("" 
!"" 
	operation"" 
."" 

Parameters"" %
[""% &
$num""& '
]""' (
.""( )
Description"") 4
.""4 5
HasValue""5 =
(""= >
)""> ?
)""? @
	operation## 
.## 

Parameters## $
[##$ %
$num##% &
]##& '
.##' (
Description##( 3
=##4 5
$"##6 8
$str##8 :
{##: ;
singularizeName##; J
}##J K
$str##K Z
"##Z [
;##[ \
}$$ 	
else%% 
if%% 
(%% 
IsActionName%% 
(%% 
$str%% $
,%%$ %
$str%%& +
)%%+ ,
)%%, -
{&& 	
if'' 
('' 
!'' 
	operation'' 
.'' 
Summary'' "
.''" #
HasValue''# +
(''+ ,
)'', -
)''- .
	operation(( 
.(( 
Summary(( !
=((" #
$"(($ &
$str((& 2
{((2 3
singularizeName((3 B
}((B C
$str((C P
"((P Q
;((Q R
if** 
(** 
!** 
	operation** 
.** 

Parameters** %
[**% &
$num**& '
]**' (
.**( )
Description**) 4
.**4 5
HasValue**5 =
(**= >
)**> ?
)**? @
	operation++ 
.++ 

Parameters++ $
[++$ %
$num++% &
]++& '
.++' (
Description++( 3
=++4 5
$"++6 8
$str++8 L
{++L M
singularizeName++M \
}++\ ]
"++] ^
;++^ _
},, 	
else-- 
if-- 
(-- 
IsActionName-- 
(-- 
$str-- #
,--# $
$str--% +
,--+ ,
$str--- 5
)--5 6
)--6 7
{.. 	
if// 
(// 
!// 
	operation// 
.// 
Summary// "
.//" #
HasValue//# +
(//+ ,
)//, -
)//- .
	operation00 
.00 
Summary00 !
=00" #
$"00$ &
$str00& 0
{000 1
singularizeName001 @
}00@ A
$str00A N
"00N O
;00O P
if55 
(55 
!55 
	operation55 
.55 

Parameters55 %
[55% &
$num55& '
]55' (
.55( )
Description55) 4
.554 5
HasValue555 =
(55= >
)55> ?
)55? @
	operation66 
.66 

Parameters66 $
[66$ %
$num66% &
]66& '
.66' (
Description66( 3
=664 5
$"666 8
$str668 :
{66: ;
singularizeName66; J
}66J K
$str66K Z
"66Z [
;66[ \
}77 	
else88 
if88 
(88 
IsActionName88 
(88 
$str88 &
,88& '
$str88( 0
)880 1
)881 2
{99 	
if:: 
(:: 
!:: 
	operation:: 
.:: 
Summary:: "
.::" #
HasValue::# +
(::+ ,
)::, -
)::- .
	operation;; 
.;; 
Summary;; !
=;;" #
$";;$ &
$str;;& 0
{;;0 1
singularizeName;;1 @
};;@ A
$str;;A N
";;N O
;;;O P
if== 
(== 
!== 
	operation== 
.== 

Parameters== %
[==% &
$num==& '
]==' (
.==( )
Description==) 4
.==4 5
HasValue==5 =
(=== >
)==> ?
)==? @
	operation>> 
.>> 

Parameters>> $
[>>$ %
$num>>% &
]>>& '
.>>' (
Description>>( 3
=>>4 5
$">>6 8
$str>>8 L
{>>L M
singularizeName>>M \
}>>\ ]
">>] ^
;>>^ _
}?? 	
boolCC 
IsGetAllActionCC 
(CC 
)CC 
{DD 	
foreachEE 
(EE 
varEE 
nameEE 
inEE  
newEE! $
[EE$ %
]EE% &
{EE' (
$strEE) .
,EE. /
$strEE0 6
,EE6 7
$strEE8 @
}EEA B
)EEB C
ifFF 
(FF 
(FF 

actionNameFF 
.FF  
EqualsFF  &
(FF& '
nameFF' +
,FF+ ,
StringComparisonFF- =
.FF= >
OrdinalIgnoreCaseFF> O
)FFO P
&&FFQ S
parameterCountFFT b
==FFc e
$numFFf g
)FFg h
||FFi k

actionNameGG 
.GG 
EqualsGG %
(GG% &
$"GG& (
{GG( )
nameGG) -
}GG- .
$strGG. 1
"GG1 2
,GG2 3
StringComparisonGG4 D
.GGD E
OrdinalIgnoreCaseGGE V
)GGV W
||GGX Z

actionNameHH 
.HH 
EqualsHH %
(HH% &
$"HH& (
{HH( )
nameHH) -
}HH- .
{HH. /
pluralizeNameHH/ <
}HH< =
"HH= >
,HH> ?
StringComparisonHH@ P
.HHP Q
OrdinalIgnoreCaseHHQ b
)HHb c
||HHd f

actionNameII 
.II 
EqualsII %
(II% &
$"II& (
{II( )
nameII) -
}II- .
$strII. 1
{II1 2
singularizeNameII2 A
}IIA B
"IIB C
,IIC D
StringComparisonIIE U
.IIU V
OrdinalIgnoreCaseIIV g
)IIg h
||IIi k

actionNameJJ 
.JJ 
EqualsJJ %
(JJ% &
$"JJ& (
{JJ( )
nameJJ) -
}JJ- .
$strJJ. 1
{JJ1 2
pluralizeNameJJ2 ?
}JJ? @
"JJ@ A
,JJA B
StringComparisonJJC S
.JJS T
OrdinalIgnoreCaseJJT e
)JJe f
)JJf g
returnKK 
trueKK 
;KK  
returnLL 
falseLL 
;LL 
}MM 	
boolOO 
IsActionNameOO 
(OO 
paramsOO  
stringOO! '
[OO' (
]OO( )
namesOO* /
)OO/ 0
{PP 	
foreachQQ 
(QQ 
varQQ 
nameQQ 
inQQ  
namesQQ! &
)QQ& '
ifRR 
(RR 

actionNameRR 
.RR 
EqualsRR %
(RR% &
nameRR& *
,RR* +
StringComparisonRR, <
.RR< =
OrdinalIgnoreCaseRR= N
)RRN O
||RRP R

actionNameSS 
.SS 
EqualsSS %
(SS% &
$"SS& (
{SS( )
nameSS) -
}SS- .
$strSS. 2
"SS2 3
,SS3 4
StringComparisonSS5 E
.SSE F
OrdinalIgnoreCaseSSF W
)SSW X
||SSY [

actionNameTT 
.TT 
EqualsTT %
(TT% &
$"TT& (
{TT( )
nameTT) -
}TT- .
{TT. /
singularizeNameTT/ >
}TT> ?
"TT? @
,TT@ A
StringComparisonTTB R
.TTR S
OrdinalIgnoreCaseTTS d
)TTd e
||TTf h

actionNameUU 
.UU 
EqualsUU %
(UU% &
$"UU& (
{UU( )
nameUU) -
}UU- .
{UU. /
singularizeNameUU/ >
}UU> ?
$strUU? C
"UUC D
,UUD E
StringComparisonUUF V
.UUV W
OrdinalIgnoreCaseUUW h
)UUh i
)UUi j
returnVV 
trueVV 
;VV  
returnWW 
falseWW 
;WW 
}XX 	
}[[ 
}\\ Ú	
fC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Swagger\RemoveVersionParameters.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Swagger$ +
;+ ,
public 
class #
RemoveVersionParameters $
:% &
IOperationFilter' 7
{ 
public 

void 
Apply 
( 
OpenApiOperation &
	operation' 0
,0 1"
OperationFilterContext2 H
contextI P
)P Q
{		 
var 
versionParameter 
= 
	operation (
.( )

Parameters) 3
.3 4
SingleOrDefault4 C
(C D
pD E
=>F H
pI J
.J K
NameK O
==P R
$strS \
)\ ]
;] ^
if 

( 
versionParameter 
!= 
null  $
)$ %
	operation 
. 

Parameters  
.  !
Remove! '
(' (
versionParameter( 8
)8 9
;9 :
} 
} «
`C:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Swagger\SetVersionInPaths.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Swagger$ +
;+ ,
public 
class 
SetVersionInPaths 
:  
IDocumentFilter! 0
{ 
public 

void 
Apply 
( 
OpenApiDocument %

swaggerDoc& 0
,0 1!
DocumentFilterContext2 G
contextH O
)O P
{		 
var

 
updatedPaths

 
=

 
new

 
OpenApiPaths

 +
(

+ ,
)

, -
;

- .
foreach 
( 
var 
entry 
in 

swaggerDoc (
.( )
Paths) .
). /
updatedPaths 
. 
Add 
( 
entry 
. 
Key 
. 
Replace !
(! "
$str" .
,. /

swaggerDoc0 :
.: ;
Info; ?
.? @
Version@ G
)G H
,H I
entry 
. 
Value 
) 
; 

swaggerDoc 
. 
Paths 
= 
updatedPaths '
;' (
} 
} ‡i
mC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Swagger\SwaggerConfigurationExtensions.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Swagger$ +
;+ ,
public 
static 
class *
SwaggerConfigurationExtensions 2
{ 
public 

static 
IServiceCollection $

AddSwagger% /
(/ 0
this0 4
IServiceCollection5 G
servicesH P
,P Q
stringQ W
oauthAddressX d
)d e
{ 
Guard 
. 
Against 
. 
Null 
( 
services #
,# $
nameof% +
(+ ,
services, 4
)4 5
)5 6
;6 7
Guard 
. 
Against 
. 
NullOrEmpty !
(! "
oauthAddress" .
,. /
$str/ I
)I J
;J K
var 
mainAssembly 
= 
Assembly #
.# $
GetEntryAssembly$ 4
(4 5
)5 6
;6 7
Guard 
. 
Against 
. 
Null 
( 
mainAssembly '
,' (
nameof) /
(/ 0
mainAssembly0 <
)< =
)= >
;> ?
var 
mainType 
= 
mainAssembly #
.# $
GetExportedTypes$ 4
(4 5
)5 6
[6 7
$num7 8
]8 9
;9 :
const 
string 

methodName 
=  !
nameof" (
(( )'
ServiceCollectionExtensions) D
.D E,
 AddSwaggerExamplesFromAssemblyOfE e
)e f
;f g
var 
method 
= 
typeof 
( '
ServiceCollectionExtensions 7
)7 8
.8 9
GetRuntimeMethods9 J
(J K
)K L
. 
FirstOrDefault 
( 
x 
=>  
x! "
." #
Name# '
==( *

methodName+ 5
&&6 8
x9 :
.: ;
IsGenericMethod; J
)J K
;K L
Guard 
. 
Against 
. 
Null 
( 
method !
,! "
nameof# )
() *
method* 0
)0 1
)1 2
;2 3
var 
generic 
= 
method 
. 
MakeGenericMethod .
(. /
mainType/ 7
)7 8
;8 9
generic 
. 
Invoke 
( 
null 
, 
new  
[  !
]! "
{# $
services% -
}. /
)/ 0
;0 1
services 
. 
AddSwaggerGen 
( 
options &
=>' )
{ 	
var   

xmlDocPath   
=   
Path   !
.  ! "
Combine  " )
(  ) *

AppContext  * 4
.  4 5
BaseDirectory  5 B
,  B C
$"  D F
{  F G
mainAssembly  G S
.  S T
GetName  T [
(  [ \
)  \ ]
.  ] ^
Name  ^ b
}  b c
$str  c g
"  g h
)  h i
;  i j
options!! 
.!! 
IncludeXmlComments!! &
(!!& '

xmlDocPath!!' 1
,!!1 2
true!!3 7
)!!7 8
;!!8 9
options"" 
."" 
EnableAnnotations"" %
(""% &
)""& '
;""' (
options22 
.22 

SwaggerDoc22 
(22 
$str22 #
,22# $
new22% (
OpenApiInfo22) 4
{225 6
Version227 >
=22? @
$str22A E
,22E F
Title22G L
=22M N
$str22O W
}22X Y
)22Y Z
;22Z [
options33 
.33 

SwaggerDoc33 
(33 
$str33 #
,33# $
new33% (
OpenApiInfo33) 4
{335 6
Version337 >
=33? @
$str33A E
,33E F
Title33G L
=33M N
$str33O W
}33X Y
)33Y Z
;33Z [
options44 
.44 

SwaggerDoc44 
(44 
$str44 #
,44# $
new44% (
OpenApiInfo44) 4
{445 6
Version447 >
=44? @
$str44A E
,44E F
Title44G L
=44M N
$str44O W
}44X Y
)44Y Z
;44Z [
options55 
.55 

SwaggerDoc55 
(55 
$str55 #
,55# $
new55% (
OpenApiInfo55) 4
{555 6
Version557 >
=55? @
$str55A E
,55E F
Title55G L
=55M N
$str55O W
}55X Y
)55Y Z
;55Z [
options66 
.66 

SwaggerDoc66 
(66 
$str66 #
,66# $
new66% (
OpenApiInfo66) 4
{665 6
Version667 >
=66? @
$str66A E
,66E F
Title66G L
=66M N
$str66O W
}66X Y
)66Y Z
;66Z [
options88 
.88 
ExampleFilters88 "
(88" #
)88# $
;88$ %
options99 
.99 
OperationFilter99 #
<99# $)
ApplySummariesOperationFilter99$ A
>99A B
(99B C
)99C D
;99D E
options<< 
.<< 
OperationFilter<< #
<<<# $0
$UnauthorizedResponsesOperationFilter<<$ H
><<H I
(<<I J
true<<J N
,<<N O
$str<<P X
)<<X Y
;<<Y Z
optionsWW 
.WW !
AddSecurityDefinitionWW )
(WW) *
$strWW* 2
,WW2 3
newWW4 7!
OpenApiSecuritySchemeWW8 M
{XX 
Type[[ 
=[[ 
SecuritySchemeType[[ )
.[[) *
OAuth2[[* 0
,[[0 1
Flows\\ 
=\\ 
new\\ 
OpenApiOAuthFlows\\ -
{]] 
Password^^ 
=^^ 
new^^ "
OpenApiOAuthFlow^^# 3
{__ 
TokenUrl``  
=``! "
new``# &
Uri``' *
(``* +
oauthAddress``+ 7
,``7 8
UriKind``9 @
.``@ A
Relative``A I
)``I J
}gg 
}hh 
}ii 
)ii 
;ii 
optionspp 
.pp 
OperationFilterpp #
<pp# $#
RemoveVersionParameterspp$ ;
>pp; <
(pp< =
)pp= >
;pp> ?
optionsss 
.ss 
DocumentFilterss "
<ss" #
SetVersionInPathsss# 4
>ss4 5
(ss5 6
)ss6 7
;ss7 8
optionsvv 
.vv !
DocInclusionPredicatevv )
(vv) *
(vv* +
docNamevv+ 2
,vv2 3
apiDescvv4 ;
)vv; <
=>vv= ?
{ww 
ifxx 
(xx 
!xx 
apiDescxx 
.xx 
TryGetMethodInfoxx -
(xx- .
outxx. 1
varxx2 5

methodInfoxx6 @
)xx@ A
)xxA B
returnxxC I
falsexxJ O
;xxO P
varzz 
versionszz 
=zz 

methodInfozz )
.zz) *
DeclaringTypezz* 7
?zz7 8
.{{ 
GetCustomAttributes{{ (
<{{( )
ApiVersionAttribute{{) <
>{{< =
({{= >
true{{> B
){{B C
.|| 

SelectMany|| 
(||  
attr||  $
=>||% '
attr||( ,
.||, -
Versions||- 5
)||5 6
;||6 7
Guard}} 
.}} 
Against}} 
.}} 
Null}} "
(}}" #
versions}}# +
,}}+ ,
nameof}}- 3
(}}3 4
versions}}4 <
)}}< =
)}}= >
;}}> ?
return 
versions 
.  
Any  #
(# $
v$ %
=>& (
$") +
$str+ ,
{, -
v- .
}. /
"/ 0
==1 3
docName4 ;
); <
;< =
}
ÄÄ 
)
ÄÄ 
;
ÄÄ 
}
àà 	
)
àà	 

;
àà
 
return
ââ 
services
ââ 
;
ââ 
}
ää 
public
çç 

static
çç !
IApplicationBuilder
çç %
UseSwaggerAndUI
çç& 5
(
çç5 6
this
çç6 :!
IApplicationBuilder
çç; N
app
ççO R
)
ççR S
{
éé 
Guard
èè 
.
èè 
Against
èè 
.
èè 
Null
èè 
(
èè 
app
èè 
,
èè 
nameof
èè  &
(
èè& '
app
èè' *
)
èè* +
)
èè+ ,
;
èè, -
app
íí 
.
íí 

UseSwagger
íí 
(
íí 
)
ïï 
;
ïï 
app
òò 
.
òò 
UseSwaggerUI
òò 
(
òò 
options
òò  
=>
òò! #
{
ôô 	
options
öö 
.
öö 
SwaggerEndpoint
öö #
(
öö# $
$str
öö$ >
,
öö> ?
$str
öö@ I
)
ööI J
;
ööJ K
options
õõ 
.
õõ 
SwaggerEndpoint
õõ #
(
õõ# $
$str
õõ$ >
,
õõ> ?
$str
õõ@ I
)
õõI J
;
õõJ K
options
úú 
.
úú 
SwaggerEndpoint
úú #
(
úú# $
$str
úú$ >
,
úú> ?
$str
úú@ I
)
úúI J
;
úúJ K
options
ùù 
.
ùù 
SwaggerEndpoint
ùù #
(
ùù# $
$str
ùù$ >
,
ùù> ?
$str
ùù@ I
)
ùùI J
;
ùùJ K
options
ûû 
.
ûû 
SwaggerEndpoint
ûû #
(
ûû# $
$str
ûû$ >
,
ûû> ?
$str
ûû@ I
)
ûûI J
;
ûûJ K
options
®® 
.
®® 
DocExpansion
®®  
(
®®  !
DocExpansion
®®! -
.
®®- .
None
®®. 2
)
®®2 3
;
®®3 4
}
ππ 	
)
ππ	 

;
ππ
 
app
ºº 
.
ºº 
UseReDoc
ºº 
(
ºº 
options
ºº 
=>
ºº 
{
ΩΩ 	
options
ææ 
.
ææ 
SpecUrl
ææ 
(
ææ 
$str
ææ 6
)
ææ6 7
;
ææ7 8
options
øø 
.
øø 
SpecUrl
øø 
(
øø 
$str
øø 6
)
øø6 7
;
øø7 8
options
¿¿ 
.
¿¿ 
SpecUrl
¿¿ 
(
¿¿ 
$str
¿¿ 6
)
¿¿6 7
;
¿¿7 8
options
¡¡ 
.
¡¡ 
SpecUrl
¡¡ 
(
¡¡ 
$str
¡¡ 6
)
¡¡6 7
;
¡¡7 8
options
¬¬ 
.
¬¬ 
SpecUrl
¬¬ 
(
¬¬ 
$str
¬¬ 6
)
¬¬6 7
;
¬¬7 8
options
∆∆ 
.
∆∆ 
DocumentTitle
∆∆ !
=
∆∆" #
$str
∆∆$ 2
;
∆∆2 3
options
«« 
.
«« !
EnableUntrustedSpec
«« '
(
««' (
)
««( )
;
««) *
options
»» 
.
»» 
ScrollYOffset
»» !
(
»»! "
$num
»»" $
)
»»$ %
;
»»% &
options
…… 
.
…… 
HideHostname
……  
(
……  !
)
……! "
;
……" #
options
   
.
    
HideDownloadButton
   &
(
  & '
)
  ' (
;
  ( )
options
ÀÀ 
.
ÀÀ 
ExpandResponses
ÀÀ #
(
ÀÀ# $
$str
ÀÀ$ -
)
ÀÀ- .
;
ÀÀ. /
options
ÃÃ 
.
ÃÃ  
RequiredPropsFirst
ÃÃ &
(
ÃÃ& '
)
ÃÃ' (
;
ÃÃ( )
options
ÕÕ 
.
ÕÕ 

NoAutoAuth
ÕÕ 
(
ÕÕ 
)
ÕÕ  
;
ÕÕ  !
options
ŒŒ 
.
ŒŒ 
PathInMiddlePanel
ŒŒ %
(
ŒŒ% &
)
ŒŒ& '
;
ŒŒ' (
options
œœ 
.
œœ 
HideLoading
œœ 
(
œœ  
)
œœ  !
;
œœ! "
options
–– 
.
–– 
NativeScrollbars
–– $
(
––$ %
)
––% &
;
––& '
options
—— 
.
—— 
DisableSearch
—— !
(
——! "
)
——" #
;
——# $
options
““ 
.
““ #
OnlyRequiredInSamples
““ )
(
““) *
)
““* +
;
““+ ,
options
”” 
.
”” %
SortPropsAlphabetically
”” +
(
””+ ,
)
””, -
;
””- .
}
’’ 	
)
’’	 

;
’’
 
return
÷÷ 
app
÷÷ 
;
÷÷ 
}
◊◊ 
}ÿÿ Ë$
sC:\Users\Melad\RiderProjects\Melad\Melad.Common\Common\WebFramework\Swagger\UnauthorizedResponsesOperationFilter.cs
	namespace 	
Melad
 
. 
Common 
. 
WebFramework #
.# $
Swagger$ +
;+ ,
public 
class 0
$UnauthorizedResponsesOperationFilter 1
:2 3
IOperationFilter4 D
{		 
private

 
readonly

 
bool

 4
(includeUnauthorizedAndForbiddenResponses

 B
;

B C
private 
readonly 
string 

schemeName &
;& '
public 
0
$UnauthorizedResponsesOperationFilter /
(/ 0
bool0 44
(includeUnauthorizedAndForbiddenResponses5 ]
,] ^
string 

schemeName 
= 
$str $
)$ %
{ 
this 
. 4
(includeUnauthorizedAndForbiddenResponses 5
=6 74
(includeUnauthorizedAndForbiddenResponses8 `
;` a
this 
. 

schemeName 
= 

schemeName $
;$ %
} 
public 

void 
Apply 
( 
OpenApiOperation &
	operation' 0
,0 1"
OperationFilterContext2 H
contextI P
)P Q
{ 
var 
filters 
= 
context 
. 
ApiDescription ,
., -
ActionDescriptor- =
.= >
FilterDescriptors> O
;O P
var 
metadta 
= 
context 
. 
ApiDescription ,
., -
ActionDescriptor- =
.= >
EndpointMetadata> N
;N O
var 
hasAnonymous 
= 
filters "
." #
Any# &
(& '
p' (
=>) +
p, -
.- .
Filter. 4
is5 7 
AllowAnonymousFilter8 L
)L M
||N P
metadta "
." #
Any# &
(& '
p' (
=>) +
p, -
is. 0#
AllowAnonymousAttribute1 H
)H I
;I J
if 

( 
hasAnonymous 
) 
return  
;  !
var 
hasAuthorize 
= 
filters "
." #
Any# &
(& '
p' (
=>) +
p, -
.- .
Filter. 4
is5 7
AuthorizeFilter8 G
)G H
||I K
metadtaL S
.S T
AnyT W
(W X
pX Y
=>Z \
p] ^
is_ a
AuthorizeAttributeb t
)t u
;u v
if 

( 
! 
hasAuthorize 
) 
return !
;! "
if   

(   4
(includeUnauthorizedAndForbiddenResponses   4
)  4 5
{!! 	
	operation"" 
."" 
	Responses"" 
.""  
TryAdd""  &
(""& '
$str""' ,
,"", -
new"". 1
OpenApiResponse""2 A
{""B C
Description""D O
=""P Q
$str""R `
}""a b
)""b c
;""c d
	operation## 
.## 
	Responses## 
.##  
TryAdd##  &
(##& '
$str##' ,
,##, -
new##. 1
OpenApiResponse##2 A
{##B C
Description##D O
=##P Q
$str##R ]
}##^ _
)##_ `
;##` a
}$$ 	
	operation&& 
.&& 
Security&& 
.&& 
Add&& 
(&& 
new&& "&
OpenApiSecurityRequirement&&# =
{'' 	
{(( 
new)) !
OpenApiSecurityScheme)) )
{** 
Scheme++ 
=++ 

schemeName++ '
,++' (
	Reference,, 
=,, 
new,,  #
OpenApiReference,,$ 4
{,,5 6
Type,,7 ;
=,,< =
ReferenceType,,> K
.,,K L
SecurityScheme,,L Z
,,,Z [
Id,,\ ^
=,,_ `
$str,,a i
},,j k
}-- 
,-- 
Array.. 
... 
Empty.. 
<.. 
string.. "
>.." #
(..# $
)..$ %
}// 
}00 	
)00	 

;00
 
}11 
}22 