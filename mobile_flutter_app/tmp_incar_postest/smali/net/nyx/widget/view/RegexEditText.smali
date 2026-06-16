.class public Lnet/nyx/widget/view/RegexEditText;
.super Landroidx/appcompat/widget/AppCompatEditText;
.source "RegexEditText.java"

# interfaces
.implements Landroid/text/InputFilter;


# instance fields
.field public l:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/RegexEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const v0, 0x101006e

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/RegexEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    sget-object p3, Ld/a/d/f;->RegexEditText:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 5
    sget p2, Ld/a/d/f;->RegexEditText_inputRegex:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_1b

    .line 6
    sget p2, Ld/a/d/f;->RegexEditText_inputRegex:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    goto :goto_57

    .line 7
    :cond_1b
    sget p2, Ld/a/d/f;->RegexEditText_regexType:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_57

    .line 8
    sget p2, Ld/a/d/f;->RegexEditText_regexType:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    packed-switch p2, :pswitch_data_5c

    goto :goto_57

    :pswitch_2e
    const-string p2, "\\S+"

    .line 9
    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    goto :goto_57

    :pswitch_34
    const-string p2, "[[\\u4e00-\\u9fa5]|[a-zA-Z]|\\d]*"

    .line 10
    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    goto :goto_57

    :pswitch_3a
    const-string p2, "[1-9]\\d*"

    .line 11
    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    goto :goto_57

    :pswitch_40
    const-string p2, "\\d*"

    .line 12
    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    goto :goto_57

    :pswitch_46
    const-string p2, "[a-zA-Z]*"

    .line 13
    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    goto :goto_57

    :pswitch_4c
    const-string p2, "[\\u4e00-\\u9fa5]*"

    .line 14
    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    goto :goto_57

    :pswitch_52
    const-string p2, "[1]\\d{0,10}"

    .line 15
    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    .line 16
    :cond_57
    :goto_57
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    nop

    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_52
        :pswitch_4c
        :pswitch_46
        :pswitch_40
        :pswitch_3a
        :pswitch_34
        :pswitch_2e
    .end packed-switch
.end method


# virtual methods
.method public a(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    or-int/2addr p1, v0

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setInputType(I)V

    return-void
.end method

.method public a(Landroid/text/InputFilter;)V
    .registers 6

    if-nez p1, :cond_3

    return-void

    .line 2
    :cond_3
    invoke-virtual {p0}, Landroid/widget/EditText;->getFilters()[Landroid/text/InputFilter;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1a

    .line 3
    array-length v3, v0

    if-lez v3, :cond_1a

    .line 4
    array-length v3, v0

    add-int/2addr v3, v1

    new-array v1, v3, [Landroid/text/InputFilter;

    .line 5
    array-length v3, v0

    invoke-static {v0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6
    array-length v0, v0

    aput-object p1, v1, v0

    goto :goto_1e

    :cond_1a
    new-array v1, v1, [Landroid/text/InputFilter;

    aput-object p1, v1, v2

    .line 7
    :goto_1e
    invoke-super {p0, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    return-void
.end method

.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .registers 10

    .line 1
    iget-object p2, p0, Lnet/nyx/widget/view/RegexEditText;->l:Ljava/util/regex/Pattern;

    if-nez p2, :cond_5

    return-object p1

    .line 2
    :cond_5
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 3
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    sub-int v0, p6, p5

    add-int/2addr v0, p5

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    add-int/2addr v1, p5

    invoke-virtual {p3, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    add-int/lit8 p3, p6, -0x1

    const-string v0, ""

    if-le p5, p3, :cond_4c

    .line 5
    iget-object p3, p0, Lnet/nyx/widget/view/RegexEditText;->l:Ljava/util/regex/Pattern;

    invoke-virtual {p3, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    move-result p2

    if-nez p2, :cond_66

    return-object v0

    .line 6
    :cond_4c
    iget-object p3, p0, Lnet/nyx/widget/view/RegexEditText;->l:Ljava/util/regex/Pattern;

    invoke-virtual {p3, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/regex/Matcher;->matches()Z

    move-result p3

    if-nez p3, :cond_66

    .line 7
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_66

    .line 8
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p5, p6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_66
    return-object p1
.end method

.method public getInputRegex()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/RegexEditText;->l:Ljava/util/regex/Pattern;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    invoke-virtual {v0}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setInputRegex(Ljava/lang/String;)V
    .registers 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lnet/nyx/widget/view/RegexEditText;->l:Ljava/util/regex/Pattern;

    .line 3
    invoke-virtual {p0, p0}, Lnet/nyx/widget/view/RegexEditText;->a(Landroid/text/InputFilter;)V

    return-void
.end method
