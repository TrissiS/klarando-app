.class public Lcom/hjq/bar/TitleBar;
.super Landroid/widget/FrameLayout;
.source "TitleBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLayoutChangeListener;


# static fields
.field public static B:Lc/c/a/a;


# instance fields
.field public A:I

.field public final h:Lc/c/a/a;

.field public i:Lc/c/a/b;

.field public final j:Landroid/widget/TextView;

.field public final k:Landroid/widget/TextView;

.field public final l:Landroid/widget/TextView;

.field public final m:Landroid/view/View;

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/hjq/bar/TitleBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/hjq/bar/TitleBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    .line 4
    iput p3, p0, Lcom/hjq/bar/TitleBar;->A:I

    .line 5
    sget-object v0, Lcom/hjq/bar/TitleBar;->B:Lc/c/a/a;

    if-nez v0, :cond_11

    .line 6
    new-instance v0, Lc/c/a/i/b;

    invoke-direct {v0}, Lc/c/a/i/b;-><init>()V

    sput-object v0, Lcom/hjq/bar/TitleBar;->B:Lc/c/a/a;

    .line 7
    :cond_11
    sget-object v0, Lc/c/a/f;->TitleBar:[I

    sget v1, Lc/c/a/e;->TitleBarStyle:I

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 8
    sget v0, Lc/c/a/f;->TitleBar_barStyle:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_4c

    const/16 v1, 0x20

    if-eq v0, v1, :cond_44

    const/16 v1, 0x30

    if-eq v0, v1, :cond_3c

    const/16 v1, 0x40

    if-eq v0, v1, :cond_34

    .line 9
    sget-object v0, Lcom/hjq/bar/TitleBar;->B:Lc/c/a/a;

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    goto :goto_53

    .line 10
    :cond_34
    new-instance v0, Lc/c/a/i/d;

    invoke-direct {v0}, Lc/c/a/i/d;-><init>()V

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    goto :goto_53

    .line 11
    :cond_3c
    new-instance v0, Lc/c/a/i/e;

    invoke-direct {v0}, Lc/c/a/i/e;-><init>()V

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    goto :goto_53

    .line 12
    :cond_44
    new-instance v0, Lc/c/a/i/c;

    invoke-direct {v0}, Lc/c/a/i/c;-><init>()V

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    goto :goto_53

    .line 13
    :cond_4c
    new-instance v0, Lc/c/a/i/b;

    invoke-direct {v0}, Lc/c/a/i/b;-><init>()V

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 14
    :goto_53
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->D(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    .line 15
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->b(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    .line 16
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->r(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    .line 17
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->y(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    .line 18
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, 0x1

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v1, v3, v4, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const v5, 0x800003

    invoke-direct {v1, v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const v5, 0x800005

    invoke-direct {v1, v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v3, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v3, p1}, Lc/c/a/a;->I(Landroid/content/Context;)I

    move-result v3

    const/16 v5, 0x50

    invoke-direct {v1, v4, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    sget v0, Lc/c/a/f;->TitleBar_titleIconGravity:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->J(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->k(I)Lcom/hjq/bar/TitleBar;

    .line 23
    sget v0, Lc/c/a/f;->TitleBar_leftIconGravity:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->p(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->a(I)Lcom/hjq/bar/TitleBar;

    .line 24
    sget v0, Lc/c/a/f;->TitleBar_rightIconGravity:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->z(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->f(I)Lcom/hjq/bar/TitleBar;

    .line 25
    sget v0, Lc/c/a/f;->TitleBar_titleIconWidth:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->B(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    sget v1, Lc/c/a/f;->TitleBar_titleIconHeight:I

    iget-object v3, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 26
    invoke-interface {v3, p1}, Lc/c/a/a;->q(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 27
    invoke-virtual {p0, v0, v1}, Lcom/hjq/bar/TitleBar;->d(II)Lcom/hjq/bar/TitleBar;

    .line 28
    sget v0, Lc/c/a/f;->TitleBar_leftIconWidth:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->d(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    sget v1, Lc/c/a/f;->TitleBar_leftIconHeight:I

    iget-object v3, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 29
    invoke-interface {v3, p1}, Lc/c/a/a;->c(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/hjq/bar/TitleBar;->b(II)Lcom/hjq/bar/TitleBar;

    .line 31
    sget v0, Lc/c/a/f;->TitleBar_rightIconWidth:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->m(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    sget v1, Lc/c/a/f;->TitleBar_rightIconHeight:I

    iget-object v3, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 32
    invoke-interface {v3, p1}, Lc/c/a/a;->u(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/hjq/bar/TitleBar;->c(II)Lcom/hjq/bar/TitleBar;

    .line 34
    sget v0, Lc/c/a/f;->TitleBar_titleIconPadding:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->a(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->l(I)Lcom/hjq/bar/TitleBar;

    .line 35
    sget v0, Lc/c/a/f;->TitleBar_leftIconPadding:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->i(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->b(I)Lcom/hjq/bar/TitleBar;

    .line 36
    sget v0, Lc/c/a/f;->TitleBar_rightIconPadding:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->e(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->g(I)Lcom/hjq/bar/TitleBar;

    .line 37
    sget v0, Lc/c/a/f;->TitleBar_title:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_179

    .line 38
    sget v0, Lc/c/a/f;->TitleBar_title:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/d;->bar_string_placeholder:I

    if-eq v0, v1, :cond_170

    sget v0, Lc/c/a/f;->TitleBar_title:I

    .line 39
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_176

    :cond_170
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->f(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 40
    :goto_176
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->c(Ljava/lang/CharSequence;)Lcom/hjq/bar/TitleBar;

    .line 41
    :cond_179
    sget v0, Lc/c/a/f;->TitleBar_leftTitle:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_19b

    .line 42
    sget v0, Lc/c/a/f;->TitleBar_leftTitle:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/d;->bar_string_placeholder:I

    if-eq v0, v1, :cond_192

    sget v0, Lc/c/a/f;->TitleBar_leftTitle:I

    .line 43
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_198

    :cond_192
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->A(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 44
    :goto_198
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->a(Ljava/lang/CharSequence;)Lcom/hjq/bar/TitleBar;

    .line 45
    :cond_19b
    sget v0, Lc/c/a/f;->TitleBar_rightTitle:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_1bd

    .line 46
    sget v0, Lc/c/a/f;->TitleBar_rightTitle:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/d;->bar_string_placeholder:I

    if-eq v0, v1, :cond_1b4

    sget v0, Lc/c/a/f;->TitleBar_rightTitle:I

    .line 47
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1ba

    :cond_1b4
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->t(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 48
    :goto_1ba
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->b(Ljava/lang/CharSequence;)Lcom/hjq/bar/TitleBar;

    .line 49
    :cond_1bd
    sget v0, Lc/c/a/f;->TitleBar_titleIconTint:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_1ce

    .line 50
    sget v0, Lc/c/a/f;->TitleBar_titleIconTint:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->m(I)Lcom/hjq/bar/TitleBar;

    .line 51
    :cond_1ce
    sget v0, Lc/c/a/f;->TitleBar_leftIconTint:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_1df

    .line 52
    sget v0, Lc/c/a/f;->TitleBar_leftIconTint:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->c(I)Lcom/hjq/bar/TitleBar;

    .line 53
    :cond_1df
    sget v0, Lc/c/a/f;->TitleBar_rightIconTint:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_1f0

    .line 54
    sget v0, Lc/c/a/f;->TitleBar_rightIconTint:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->h(I)Lcom/hjq/bar/TitleBar;

    .line 55
    :cond_1f0
    sget v0, Lc/c/a/f;->TitleBar_titleIcon:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_205

    .line 56
    sget v0, Lc/c/a/f;->TitleBar_titleIcon:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-static {p1, v0}, Lc/c/a/h;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->f(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;

    .line 57
    :cond_205
    sget v0, Lc/c/a/f;->TitleBar_leftIcon:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_22b

    .line 58
    sget v0, Lc/c/a/f;->TitleBar_leftIcon:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/c;->bar_drawable_placeholder:I

    if-eq v0, v1, :cond_222

    sget v0, Lc/c/a/f;->TitleBar_leftIcon:I

    .line 59
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-static {p1, v0}, Lc/c/a/h;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_228

    :cond_222
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 60
    invoke-interface {v0, p1}, Lc/c/a/a;->k(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 61
    :goto_228
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->b(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;

    .line 62
    :cond_22b
    sget v0, Lc/c/a/f;->TitleBar_rightIcon:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_240

    .line 63
    sget v0, Lc/c/a/f;->TitleBar_rightIcon:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-static {p1, v0}, Lc/c/a/h;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->e(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;

    .line 64
    :cond_240
    sget v0, Lc/c/a/f;->TitleBar_titleColor:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_24f

    sget v0, Lc/c/a/f;->TitleBar_titleColor:I

    .line 65
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_255

    :cond_24f
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 66
    invoke-interface {v0, p1}, Lc/c/a/a;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 67
    :goto_255
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->c(Landroid/content/res/ColorStateList;)Lcom/hjq/bar/TitleBar;

    .line 68
    sget v0, Lc/c/a/f;->TitleBar_leftTitleColor:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_267

    sget v0, Lc/c/a/f;->TitleBar_leftTitleColor:I

    .line 69
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_26d

    :cond_267
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 70
    invoke-interface {v0, p1}, Lc/c/a/a;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 71
    :goto_26d
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->a(Landroid/content/res/ColorStateList;)Lcom/hjq/bar/TitleBar;

    .line 72
    sget v0, Lc/c/a/f;->TitleBar_rightTitleColor:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_27f

    sget v0, Lc/c/a/f;->TitleBar_rightTitleColor:I

    .line 73
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_285

    :cond_27f
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 74
    invoke-interface {v0, p1}, Lc/c/a/a;->K(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 75
    :goto_285
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->b(Landroid/content/res/ColorStateList;)Lcom/hjq/bar/TitleBar;

    .line 76
    sget v0, Lc/c/a/f;->TitleBar_titleSize:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_298

    sget v0, Lc/c/a/f;->TitleBar_titleSize:I

    .line 77
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    int-to-float v0, v0

    goto :goto_29e

    :cond_298
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 78
    invoke-interface {v0, p1}, Lc/c/a/a;->o(Landroid/content/Context;)F

    move-result v0

    .line 79
    :goto_29e
    invoke-virtual {p0, p3, v0}, Lcom/hjq/bar/TitleBar;->c(IF)Lcom/hjq/bar/TitleBar;

    .line 80
    sget v0, Lc/c/a/f;->TitleBar_leftTitleSize:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_2b1

    sget v0, Lc/c/a/f;->TitleBar_leftTitleSize:I

    .line 81
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    int-to-float v0, v0

    goto :goto_2b7

    :cond_2b1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 82
    invoke-interface {v0, p1}, Lc/c/a/a;->s(Landroid/content/Context;)F

    move-result v0

    .line 83
    :goto_2b7
    invoke-virtual {p0, p3, v0}, Lcom/hjq/bar/TitleBar;->a(IF)Lcom/hjq/bar/TitleBar;

    .line 84
    sget v0, Lc/c/a/f;->TitleBar_rightTitleSize:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_2ca

    sget v0, Lc/c/a/f;->TitleBar_rightTitleSize:I

    .line 85
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    int-to-float v0, v0

    goto :goto_2d0

    :cond_2ca
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 86
    invoke-interface {v0, p1}, Lc/c/a/a;->v(Landroid/content/Context;)F

    move-result v0

    .line 87
    :goto_2d0
    invoke-virtual {p0, p3, v0}, Lcom/hjq/bar/TitleBar;->b(IF)Lcom/hjq/bar/TitleBar;

    .line 88
    sget v0, Lc/c/a/f;->TitleBar_titleStyle:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_2e2

    sget v0, Lc/c/a/f;->TitleBar_titleStyle:I

    .line 89
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    goto :goto_2e8

    :cond_2e2
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 90
    invoke-interface {v0, p1}, Lc/c/a/a;->h(Landroid/content/Context;)I

    move-result v0

    .line 91
    :goto_2e8
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->n(I)Lcom/hjq/bar/TitleBar;

    .line 92
    sget v0, Lc/c/a/f;->TitleBar_leftTitleStyle:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_2fa

    sget v0, Lc/c/a/f;->TitleBar_leftTitleStyle:I

    .line 93
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    goto :goto_300

    :cond_2fa
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 94
    invoke-interface {v0, p1}, Lc/c/a/a;->C(Landroid/content/Context;)I

    move-result v0

    .line 95
    :goto_300
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->d(I)Lcom/hjq/bar/TitleBar;

    .line 96
    sget v0, Lc/c/a/f;->TitleBar_rightTitleStyle:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_312

    sget v0, Lc/c/a/f;->TitleBar_rightTitleStyle:I

    .line 97
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    goto :goto_318

    :cond_312
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 98
    invoke-interface {v0, p1}, Lc/c/a/a;->l(Landroid/content/Context;)I

    move-result v0

    .line 99
    :goto_318
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->i(I)Lcom/hjq/bar/TitleBar;

    .line 100
    sget v0, Lc/c/a/f;->TitleBar_titleGravity:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_32c

    .line 101
    sget v0, Lc/c/a/f;->TitleBar_titleGravity:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->j(I)Lcom/hjq/bar/TitleBar;

    .line 102
    :cond_32c
    sget v0, Lc/c/a/f;->TitleBar_android_background:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_347

    .line 103
    sget v0, Lc/c/a/f;->TitleBar_android_background:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/c;->bar_drawable_placeholder:I

    if-ne v0, v1, :cond_347

    .line 104
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->x(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p0, v0}, Lc/c/a/h;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 105
    :cond_347
    sget v0, Lc/c/a/f;->TitleBar_leftBackground:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_369

    .line 106
    sget v0, Lc/c/a/f;->TitleBar_leftBackground:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/c;->bar_drawable_placeholder:I

    if-eq v0, v1, :cond_360

    sget v0, Lc/c/a/f;->TitleBar_leftBackground:I

    .line 107
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_366

    :cond_360
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->H(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 108
    :goto_366
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->a(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;

    .line 109
    :cond_369
    sget v0, Lc/c/a/f;->TitleBar_rightBackground:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_38b

    .line 110
    sget v0, Lc/c/a/f;->TitleBar_rightBackground:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/c;->bar_drawable_placeholder:I

    if-eq v0, v1, :cond_382

    sget v0, Lc/c/a/f;->TitleBar_rightBackground:I

    .line 111
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_388

    :cond_382
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->E(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 112
    :goto_388
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->d(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;

    .line 113
    :cond_38b
    sget v0, Lc/c/a/f;->TitleBar_lineVisible:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v1, p1}, Lc/c/a/a;->j(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->a(Z)Lcom/hjq/bar/TitleBar;

    .line 114
    sget v0, Lc/c/a/f;->TitleBar_lineDrawable:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_3bc

    .line 115
    sget v0, Lc/c/a/f;->TitleBar_lineDrawable:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    sget v1, Lc/c/a/c;->bar_drawable_placeholder:I

    if-eq v0, v1, :cond_3b3

    sget v0, Lc/c/a/f;->TitleBar_lineDrawable:I

    .line 116
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_3b9

    :cond_3b3
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    invoke-interface {v0, p1}, Lc/c/a/a;->n(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 117
    :goto_3b9
    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->c(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;

    .line 118
    :cond_3bc
    sget v0, Lc/c/a/f;->TitleBar_lineSize:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_3cd

    .line 119
    sget v0, Lc/c/a/f;->TitleBar_lineSize:I

    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/hjq/bar/TitleBar;->e(I)Lcom/hjq/bar/TitleBar;

    .line 120
    :cond_3cd
    sget v0, Lc/c/a/f;->TitleBar_childPaddingHorizontal:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 121
    invoke-interface {v1, p1}, Lc/c/a/a;->g(Landroid/content/Context;)I

    move-result v1

    .line 122
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lcom/hjq/bar/TitleBar;->n:I

    .line 123
    sget v0, Lc/c/a/f;->TitleBar_childPaddingVertical:I

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    .line 124
    invoke-interface {v1, p1}, Lc/c/a/a;->w(Landroid/content/Context;)I

    move-result p1

    .line 125
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/hjq/bar/TitleBar;->o:I

    .line 126
    iget v0, p0, Lcom/hjq/bar/TitleBar;->n:I

    invoke-virtual {p0, v0, p1}, Lcom/hjq/bar/TitleBar;->a(II)Lcom/hjq/bar/TitleBar;

    .line 127
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 128
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 129
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 130
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    const/4 p2, 0x2

    invoke-virtual {p0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 131
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    const/4 p2, 0x3

    invoke-virtual {p0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 132
    invoke-virtual {p0, p0}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 133
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isInEditMode()Z

    move-result p1

    if-eqz p1, :cond_440

    .line 134
    invoke-virtual {p0, p3, p3}, Landroid/widget/FrameLayout;->measure(II)V

    .line 135
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p1, p3, p3}, Landroid/widget/TextView;->measure(II)V

    .line 136
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1, p3, p3}, Landroid/widget/TextView;->measure(II)V

    .line 137
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p1, p3, p3}, Landroid/widget/TextView;->measure(II)V

    .line 138
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p1

    iget-object p2, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget p2, p0, Lcom/hjq/bar/TitleBar;->n:I

    add-int/2addr p1, p2

    .line 139
    iget-object p2, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 140
    invoke-virtual {p2, p1, p3, p1, p3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :cond_440
    return-void
.end method

.method public static setDefaultStyle(Lc/c/a/a;)V
    .registers 1

    .line 1
    sput-object p0, Lcom/hjq/bar/TitleBar;->B:Lc/c/a/a;

    return-void
.end method


# virtual methods
.method public a(I)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 8
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getLeftIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 9
    iput p1, p0, Lcom/hjq/bar/TitleBar;->v:I

    if-eqz v0, :cond_d

    .line 10
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-static {v1, v0, p1}, Lc/c/a/h;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V

    :cond_d
    return-object p0
.end method

.method public a(IF)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 7
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-object p0
.end method

.method public a(II)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 13
    iput p1, p0, Lcom/hjq/bar/TitleBar;->n:I

    .line 14
    iput p2, p0, Lcom/hjq/bar/TitleBar;->o:I

    .line 15
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2, p1, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 16
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2, p1, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 17
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2, p1, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object p0
.end method

.method public a(Landroid/content/res/ColorStateList;)Lcom/hjq/bar/TitleBar;
    .registers 3

    if-eqz p1, :cond_7

    .line 6
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-object p0
.end method

.method public a(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 11
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lc/c/a/h;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-object p0
.end method

.method public a(Lc/c/a/b;)Lcom/hjq/bar/TitleBar;
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/hjq/bar/TitleBar;->i:Lc/c/a/b;

    .line 2
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p0
.end method

.method public a(Ljava/lang/CharSequence;)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 5
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public a(Z)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 12
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    if-eqz p1, :cond_6

    const/4 p1, 0x0

    goto :goto_7

    :cond_6
    const/4 p1, 0x4

    :goto_7
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-object p0
.end method

.method public b(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 10
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    return-object p0
.end method

.method public b(IF)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 3
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-object p0
.end method

.method public b(II)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 7
    iput p1, p0, Lcom/hjq/bar/TitleBar;->p:I

    .line 8
    iput p2, p0, Lcom/hjq/bar/TitleBar;->q:I

    .line 9
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getLeftIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;II)V

    return-object p0
.end method

.method public b(Landroid/content/res/ColorStateList;)Lcom/hjq/bar/TitleBar;
    .registers 3

    if-eqz p1, :cond_7

    .line 2
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-object p0
.end method

.method public b(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 4
    iget v0, p0, Lcom/hjq/bar/TitleBar;->y:I

    invoke-static {p1, v0}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;I)V

    .line 5
    iget v0, p0, Lcom/hjq/bar/TitleBar;->p:I

    iget v1, p0, Lcom/hjq/bar/TitleBar;->q:I

    invoke-static {p1, v0, v1}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;II)V

    .line 6
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    iget v1, p0, Lcom/hjq/bar/TitleBar;->v:I

    invoke-static {v0, p1, v1}, Lc/c/a/h;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public b(Ljava/lang/CharSequence;)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public c(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 7
    iput p1, p0, Lcom/hjq/bar/TitleBar;->y:I

    .line 8
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getLeftIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, p1}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public c(IF)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 3
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-object p0
.end method

.method public c(II)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 4
    iput p1, p0, Lcom/hjq/bar/TitleBar;->t:I

    .line 5
    iput p2, p0, Lcom/hjq/bar/TitleBar;->u:I

    .line 6
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getRightIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;II)V

    return-object p0
.end method

.method public c(Landroid/content/res/ColorStateList;)Lcom/hjq/bar/TitleBar;
    .registers 3

    if-eqz p1, :cond_7

    .line 2
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-object p0
.end method

.method public c(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 9
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    invoke-static {v0, p1}, Lc/c/a/h;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-object p0
.end method

.method public c(Ljava/lang/CharSequence;)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public d(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lc/c/a/h;->b(Landroid/widget/TextView;I)V

    return-object p0
.end method

.method public d(II)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 2
    iput p1, p0, Lcom/hjq/bar/TitleBar;->r:I

    .line 3
    iput p2, p0, Lcom/hjq/bar/TitleBar;->s:I

    .line 4
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getTitleIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;II)V

    return-object p0
.end method

.method public d(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 5
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lc/c/a/h;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-object p0
.end method

.method public e(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 4
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 5
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 6
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public e(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 1
    iget v0, p0, Lcom/hjq/bar/TitleBar;->A:I

    invoke-static {p1, v0}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;I)V

    .line 2
    iget v0, p0, Lcom/hjq/bar/TitleBar;->t:I

    iget v1, p0, Lcom/hjq/bar/TitleBar;->u:I

    invoke-static {p1, v0, v1}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;II)V

    .line 3
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    iget v1, p0, Lcom/hjq/bar/TitleBar;->x:I

    invoke-static {v0, p1, v1}, Lc/c/a/h;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public f(I)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 4
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getRightIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 5
    iput p1, p0, Lcom/hjq/bar/TitleBar;->x:I

    if-eqz v0, :cond_d

    .line 6
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-static {v1, v0, p1}, Lc/c/a/h;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V

    :cond_d
    return-object p0
.end method

.method public f(Landroid/graphics/drawable/Drawable;)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 1
    iget v0, p0, Lcom/hjq/bar/TitleBar;->z:I

    invoke-static {p1, v0}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;I)V

    .line 2
    iget v0, p0, Lcom/hjq/bar/TitleBar;->r:I

    iget v1, p0, Lcom/hjq/bar/TitleBar;->s:I

    invoke-static {p1, v0, v1}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;II)V

    .line 3
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    iget v1, p0, Lcom/hjq/bar/TitleBar;->w:I

    invoke-static {v0, p1, v1}, Lc/c/a/h;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public g(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    return-object p0
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .registers 4

    .line 2
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public getCurrentStyle()Lc/c/a/a;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->h:Lc/c/a/a;

    return-object v0
.end method

.method public getLeftIcon()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    iget v1, p0, Lcom/hjq/bar/TitleBar;->v:I

    invoke-static {v0, v1}, Lc/c/a/h;->a(Landroid/widget/TextView;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getLeftTitle()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getLeftView()Landroid/widget/TextView;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    return-object v0
.end method

.method public getLineView()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->m:Landroid/view/View;

    return-object v0
.end method

.method public getRightIcon()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    iget v1, p0, Lcom/hjq/bar/TitleBar;->x:I

    invoke-static {v0, v1}, Lc/c/a/h;->a(Landroid/widget/TextView;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getRightTitle()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getRightView()Landroid/widget/TextView;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTitleIcon()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    iget v1, p0, Lcom/hjq/bar/TitleBar;->w:I

    invoke-static {v0, v1}, Lc/c/a/h;->a(Landroid/widget/TextView;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getTitleView()Landroid/widget/TextView;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    return-object v0
.end method

.method public h(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iput p1, p0, Lcom/hjq/bar/TitleBar;->A:I

    .line 2
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getRightIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, p1}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public i(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lc/c/a/h;->b(Landroid/widget/TextView;I)V

    return-object p0
.end method

.method public j(I)Lcom/hjq/bar/TitleBar;
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lc/c/a/h;->a(Landroid/view/View;I)I

    move-result p1

    const-string v0, "TitleBar"

    const/4 v1, 0x3

    if-ne p1, v1, :cond_24

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lc/c/a/h;->a(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    goto :goto_18

    :cond_16
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    :goto_18
    invoke-static {v1}, Lc/c/a/h;->a(Landroid/widget/TextView;)Z

    move-result v1

    if-eqz v1, :cond_24

    const-string p1, "Title center of gravity for the left, the left title can not have content"

    .line 3
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    :cond_24
    const/4 v1, 0x5

    if-ne p1, v1, :cond_42

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lc/c/a/h;->a(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_34

    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    goto :goto_36

    :cond_34
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    :goto_36
    invoke-static {v1}, Lc/c/a/h;->a(Landroid/widget/TextView;)Z

    move-result v1

    if-eqz v1, :cond_42

    const-string p1, "Title center of gravity for the right, the right title can not have content"

    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    .line 6
    :cond_42
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 7
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 8
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public k(I)Lcom/hjq/bar/TitleBar;
    .registers 4

    .line 1
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getTitleIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 2
    iput p1, p0, Lcom/hjq/bar/TitleBar;->w:I

    if-eqz v0, :cond_d

    .line 3
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-static {v1, v0, p1}, Lc/c/a/h;->a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V

    :cond_d
    return-object p0
.end method

.method public l(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    return-object p0
.end method

.method public m(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iput p1, p0, Lcom/hjq/bar/TitleBar;->z:I

    .line 2
    invoke-virtual {p0}, Lcom/hjq/bar/TitleBar;->getTitleIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, p1}, Lc/c/a/h;->a(Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public n(I)Lcom/hjq/bar/TitleBar;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lc/c/a/h;->b(Landroid/widget/TextView;I)V

    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar;->i:Lc/c/a/b;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    if-ne p1, v1, :cond_d

    .line 3
    invoke-interface {v0, p1}, Lc/c/a/b;->onLeftClick(Landroid/view/View;)V

    goto :goto_1c

    .line 4
    :cond_d
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    if-ne p1, v1, :cond_15

    .line 5
    invoke-interface {v0, p1}, Lc/c/a/b;->onRightClick(Landroid/view/View;)V

    goto :goto_1c

    .line 6
    :cond_15
    iget-object v1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    if-ne p1, v1, :cond_1c

    .line 7
    invoke-interface {v0, p1}, Lc/c/a/b;->a(Landroid/view/View;)V

    :cond_1c
    :goto_1c
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 1
    invoke-virtual {p0, p0}, Landroid/widget/FrameLayout;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 2
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getMaxWidth()I

    move-result p1

    const p3, 0x7fffffff

    if-eq p1, p3, :cond_55

    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    .line 3
    invoke-virtual {p1}, Landroid/widget/TextView;->getMaxWidth()I

    move-result p1

    if-eq p1, p3, :cond_55

    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    .line 4
    invoke-virtual {p1}, Landroid/widget/TextView;->getMaxWidth()I

    move-result p1

    if-eq p1, p3, :cond_55

    .line 5
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 6
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 7
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 8
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    const/4 p5, 0x0

    invoke-static {p5, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p6

    .line 9
    invoke-static {p5, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p7

    .line 10
    invoke-virtual {p1, p6, p7}, Landroid/widget/TextView;->measure(II)V

    .line 11
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-static {p5, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p6

    .line 12
    invoke-static {p5, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p7

    .line 13
    invoke-virtual {p1, p6, p7}, Landroid/widget/TextView;->measure(II)V

    .line 14
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-static {p5, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p6

    .line 15
    invoke-static {p5, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p5

    .line 16
    invoke-virtual {p1, p6, p5}, Landroid/widget/TextView;->measure(II)V

    :cond_55
    sub-int/2addr p4, p2

    .line 17
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p1

    iget-object p2, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    mul-int/lit8 p2, p1, 0x2

    .line 18
    iget-object p5, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p5}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p5

    add-int/2addr p5, p2

    if-lt p5, p4, :cond_9a

    .line 19
    div-int/lit8 p3, p4, 0x3

    if-le p1, p3, :cond_89

    .line 20
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    div-int/lit8 p2, p4, 0x4

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 21
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    div-int/lit8 p4, p4, 0x2

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 22
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxWidth(I)V

    goto :goto_c1

    .line 23
    :cond_89
    iget-object p3, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 24
    iget-object p3, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    sub-int/2addr p4, p2

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 25
    iget-object p2, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    goto :goto_c1

    .line 26
    :cond_9a
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getMaxWidth()I

    move-result p1

    if-eq p1, p3, :cond_c1

    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    .line 27
    invoke-virtual {p1}, Landroid/widget/TextView;->getMaxWidth()I

    move-result p1

    if-eq p1, p3, :cond_c1

    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    .line 28
    invoke-virtual {p1}, Landroid/widget/TextView;->getMaxWidth()I

    move-result p1

    if-eq p1, p3, :cond_c1

    .line 29
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 30
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 31
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 32
    :cond_c1
    :goto_c1
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->j:Landroid/widget/TextView;

    invoke-static {p1}, Lc/c/a/h;->a(Landroid/widget/TextView;)Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 33
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->k:Landroid/widget/TextView;

    invoke-static {p1}, Lc/c/a/h;->a(Landroid/widget/TextView;)Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 34
    iget-object p1, p0, Lcom/hjq/bar/TitleBar;->l:Landroid/widget/TextView;

    invoke-static {p1}, Lc/c/a/h;->a(Landroid/widget/TextView;)Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 35
    new-instance p1, Lcom/hjq/bar/TitleBar$a;

    invoke-direct {p1, p0}, Lcom/hjq/bar/TitleBar$a;-><init>(Lcom/hjq/bar/TitleBar;)V

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 6

    .line 1
    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_8

    const/4 v0, -0x1

    .line 2
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3
    :cond_8
    iget v0, p0, Lcom/hjq/bar/TitleBar;->n:I

    const/4 v2, 0x0

    .line 4
    iget v3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v3, v1, :cond_11

    .line 5
    iget v2, p0, Lcom/hjq/bar/TitleBar;->o:I

    .line 6
    :cond_11
    invoke-virtual {p0, v0, v2}, Lcom/hjq/bar/TitleBar;->a(II)Lcom/hjq/bar/TitleBar;

    .line 7
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
