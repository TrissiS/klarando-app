.class public final Lc/c/c/c/c;
.super Ljava/lang/Object;
.source "TextColorBuilder.java"


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:I

.field public c:Ljava/lang/Integer;

.field public d:Ljava/lang/Integer;

.field public e:Ljava/lang/Integer;

.field public f:Ljava/lang/Integer;

.field public g:Ljava/lang/Integer;

.field public h:[I

.field public i:I


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Landroid/content/res/TypedArray;Lc/c/c/f/e;)V
    .registers 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/c/c/c/c;->a:Landroid/widget/TextView;

    .line 3
    invoke-interface {p3}, Lc/c/c/f/e;->v()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/c;->b:I

    .line 4
    invoke-interface {p3}, Lc/c/c/f/e;->c0()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_31

    .line 5
    invoke-interface {p3}, Lc/c/c/f/e;->c0()I

    move-result p1

    iget v0, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/c;->c:Ljava/lang/Integer;

    .line 6
    :cond_31
    invoke-interface {p3}, Lc/c/c/f/e;->t()I

    move-result p1

    if-lez p1, :cond_51

    invoke-interface {p3}, Lc/c/c/f/e;->t()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_51

    .line 7
    invoke-interface {p3}, Lc/c/c/f/e;->t()I

    move-result p1

    iget v0, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/c;->d:Ljava/lang/Integer;

    .line 8
    :cond_51
    invoke-interface {p3}, Lc/c/c/f/e;->Z()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_6b

    .line 9
    invoke-interface {p3}, Lc/c/c/f/e;->Z()I

    move-result p1

    iget v0, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/c;->e:Ljava/lang/Integer;

    .line 10
    :cond_6b
    invoke-interface {p3}, Lc/c/c/f/e;->c()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_85

    .line 11
    invoke-interface {p3}, Lc/c/c/f/e;->c()I

    move-result p1

    iget v0, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/c;->f:Ljava/lang/Integer;

    .line 12
    :cond_85
    invoke-interface {p3}, Lc/c/c/f/e;->U()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_9f

    .line 13
    invoke-interface {p3}, Lc/c/c/f/e;->U()I

    move-result p1

    iget v0, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/c;->g:Ljava/lang/Integer;

    .line 14
    :cond_9f
    invoke-interface {p3}, Lc/c/c/f/e;->H()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_106

    invoke-interface {p3}, Lc/c/c/f/e;->I()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_106

    .line 15
    invoke-interface {p3}, Lc/c/c/f/e;->z()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eqz p1, :cond_ea

    const/4 p1, 0x3

    new-array p1, p1, [I

    .line 16
    invoke-interface {p3}, Lc/c/c/f/e;->H()I

    move-result v3

    iget v4, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    aput v3, p1, v0

    .line 17
    invoke-interface {p3}, Lc/c/c/f/e;->z()I

    move-result v3

    iget v4, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    aput v3, p1, v1

    .line 18
    invoke-interface {p3}, Lc/c/c/f/e;->I()I

    move-result v1

    iget v3, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    aput v1, p1, v2

    iput-object p1, p0, Lc/c/c/c/c;->h:[I

    goto :goto_106

    :cond_ea
    new-array p1, v2, [I

    .line 19
    invoke-interface {p3}, Lc/c/c/f/e;->H()I

    move-result v2

    iget v3, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    aput v2, p1, v0

    .line 20
    invoke-interface {p3}, Lc/c/c/f/e;->I()I

    move-result v2

    iget v3, p0, Lc/c/c/c/c;->b:I

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    aput v2, p1, v1

    iput-object p1, p0, Lc/c/c/c/c;->h:[I

    .line 21
    :cond_106
    :goto_106
    invoke-interface {p3}, Lc/c/c/f/e;->B()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/c;->i:I

    return-void
.end method


# virtual methods
.method public a()Landroid/content/res/ColorStateList;
    .registers 10

    .line 4
    iget-object v0, p0, Lc/c/c/c/c;->c:Ljava/lang/Integer;

    if-nez v0, :cond_1b

    iget-object v0, p0, Lc/c/c/c/c;->d:Ljava/lang/Integer;

    if-nez v0, :cond_1b

    iget-object v0, p0, Lc/c/c/c/c;->e:Ljava/lang/Integer;

    if-nez v0, :cond_1b

    iget-object v0, p0, Lc/c/c/c/c;->f:Ljava/lang/Integer;

    if-nez v0, :cond_1b

    iget-object v0, p0, Lc/c/c/c/c;->g:Ljava/lang/Integer;

    if-nez v0, :cond_1b

    .line 5
    iget v0, p0, Lc/c/c/c/c;->b:I

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0

    :cond_1b
    const/4 v0, 0x6

    new-array v1, v0, [[I

    new-array v2, v0, [I

    .line 6
    iget-object v3, p0, Lc/c/c/c/c;->c:Ljava/lang/Integer;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_37

    new-array v6, v4, [I

    const v7, 0x10100a7

    aput v7, v6, v5

    aput-object v6, v1, v5

    .line 7
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v2, v5

    const/4 v3, 0x1

    goto :goto_38

    :cond_37
    const/4 v3, 0x0

    .line 8
    :goto_38
    iget-object v6, p0, Lc/c/c/c/c;->d:Ljava/lang/Integer;

    if-eqz v6, :cond_4d

    new-array v7, v4, [I

    const v8, 0x10100a0

    aput v8, v7, v5

    .line 9
    aput-object v7, v1, v3

    .line 10
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v2, v3

    add-int/lit8 v3, v3, 0x1

    .line 11
    :cond_4d
    iget-object v6, p0, Lc/c/c/c/c;->e:Ljava/lang/Integer;

    if-eqz v6, :cond_62

    new-array v7, v4, [I

    const v8, -0x101009e

    aput v8, v7, v5

    .line 12
    aput-object v7, v1, v3

    .line 13
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v2, v3

    add-int/lit8 v3, v3, 0x1

    .line 14
    :cond_62
    iget-object v6, p0, Lc/c/c/c/c;->f:Ljava/lang/Integer;

    if-eqz v6, :cond_77

    new-array v7, v4, [I

    const v8, 0x101009c

    aput v8, v7, v5

    .line 15
    aput-object v7, v1, v3

    .line 16
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v2, v3

    add-int/lit8 v3, v3, 0x1

    .line 17
    :cond_77
    iget-object v6, p0, Lc/c/c/c/c;->g:Ljava/lang/Integer;

    if-eqz v6, :cond_8c

    new-array v7, v4, [I

    const v8, 0x10100a1

    aput v8, v7, v5

    .line 18
    aput-object v7, v1, v3

    .line 19
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v2, v3

    add-int/lit8 v3, v3, 0x1

    :cond_8c
    new-array v6, v5, [I

    .line 20
    aput-object v6, v1, v3

    .line 21
    iget v6, p0, Lc/c/c/c/c;->b:I

    aput v6, v2, v3

    add-int/2addr v3, v4

    if-ne v3, v0, :cond_98

    goto :goto_a4

    .line 22
    :cond_98
    new-array v0, v3, [[I

    .line 23
    new-array v4, v3, [I

    .line 24
    invoke-static {v1, v5, v0, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    invoke-static {v2, v5, v4, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v0

    move-object v2, v4

    .line 26
    :goto_a4
    new-instance v0, Landroid/content/res/ColorStateList;

    invoke-direct {v0, v1, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v0
.end method

.method public a(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    .registers 5

    .line 3
    iget-object v0, p0, Lc/c/c/c/c;->h:[I

    iget v1, p0, Lc/c/c/c/c;->i:I

    const/4 v2, 0x0

    invoke-static {p1, v0, v2, v1}, Lc/c/c/e/a;->a(Ljava/lang/CharSequence;[I[FI)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/Integer;)Lc/c/c/c/c;
    .registers 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lc/c/c/c/c;->b:I

    .line 2
    invoke-virtual {p0}, Lc/c/c/c/c;->b()V

    return-object p0
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lc/c/c/c/c;->h:[I

    return-void
.end method

.method public c()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/c/c/c/c;->d()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 2
    iget-object v0, p0, Lc/c/c/c/c;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lc/c/c/c/c;->a(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 3
    :cond_14
    iget-object v0, p0, Lc/c/c/c/c;->a:Landroid/widget/TextView;

    invoke-virtual {p0}, Lc/c/c/c/c;->a()Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/c/c/c;->h:[I

    if-eqz v0, :cond_9

    array-length v0, v0

    if-lez v0, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method
