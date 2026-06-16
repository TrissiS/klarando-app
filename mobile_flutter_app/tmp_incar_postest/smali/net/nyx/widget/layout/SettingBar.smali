.class public final Lnet/nyx/widget/layout/SettingBar;
.super Landroid/widget/FrameLayout;
.source "SettingBar.java"


# instance fields
.field public final h:Landroid/widget/LinearLayout;

.field public final i:Landroid/widget/TextView;

.field public final j:Landroid/widget/TextView;

.field public final k:Landroid/view/View;

.field public l:I

.field public m:I

.field public n:I

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/layout/SettingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/layout/SettingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lnet/nyx/widget/layout/SettingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 10

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 5
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p1, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->h:Landroid/widget/LinearLayout;

    .line 6
    new-instance p1, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p1, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    .line 7
    new-instance p1, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p1, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    .line 8
    new-instance p1, Landroid/view/View;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p1, p3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    .line 9
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->h:Landroid/widget/LinearLayout;

    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p4, -0x1

    const/16 v0, 0x10

    const/4 v1, -0x2

    invoke-direct {p3, p4, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, 0x0

    invoke-direct {p1, p3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 11
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 13
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 14
    iput v0, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 15
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, 0x1

    const/16 v2, 0x50

    invoke-direct {v0, p4, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    const p4, 0x800013

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setGravity(I)V

    .line 19
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    const p4, 0x800015

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setGravity(I)V

    .line 20
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 21
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    sget-object p4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 22
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    sget-object p4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 23
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ld/a/d/c;->dp_5:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p4

    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    move-result v0

    invoke-virtual {p1, p4, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 24
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ld/a/d/c;->dp_5:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p4

    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    move-result v0

    invoke-virtual {p1, p4, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 25
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ld/a/d/c;->dp_15:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p4

    float-to-int p4, p4

    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Ld/a/d/c;->dp_12:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Ld/a/d/c;->dp_15:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Ld/a/d/c;->dp_12:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    .line 29
    invoke-virtual {p1, p4, v0, v2, v3}, Landroid/widget/TextView;->setPaddingRelative(IIII)V

    .line 30
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ld/a/d/c;->dp_15:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p4

    float-to-int p4, p4

    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Ld/a/d/c;->dp_12:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Ld/a/d/c;->dp_15:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    .line 33
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Ld/a/d/c;->dp_12:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    float-to-int v3, v3

    .line 34
    invoke-virtual {p1, p4, v0, v2, v3}, Landroid/widget/TextView;->setPaddingRelative(IIII)V

    .line 35
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object p4, Ld/a/d/f;->SettingBar:[I

    invoke-virtual {p1, p2, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 36
    sget p2, Ld/a/d/f;->SettingBar_bar_leftText:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_131

    .line 37
    sget p2, Ld/a/d/f;->SettingBar_bar_leftText:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->a(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    .line 38
    :cond_131
    sget p2, Ld/a/d/f;->SettingBar_bar_rightText:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_142

    .line 39
    sget p2, Ld/a/d/f;->SettingBar_bar_rightText:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->c(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    .line 40
    :cond_142
    sget p2, Ld/a/d/f;->SettingBar_bar_leftTextHint:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_153

    .line 41
    sget p2, Ld/a/d/f;->SettingBar_bar_leftTextHint:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->b(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    .line 42
    :cond_153
    sget p2, Ld/a/d/f;->SettingBar_bar_rightTextHint:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_164

    .line 43
    sget p2, Ld/a/d/f;->SettingBar_bar_rightTextHint:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->d(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    .line 44
    :cond_164
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawableSize:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_175

    .line 45
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawableSize:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->b(I)Lnet/nyx/widget/layout/SettingBar;

    .line 46
    :cond_175
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawableSize:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_186

    .line 47
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawableSize:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->i(I)Lnet/nyx/widget/layout/SettingBar;

    .line 48
    :cond_186
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawableTint:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_197

    .line 49
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawableTint:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->c(I)Lnet/nyx/widget/layout/SettingBar;

    .line 50
    :cond_197
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawableTint:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_1a8

    .line 51
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawableTint:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->j(I)Lnet/nyx/widget/layout/SettingBar;

    .line 52
    :cond_1a8
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawablePadding:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_1b7

    .line 53
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawablePadding:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    goto :goto_1c2

    .line 54
    :cond_1b7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p4, Ld/a/d/c;->dp_10:I

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    .line 55
    :goto_1c2
    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->a(I)Lnet/nyx/widget/layout/SettingBar;

    .line 56
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawablePadding:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_1d4

    .line 57
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawablePadding:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    goto :goto_1df

    .line 58
    :cond_1d4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p4, Ld/a/d/c;->dp_10:I

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    .line 59
    :goto_1df
    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->h(I)Lnet/nyx/widget/layout/SettingBar;

    .line 60
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawable:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_1f3

    .line 61
    sget p2, Ld/a/d/f;->SettingBar_bar_leftDrawable:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->a(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;

    .line 62
    :cond_1f3
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawable:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_204

    .line 63
    sget p2, Ld/a/d/f;->SettingBar_bar_rightDrawable:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->c(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;

    .line 64
    :cond_204
    sget p2, Ld/a/d/f;->SettingBar_bar_leftTextColor:I

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p4

    sget v0, Ld/a/d/b;->black80:I

    invoke-static {p4, v0}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result p4

    invoke-virtual {p1, p2, p4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->d(I)Lnet/nyx/widget/layout/SettingBar;

    .line 65
    sget p2, Ld/a/d/f;->SettingBar_bar_rightTextColor:I

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p4

    sget v0, Ld/a/d/b;->black60:I

    invoke-static {p4, v0}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result p4

    invoke-virtual {p1, p2, p4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->l(I)Lnet/nyx/widget/layout/SettingBar;

    .line 66
    sget p2, Ld/a/d/f;->SettingBar_bar_leftTextSize:I

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ld/a/d/c;->sp_14:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p4

    float-to-int p4, p4

    invoke-virtual {p1, p2, p4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p0, p3, p2}, Lnet/nyx/widget/layout/SettingBar;->a(IF)Lnet/nyx/widget/layout/SettingBar;

    .line 67
    sget p2, Ld/a/d/f;->SettingBar_bar_rightTextSize:I

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ld/a/d/c;->sp_14:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p4

    float-to-int p4, p4

    invoke-virtual {p1, p2, p4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p0, p3, p2}, Lnet/nyx/widget/layout/SettingBar;->b(IF)Lnet/nyx/widget/layout/SettingBar;

    .line 68
    sget p2, Ld/a/d/f;->SettingBar_bar_lineDrawable:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_266

    .line 69
    sget p2, Ld/a/d/f;->SettingBar_bar_lineDrawable:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->b(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;

    goto :goto_271

    .line 70
    :cond_266
    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    const p4, -0x131314

    invoke-direct {p2, p4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->b(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;

    .line 71
    :goto_271
    sget p2, Ld/a/d/f;->SettingBar_bar_lineVisible:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_282

    .line 72
    sget p2, Ld/a/d/f;->SettingBar_bar_lineVisible:I

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->a(Z)Lnet/nyx/widget/layout/SettingBar;

    .line 73
    :cond_282
    sget p2, Ld/a/d/f;->SettingBar_bar_lineSize:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_293

    .line 74
    sget p2, Ld/a/d/f;->SettingBar_bar_lineSize:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->f(I)Lnet/nyx/widget/layout/SettingBar;

    .line 75
    :cond_293
    sget p2, Ld/a/d/f;->SettingBar_bar_lineMargin:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_2a4

    .line 76
    sget p2, Ld/a/d/f;->SettingBar_bar_lineMargin:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/SettingBar;->e(I)Lnet/nyx/widget/layout/SettingBar;

    .line 77
    :cond_2a4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-nez p2, :cond_317

    .line 78
    new-instance p2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {p2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array p4, v1, [I

    const v0, 0x10100a7

    aput v0, p4, p3

    .line 79
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Ld/a/d/b;->black5:I

    invoke-static {v2, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p2, p4, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array p4, v1, [I

    const v0, 0x10100a1

    aput v0, p4, p3

    .line 80
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Ld/a/d/b;->black5:I

    invoke-static {v2, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p2, p4, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array p4, v1, [I

    const v0, 0x101009c

    aput v0, p4, p3

    .line 81
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Ld/a/d/b;->black5:I

    invoke-static {v2, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p2, p4, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array p4, p3, [I

    .line 82
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Ld/a/d/b;->white:I

    invoke-static {v2, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p2, p4, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 83
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 84
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 85
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 86
    :cond_317
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->h:Landroid/widget/LinearLayout;

    iget-object p2, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 88
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->h:Landroid/widget/LinearLayout;

    iget-object p2, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 89
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->h:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 90
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    invoke-virtual {p0, p1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    return-void
.end method


# virtual methods
.method public a(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 5
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    return-object p0
.end method

.method public a(IF)Lnet/nyx/widget/layout/SettingBar;
    .registers 4

    .line 6
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-object p0
.end method

.method public a(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;
    .registers 4

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3
    iget p1, p0, Lnet/nyx/widget/layout/SettingBar;->n:I

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/SettingBar;->b(I)Lnet/nyx/widget/layout/SettingBar;

    .line 4
    iget p1, p0, Lnet/nyx/widget/layout/SettingBar;->l:I

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/SettingBar;->c(I)Lnet/nyx/widget/layout/SettingBar;

    return-object p0
.end method

.method public a(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public a(Z)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 7
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    if-eqz p1, :cond_6

    const/4 p1, 0x0

    goto :goto_8

    :cond_6
    const/16 p1, 0x8

    :goto_8
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-object p0
.end method

.method public b(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 5

    .line 2
    iput p1, p0, Lnet/nyx/widget/layout/SettingBar;->n:I

    .line 3
    invoke-virtual {p0}, Lnet/nyx/widget/layout/SettingBar;->getLeftDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_20

    const/4 v1, 0x0

    if-lez p1, :cond_f

    .line 4
    invoke-virtual {v0, v1, v1, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_1a

    .line 5
    :cond_f
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {v0, v1, v1, p1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 6
    :goto_1a
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_20
    return-object p0
.end method

.method public b(IF)Lnet/nyx/widget/layout/SettingBar;
    .registers 4

    .line 7
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-object p0
.end method

.method public b(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 8
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-object p0
.end method

.method public b(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public c(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 4

    .line 5
    iput p1, p0, Lnet/nyx/widget/layout/SettingBar;->l:I

    .line 6
    invoke-virtual {p0}, Lnet/nyx/widget/layout/SettingBar;->getLeftDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_12

    if-eqz p1, :cond_12

    .line 7
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 8
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_12
    return-object p0
.end method

.method public c(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;
    .registers 4

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, p1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3
    iget p1, p0, Lnet/nyx/widget/layout/SettingBar;->o:I

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/SettingBar;->i(I)Lnet/nyx/widget/layout/SettingBar;

    .line 4
    iget p1, p0, Lnet/nyx/widget/layout/SettingBar;->m:I

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/SettingBar;->j(I)Lnet/nyx/widget/layout/SettingBar;

    return-object p0
.end method

.method public c(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public d(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-object p0
.end method

.method public d(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public e(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    if-nez v0, :cond_e

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    .line 3
    :cond_e
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 4
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 5
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public f(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    if-nez v0, :cond_e

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    .line 3
    :cond_e
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 4
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public g(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/SettingBar;->c(Landroid/graphics/drawable/Drawable;)Lnet/nyx/widget/layout/SettingBar;

    return-object p0
.end method

.method public getLeftDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getLeftText()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getLeftView()Landroid/widget/TextView;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->i:Landroid/widget/TextView;

    return-object v0
.end method

.method public getLineView()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->k:Landroid/view/View;

    return-object v0
.end method

.method public getMainLayout()Landroid/widget/LinearLayout;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->h:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public getRightDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getRightText()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getRightView()Landroid/widget/TextView;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    return-object v0
.end method

.method public h(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    return-object p0
.end method

.method public i(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 5

    .line 1
    iput p1, p0, Lnet/nyx/widget/layout/SettingBar;->o:I

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/layout/SettingBar;->getRightDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_20

    const/4 v1, 0x0

    if-lez p1, :cond_f

    .line 3
    invoke-virtual {v0, v1, v1, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_1a

    .line 4
    :cond_f
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {v0, v1, v1, p1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 5
    :goto_1a
    iget-object p1, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v1, v0, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_20
    return-object p0
.end method

.method public j(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 4

    .line 1
    iput p1, p0, Lnet/nyx/widget/layout/SettingBar;->m:I

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/layout/SettingBar;->getRightDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_12

    if-eqz p1, :cond_12

    .line 3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 4
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_12
    return-object p0
.end method

.method public k(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/SettingBar;->c(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    return-object p0
.end method

.method public l(I)Lnet/nyx/widget/layout/SettingBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/SettingBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-object p0
.end method
